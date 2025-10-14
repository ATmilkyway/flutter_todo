import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String btnText;
  final void Function()? onPressed;
  const MyButton({super.key, required this.btnText,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      // color: Theme.of(context).appBarTheme.backgroundColor,
      onPressed: onPressed,
      child: Text(
        btnText,
        style: TextStyle(fontSize: 14, color: Color(0xFF4A3780)),
      ),
    );
  }
}
