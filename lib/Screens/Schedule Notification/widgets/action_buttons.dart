import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    Key? key,
    required this.onCreate,
    required this.onCancel,
  }) : super(key: key);
  final VoidCallback onCreate;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onCancel,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Colors.grey[200],
          ),
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.black87),
          ),
        ),
        SizedBox(width: 20.0),
        MaterialButton(
          color: Color(0xff6d96fa),
          onPressed: onCreate,
          child: Text("Create"),
        ),
      ],
    );
  }
}
