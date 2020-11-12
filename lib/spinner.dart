import 'package:flutter/material.dart';

import 'DropExample.dart';

class Spinner extends StatefulWidget {
  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Container(
          child: Column(
            children: [
              Text("Bom dia!"),
              DropExample(),
              Text("Boa tarde!"),
            ],
          ),
        ),
      )
    );
  }
}
