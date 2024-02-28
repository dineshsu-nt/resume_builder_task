import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:resume_task/firebase_options.dart';
import 'package:resume_task/home/bindings/home_bindings.dart';

import 'package:resume_task/utils/routes.dart';
import 'package:sizer/sizer.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My App',
        getPages: getPages,
        initialRoute: RouteConstant.homeScreen,
        initialBinding: HomeBindings(),
      );
    });
  }
}
