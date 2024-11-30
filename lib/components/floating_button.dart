import 'package:flutter/material.dart';

class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100), //角の丸み
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('/post/add');
      },
      backgroundColor: Colors.greenAccent[400],
      child: const Icon(Icons.add),
    );
  }
}
