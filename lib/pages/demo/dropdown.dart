import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          iconEnabledColor: Color(0xffffffff),
          dropdownColor: Color(0xff666666),
          underline: SizedBox(),
          onChanged: (String newValue) async {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: <String>[
            'English',
            'Spanish',
            'Dutch',
            'Polish',
            "French",
            "German"
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: TextStyle(color: Color(0xffffffff))),
            );
          }).toList(),
        ),
      ),
    );
  }
}
