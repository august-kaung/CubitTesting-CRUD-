import 'package:crud/bloc/post/post_contact_cubit.dart';
import 'package:crud/data/modal/contact_vo.dart';
import 'package:crud/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostContactCubit>(
      create: (context) => PostContactCubit(getIt.call()),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Add Screen'),
          ),
          body: BlocBuilder<PostContactCubit, PostContactState>(
            builder: (context, state) {
              if (state is PostContactLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is PostContactSuccessState) {
                return Center(
                  child: Column(
                    children: [
                      const Text("Successful"),
                      MaterialButton(
                          child: const Text('Back To ContactList'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          })
                    ],
                  ),
                );
              } else if (state is PostContactFailState) {
                return Text(state.errorMessage);
              }
              return const FormWidget();
            },
          )),
    );
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  String? _name, _age, _job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              onSaved: (text) => _name = text,
              decoration: const InputDecoration(
                  hintText: 'Enter Name', border: OutlineInputBorder()),
              validator: (val) {
                if (val?.isEmpty ?? false) {
                  return 'Should Not Be Empty';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              onSaved: (text) => _job = text,
              decoration: const InputDecoration(
                  hintText: 'Enter Job', border: OutlineInputBorder()),
              validator: (val) {
                if (val?.isEmpty ?? false) {
                  return 'Should Not Be Empty';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              onSaved: (text) => _age = text,
              decoration: const InputDecoration(
                  hintText: 'Enter Age', border: OutlineInputBorder()),
              validator: (val) {
                if (val?.isEmpty ?? false) {
                  return 'Should Not Be Empty';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    ContactVO newContact = ContactVO(
                        '${DateTime.now().microsecond}', _name, _job, _age);
                    BlocProvider.of<PostContactCubit>(context)
                        .addContact(newContact);
                  }
                },
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}
