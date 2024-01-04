import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 50.0, right: 10),
      // margin: const EdgeInsets.symmetric(vertical: 8.0),
      height: 1.0,
      color: Colors.grey[300], // Adjust the color of the divider as needed
    );
  }
}
