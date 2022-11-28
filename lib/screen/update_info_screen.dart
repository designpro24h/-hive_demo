// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hive_demo/utils/update_person_frm.dart';

import '../model/person.dart';

class UpdateInfoPerson extends StatefulWidget {
  final int index;
  final Person person;

  const UpdateInfoPerson({
    Key? key,
    required this.index,
    required this.person,
  }) : super(key: key);

  @override
  State<UpdateInfoPerson> createState() => _UpdateInfoPersonState();
}

class _UpdateInfoPersonState extends State<UpdateInfoPerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: UpdatePersonForm(
          index: widget.index,
          person: widget.person,
        ),
      ),
    );
  }
}
