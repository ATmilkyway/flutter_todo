import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String todoTask;
  final bool isCompleted;
  final Function(bool?)? onChanged;
  final void Function(BuildContext)? onDelete;

  const TodoTile({
    super.key,
    required this.todoTask,
    required this.isCompleted,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: onDelete,
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
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
      ),
    );
  }
}
