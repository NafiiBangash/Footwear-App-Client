import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  const MyButton({super.key,required this.title,required this.onTap, required this.loading});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 50,
      width: size.width * 0.5,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple),
        child: loading? const CircularProgressIndicator(
          color: Colors.white,
        ):Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
