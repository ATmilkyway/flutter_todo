import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String todoTask;
  final bool isCompleted;

  const TodoTile({
    super.key,
    required this.todoTask,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),

          child: Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Checkbox(value: isCompleted, onChanged: (context) {}),
              ),
              Text(
                todoTask,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF1B1B1D),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
