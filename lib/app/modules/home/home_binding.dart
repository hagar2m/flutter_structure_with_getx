import './home_controller.dart';
import '../../data/providers/api_provider.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<HomeController>(() {
    //   return HomeController(
    //       repository:
    //       MyRepository(apiClient: MyApiClient(httpClient: http.Client())));
    // });
  }
}
