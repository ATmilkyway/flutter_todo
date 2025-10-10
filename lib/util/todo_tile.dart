import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String todoTask;
  final bool isCompleted;
  final Function(bool?)? onChanged;

  const TodoTile({
    super.key,
    required this.todoTask,
    required this.isCompleted,
    required this.onChanged,
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
                child: Checkbox(value: isCompleted, onChanged: onChanged),
              ),
              Text(
                todoTask,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF1B1B1D),
                  decoration: isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Color(0xFF4A3780),
                  decorationThickness: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
