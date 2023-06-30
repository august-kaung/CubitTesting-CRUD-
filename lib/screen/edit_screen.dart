import 'package:crud/bloc/put/edit_cubit.dart';
import 'package:crud/data/modal/contact_vo.dart';
import 'package:crud/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key, required this.contactVO});

  final ContactVO contactVO;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditCubit>(
      create: (context) => EditCubit(getIt.call()),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Add Screen'),
          ),
          body: BlocBuilder<EditCubit, EditState>(
            builder: (context, state) {
              if (state is EditLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is EditSuccessState) {
                return Center(
                  child: Column(
                    children: [
                      const Text("Edited Successful"),
                      MaterialButton(
                          child: const Text('Back To ContactList'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          })
                    ],
                  ),
                );
              } else if (state is EditFailState) {
                return Text(state.errorMessage);
              } else {
                return FormWidget(
                  contactVO: contactVO,
                );
              }
            },
          )),
    );
  }
}

class FormWidget extends StatefulWidget {
  final ContactVO contactVO;

  const FormWidget({super.key, required this.contactVO});

  @override
  // ignore: no_logic_in_create_state
  State<FormWidget> createState() => _FormWidgetState(contactVO);
}

class _FormWidgetState extends State<FormWidget> {
  final ContactVO contactVO;

  _FormWidgetState(this.contactVO);

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
              initialValue: contactVO.name,
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
              initialValue: contactVO.job,
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
              initialValue: contactVO.age,
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
                    BlocProvider.of<EditCubit>(context)
                        .editInfo(contactVO.id.toString(), newContact);
                  }
                },
                child: const Text('Update'))
          ],
        ),
      ),
    );
  }
}
