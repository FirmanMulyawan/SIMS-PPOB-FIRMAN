import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isObscureText = true;

  HomeController();

  void updateIsObscureText(bool? value) {
    isObscureText = value!;
    update();
  }
}
