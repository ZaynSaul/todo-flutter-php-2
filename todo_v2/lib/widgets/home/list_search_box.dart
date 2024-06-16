import 'package:flutter/material.dart';
import 'package:todo_v2/controllers/todo_controller.dart';

class ListSearchBox extends StatelessWidget {
  const ListSearchBox({super.key, required this.controller});

  final TodoController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            size: 25,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              controller.showSearch.value = false;
            },
            icon: const Icon(
              Icons.arrow_forward_rounded,
              size: 30,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60.0),
          ),
        ),
      ),
    );
  }
}
