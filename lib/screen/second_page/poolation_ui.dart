import 'package:flutter/material.dart';

Widget poolationData(
  BuildContext context,
  Size size,
  String name,
  var name2,
  var good,
  var fair,
  var moderate,
  var poor,
) =>
    Expanded(
        child: Container(
      color: name2 < good
          ? Colors.blue[200]
          : name2 < fair
              ? Colors.blue[300]
              : name2 < moderate
                  ? Colors.green
                  : name2 < poor
                      ? Colors.yellow
                      : Colors.red,
      height: size.height * 0.16,
      width: size.width * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text('$name'), Text('${name2.toStringAsFixed(1)}')],
      ),
    ));
