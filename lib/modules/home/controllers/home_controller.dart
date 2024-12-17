import 'package:get/get.dart';
import 'package:store_app/data/models/inital_card_model.dart';
import 'package:store_app/data/repositories/inital_card_repository.dart';
import 'package:store_app/routes/app_routes.dart';

class HomeController extends GetxController {
  final InitalCardRepository _initalCardRepository;
  final RxList<InitalCardModel> initialCards = <InitalCardModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = "".obs;

  HomeController(this._initalCardRepository);

  void getInitalCards() async {
    try {
      error.value = "";
      isLoading.value = true;
      final res = await _initalCardRepository.getInitalCardList();
      initialCards.assignAll(res);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getInitalCards();
    super.onInit();
  }

  Future? getRoute(InitalCardModel icm) {
    String route = icm.route.toLowerCase();
    if (route.contains(AppRoutes.product.toLowerCase())) {
      return Get.toNamed(AppRoutes.product);
    } else if (route.contains(AppRoutes.cart.toLowerCase())) {
      return Get.toNamed(AppRoutes.cart);
    } else if (route.contains(AppRoutes.account.toLowerCase())) {
      return Get.toNamed(AppRoutes.cart);
    }
    // add routes
    return null;
  }
}
