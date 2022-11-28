import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../model/person.dart';

class UpdatePersonForm extends StatefulWidget {
  final int index;
  final Person person;
  const UpdatePersonForm({super.key, required this.index, required this.person});

  @override
  State<UpdatePersonForm> createState() => _UpdatePersonFormState();
}

class _UpdatePersonFormState extends State<UpdatePersonForm> {
  final _personFormKey = GlobalKey<FormState>();

  late final _nameController;
  late final _addressController;
  late final _phoneController;

  late final Box box;

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be emty';
    }
    return null;
  }

  // Function Updated
  _updateInfoPerson() {
    Person updatePerson = Person(
      name: _nameController.text,
      phone: _phoneController.text,
      address: _addressController.text,
    );

    var userupdate = box.putAt(widget.index, updatePerson);
    print('$userupdate updated');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    box = Hive.box('myInfo');
    _nameController = TextEditingController(text: widget.person.name);
    _phoneController = TextEditingController(text: widget.person.phone);
    _addressController = TextEditingController(text: widget.person.address);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _personFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Your name"),
          TextFormField(
            controller: _nameController,
            validator: _fieldValidator,
          ),
          const SizedBox(height: 10),
          const Text("Your Phone"),
          TextFormField(
            controller: _phoneController,
            validator: _fieldValidator,
          ),
          const SizedBox(height: 10),
          const Text("Your Address"),
          TextFormField(
            controller: _addressController,
            validator: _fieldValidator,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_personFormKey.currentState!.validate()) {
                    _updateInfoPerson();
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Update'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
