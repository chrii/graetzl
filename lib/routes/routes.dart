import 'package:graetzl/routes/task_detail_route.dart';
import 'user_profile_route.dart';
import './category_route.dart';
import './registration_route.dart';

final routes = {
  "/categories": (_) => CategoryRoute(),
  "/detail": (_) => TaskDetailRoute(),
  "/user-page": (_) => UserProfileRoute(),
  "/registration": (_) => RegistrationRoute()
};
