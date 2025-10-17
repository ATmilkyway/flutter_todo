import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HivePractice extends StatefulWidget {
  const HivePractice({super.key});

  @override
  State<HivePractice> createState() => _HivePracticeState();
}

class _HivePracticeState extends State<HivePractice> {
  final _myBox = Hive.box('mybox');

  // write data
  void writeData() {
    _myBox.put(1, 'Milky');
  }

  // read data
  void readData() {
    print(_myBox.get(1));
  }

  // delete data
  void deleteData() {
    _myBox.delete(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: writeData,
              child: Text('Write', style: TextStyle(color: Colors.white)),
              color: Colors.deepPurple[400],
            ),
            MaterialButton(
              onPressed: readData,
              child: Text('Read', style: TextStyle(color: Colors.white)),
              color: Colors.deepPurple[400],
            ),
            MaterialButton(
              onPressed: deleteData,
              child: Text('Delete', style: TextStyle(color: Colors.white)),
              color: Colors.deepPurple[400],
            ),
          ],
        ),
      ),
    );
  }
}
