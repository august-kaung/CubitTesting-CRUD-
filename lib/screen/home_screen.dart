import 'package:crud/bloc/get/getcontact_cubit.dart';
import 'package:crud/data/modal/contact_vo.dart';
import 'package:crud/screen/add_screen.dart';
import 'package:crud/screen/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetContactCubit>(context).getContact();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddScreen()));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<GetContactCubit>(context).getContact();
              },
              icon: const Icon(Icons.refresh))
        ],
        title: const Text('HomeScreen'),
      ),
      body: BlocBuilder<GetContactCubit, GetContactState>(
        builder: (context, state) {
          if (state is GetContactInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetContactSuccess) {
            //BlocProvider.of<GetContactCubit>(context).getContact();
            List<ContactVO> contactList = state.contactList;
            return ListView.builder(
                itemCount: contactList.length,
                itemBuilder: (context, index) {
                  return item(contactList[index]);
                });
          } else if (state is GetContactError) {
            return Text(state.errorMessage);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

Widget item(ContactVO contactVO) {
  return Slidable(
    startActionPane: ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          flex: 2,
          onPressed: (context) async {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditScreen(contactVO: contactVO)));
          },
          backgroundColor: Colors.amber,
          icon: Icons.edit,
          label: 'Edit',
        )
      ],
    ),
    endActionPane: ActionPane(motion: const ScrollMotion(), children: [
      SlidableAction(
        flex: 5,
        onPressed: (context) {
          BlocProvider.of<GetContactCubit>(context)
              .deleteInfo(contactVO.id ?? '');
        },
        backgroundColor: Colors.red,
        icon: Icons.delete,
        label: 'Delete',
      )
    ]),
    child: Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text((contactVO.age).toString()),
        ),
        title: Text(contactVO.name ?? ''),
        subtitle: Text(contactVO.job ?? ''),
      ),
    ),
  );
}
