
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:resume_task/create_resume/bindings/create_resumne_bindings.dart';
import 'package:resume_task/home/bindings/home_bindings.dart';
import 'package:resume_task/home/view/home_view.dart';

import '../create_resume/view/create_resume.dart';

List<GetPage> getPages = [
  GetPage(
      name: RouteConstant.createResume,
      page: () =>  CreateResumeView(),
      binding: CreateResumeBindings()),
  GetPage(
      name: RouteConstant.homeScreen,
      page: () =>  HomeView(),
      binding: HomeBindings()),
];
class RouteConstant{
  static const String createResume = '/create_resume_view';
  static const String homeScreen = '/home_screen';
}