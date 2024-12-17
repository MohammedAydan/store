import 'package:get/get.dart';
import 'package:store_app/data/models/inital_card_model.dart';
import 'package:store_app/data/repositories/inital_card_repository.dart';

class InitalCardSettingsController extends GetxController {
  final InitalCardRepository _cardRepository;
  RxBool isLoading = false.obs;
  RxInt page = 1.obs;
  RxInt limit = 10.obs;
  RxString error = ''.obs;
  RxList<InitalCardModel> cards = RxList([]);
  Rx<InitalCardModel> editingCard = InitalCardModel.empty().obs;

  InitalCardSettingsController(this._cardRepository);

  @override
  void onInit() {
    super.onInit();
    getInitalCards();
  }

  void getInitalCards() async {
    try {
      error.value = "";
      isLoading.value = true;
      final res = await _cardRepository.getInitalCardList();
      cards.assignAll(res);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void addInitalCard() async {
    try {
      error.value = "";
      isLoading.value = true;
      await _cardRepository.createInitalCard(editingCard.value);
      cards.add(editingCard.value);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void updateInitalCard(InitalCardModel card) async {
    try {
      error.value = "";
      isLoading.value = true;
      await _cardRepository.updateInitalCard(card);
      int index = cards.indexWhere((c) => c.id == card.id);
      if (index != -1) {
        cards[index] = card;
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void deleteInitalCard(String cardId) async {
    try {
      error.value = "";
      isLoading.value = true;
      await _cardRepository.deleteInitalCard(cardId);
      cards.removeWhere((card) => card.id == cardId);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void setEditingCard(InitalCardModel model) {
    editingCard.value = model;
  }
}
