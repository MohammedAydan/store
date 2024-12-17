import 'package:store_app/data/models/inital_card_model.dart';
import 'package:store_app/data/services/inital_card/i_inital_card_service.dart';

class InitalCardRepository {
  final IInitalCardService _initalCardService;

  InitalCardRepository(this._initalCardService);

  Future<List<InitalCardModel>> getInitalCardList() async {
    final res = await _initalCardService.getInitalCardList();
    return res.map((c) => InitalCardModel.fromJson(c)).toList();
  }

  Future<InitalCardModel> createInitalCard(InitalCardModel initalCard) async {
    final res = await _initalCardService.createInitalCard(initalCard.toJson());
    return InitalCardModel.fromJson(res);
  }

  Future<InitalCardModel> updateInitalCard(InitalCardModel initalCard) async {
    final res = await _initalCardService.updateInitalCard(initalCard.toJson());
    return InitalCardModel.fromJson(res);
  }

  Future<void> deleteInitalCard(String id) async {
    await _initalCardService.deleteInitalCard(id);
  }
}
