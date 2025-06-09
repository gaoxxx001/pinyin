import 'package:get/get.dart';
import 'package:flutter_test/flutter_test.dart';

class ApiService extends GetxService {
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    return "Hello from API";
  }

  @override
  void onInit() {
    super.onInit();
    print("ApiService onInit");
  }

  @override
  void onClose() {
    super.onClose();
    print("ApiService onClose");
  }
}

void main() {
  late ApiService apiService;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    // 可以直接使用实例，或者使用 mock
    apiService = ApiService();
    Get.put<ApiService>(apiService); // 依赖注入
  });

  tearDownAll(() {
    print("Executing tearDown");
    Get.delete<ApiService>(force: true);
  });


  group('ApiService', () {

    test('fetchData returns expected value2', () async {
      final result = await apiService.fetchData();
      expect(result, "Hello from API");
    });
    test('fetchData returns expected value3', () async {
      final result = await apiService.fetchData();
      expect(result, "Hello from API");
    });
    test('fetchData returns expected value4', () async {
      final result = await apiService.fetchData();
      expect(result, "Hello from API");
    });
    test('fetchData returns expected value5', () async {
      final result = await apiService.fetchData();
      expect(result, "Hello from API");
    });
  });
}
