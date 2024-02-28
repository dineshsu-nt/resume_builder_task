import 'package:get/get.dart';
import 'package:resume_task/create_resume/controller/create_resumne_controller.dart';

class CreateResumeBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(ResumeController());
    // TODO: implement dependencies
  }


}