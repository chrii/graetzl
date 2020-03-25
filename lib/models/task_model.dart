class Task {
  final int taskId;
  final int user;
  final String taskName;
  final String image;
  final String taskType;
  final List<double> coordinates;
  final List<int> category;
  final String taskDescription;

  Task(
      {this.taskId,
      this.user,
      this.taskName,
      this.image,
      this.taskType,
      this.coordinates,
      this.category,
      this.taskDescription});
}
