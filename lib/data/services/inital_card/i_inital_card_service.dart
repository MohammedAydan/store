
abstract class IInitalCardService {
  Future<List<dynamic>> getInitalCardList();
  Future<dynamic> createInitalCard(dynamic initalCard);
  Future<dynamic> updateInitalCard(dynamic initalCard);
  Future<void> deleteInitalCard(String id);
}