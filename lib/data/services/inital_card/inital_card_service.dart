import 'dart:async';
import 'package:flutter/material.dart';
import 'package:store_app/data/models/inital_card_model.dart';
import 'package:store_app/data/services/inital_card/i_inital_card_service.dart';

class InitalCardService implements IInitalCardService {
  final List<dynamic> _initalCards = [
    InitalCardModel(
      id: "2312e",
      title: "Offers 1",
      description: "Offers description",
      image: "https://picsum.photos/500?random=1",
      route: "/product?id=1212",
      color: Colors.grey.withOpacity(0.4).toString(),
    ).toJson(),
    InitalCardModel(
      id: "2312e",
      title: "Offers 2",
      description: "Offers description",
      image: "https://picsum.photos/500?random=2",
      route: "/cart",
      color: Colors.grey.withOpacity(0.4).toString(),
    ).toJson(),
    InitalCardModel(
      id: "2312e",
      title: "Offers 3",
      description: "Offers description",
      image: "https://picsum.photos/500?random=3",
      route: "/offers?offer=3&category=3",
      color: Colors.grey.withOpacity(0.4).toString(),
    ).toJson(),
    InitalCardModel(
      id: "2312e",
      title: "Offers 4",
      description: "Offers description",
      image: "https://picsum.photos/500?random=4",
      route: "/offers?offer=4&category=4",
      color: Colors.grey.withOpacity(0.4).toString(),
    ).toJson(),
  ];

  @override
  Future<dynamic> createInitalCard(dynamic initalCard) async {
    await Future.delayed(const Duration(seconds: 1));
    initalCard['id'] = "${_initalCards.length * _initalCards.length}";
    _initalCards.add(initalCard);
    return initalCard;
  }

  @override
  Future<void> deleteInitalCard(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    _initalCards.removeWhere((card) => card['id'] == id);
  }

  @override
  Future<List<dynamic>> getInitalCardList() async {
    await Future.delayed(const Duration(seconds: 3));
    return _initalCards;
  }

  @override
  Future<dynamic> updateInitalCard(dynamic initalCard) async {
    await Future.delayed(const Duration(seconds: 1));
    int index =
        _initalCards.indexWhere((card) => card['id'] == initalCard['id']);
    if (index != -1) {
      _initalCards[index] = initalCard;
    }
    return initalCard;
  }
}
