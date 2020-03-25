import 'package:graetzl/routes/task_detail_route.dart';

import './category_route.dart';

final routes = {
  "/categories": (_) => CategoryRoute(),
  "/detail": (_) => TaskDetailRoute()
};
