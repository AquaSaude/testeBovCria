import 'package:flutter/material.dart';

class CustomMenuButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final double width;
  final VoidCallback onPressed;

  const CustomMenuButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.width,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.lightGreen,
          disabledForegroundColor: Colors.grey,
          padding: const EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 28, color: Colors.white),
            Text(
              text,
              style: const TextStyle(fontSize: 22.0),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
