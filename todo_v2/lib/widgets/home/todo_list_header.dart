import 'package:flutter/material.dart';

class TodoListHeader extends StatelessWidget {
  const TodoListHeader({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(0),
            child: Center(
              child: IconButton(
                alignment: Alignment.center,
                onPressed: onPressed,
                mouseCursor: MouseCursor.defer,
                icon: const Icon(Icons.more_horiz_rounded),
                iconSize: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
