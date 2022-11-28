import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../model/person.dart';

class AddPersonForm extends StatefulWidget {
  const AddPersonForm({super.key});

  @override
  State<AddPersonForm> createState() => _AddPersonFormState();
}

class _AddPersonFormState extends State<AddPersonForm> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _personFormKey = GlobalKey<FormState>();
  //
  late final Box box;

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be emty';
    }
    return null;
  }

  // Function Add to box
  _addInfo() async {
    Person newPerson = Person(
      name: _nameController.text,
      phone: _phoneController.text,
      address: _addressController.text,
    );

    box.add(newPerson);
    print('Add new person ');
  }

  //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    box = Hive.box('myInfo');
  }

  //
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _personFormKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 5),
              const Text('Your Name'),
              TextFormField(
                controller: _nameController,
                validator: _fieldValidator,
              ),
              const SizedBox(height: 5),
              const Text('Your Phone'),
              TextFormField(
                controller: _phoneController,
                validator: _fieldValidator,
              ),
              const SizedBox(height: 5),
              const Text('Your Address'),
              TextFormField(
                controller: _addressController,
                validator: _fieldValidator,
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_personFormKey.currentState!.validate()) {
                      _addInfo();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Add'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
