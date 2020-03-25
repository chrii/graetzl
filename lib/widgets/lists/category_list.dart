import 'package:flutter/material.dart';
import '../cards/task_list_card.dart';

class CategoryList extends StatelessWidget {
  final List tasks;

  CategoryList(this.tasks);

  build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskListCard(
          title: task['taskName'],
          description: task['taskDescription'],
          type: task['taskType'],
        );
      },
    );
  }
}
