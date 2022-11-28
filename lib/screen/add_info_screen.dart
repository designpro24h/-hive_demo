import 'package:flutter/material.dart';
import 'package:hive_demo/utils/add_person_frm.dart';

class AddInfoScreen extends StatefulWidget {
  const AddInfoScreen({super.key});

  @override
  State<AddInfoScreen> createState() => _AddInfoScreenState();
}

class _AddInfoScreenState extends State<AddInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Info'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: AddPersonForm(),
      ),
    );
  }
}
