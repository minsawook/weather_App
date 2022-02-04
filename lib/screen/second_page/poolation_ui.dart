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
    Container(
      width: size.width * 0.43,
      height: size.height * 0.055,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: name2 < good
            ? Colors.blue[300]
            : name2 < fair
                ? Colors.lightGreen
                : name2 < moderate
                    ? Colors.yellow
                    : name2 < poor
                        ? Colors.orange
                        : Colors.red,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$name', style: TextStyle(color: Colors.white)),
          Text(
            '${name2.toStringAsFixed(1)}',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
