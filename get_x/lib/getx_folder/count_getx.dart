import 'package:get/get.dart';

class CounterControllerUsingGetX extends GetxController {
  var counter = 0.obs;

  void increment() {
    counter++;
    //update();
  }
}
