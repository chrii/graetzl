import 'package:flutter/material.dart';
import 'package:graetzl/models/task_model.dart';
import '../cards/task_list_card.dart';

class CategoryList extends StatelessWidget {
  final List<Task> tasks;

  CategoryList(this.tasks);

  build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskListCard(task);
      },
    );
  }
}
