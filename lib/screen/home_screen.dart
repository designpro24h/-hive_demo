import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_demo/screen/add_info_screen.dart';
import 'package:hive_demo/screen/update_info_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Box contactBox;
  // Functin Delete Data
  _deletePerson(int index) {
    contactBox.deleteAt(index);

    print('Item deleted from box at index: $index');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contactBox = Hive.box('myInfo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive Demo App'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => AddInfoScreen(),
          ),
        ),
        child: Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: contactBox.listenable(),
        builder: (BuildContext context, Box box, widget) {
          if (box.isEmpty) {
            return const Center(
              child: Text('Emty Data'),
            );
          } else {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                var currentBox = box;
                var personData = currentBox.getAt(index)!;
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => UpdateInfoPerson(
                          index: index,
                          person: personData,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(personData.name),
                    subtitle: Text(personData.phone),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.redAccent,
                      onPressed: () {
                        _deletePerson(index);
                        print('delete item');
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
