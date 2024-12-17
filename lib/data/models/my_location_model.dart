// To parse this JSON data, do
//
//     final myLocationModel = myLocationModelFromJson(jsonString);

import 'dart:convert';

MyLocationModel myLocationModelFromJson(String str) => MyLocationModel.fromJson(json.decode(str));

String myLocationModelToJson(MyLocationModel data) => json.encode(data.toJson());

class MyLocationModel {
    int placeId;
    String licence;
    String osmType;
    int osmId;
    String lat;
    String lon;
    String myLocationModelClass;
    String type;
    int placeRank;
    double importance;
    String addresstype;
    String name;
    String displayName;
    Address address;
    List<String> boundingbox;

    MyLocationModel({
        required this.placeId,
        required this.licence,
        required this.osmType,
        required this.osmId,
        required this.lat,
        required this.lon,
        required this.myLocationModelClass,
        required this.type,
        required this.placeRank,
        required this.importance,
        required this.addresstype,
        required this.name,
        required this.displayName,
        required this.address,
        required this.boundingbox,
    });

    factory MyLocationModel.fromJson(Map<String, dynamic> json) => MyLocationModel(
        placeId: json["place_id"],
        licence: json["licence"],
        osmType: json["osm_type"],
        osmId: json["osm_id"],
        lat: json["lat"],
        lon: json["lon"],
        myLocationModelClass: json["class"],
        type: json["type"],
        placeRank: json["place_rank"],
        importance: json["importance"]?.toDouble(),
        addresstype: json["addresstype"],
        name: json["name"],
        displayName: json["display_name"],
        address: Address.fromJson(json["address"]),
        boundingbox: List<String>.from(json["boundingbox"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "place_id": placeId,
        "licence": licence,
        "osm_type": osmType,
        "osm_id": osmId,
        "lat": lat,
        "lon": lon,
        "class": myLocationModelClass,
        "type": type,
        "place_rank": placeRank,
        "importance": importance,
        "addresstype": addresstype,
        "name": name,
        "display_name": displayName,
        "address": address.toJson(),
        "boundingbox": List<dynamic>.from(boundingbox.map((x) => x)),
    };
}

class Address {
    String road;
    String neighbourhood;
    String suburb;
    String city;
    String state;
    String iso31662Lvl4;
    String postcode;
    String country;
    String countryCode;

    Address({
        required this.road,
        required this.neighbourhood,
        required this.suburb,
        required this.city,
        required this.state,
        required this.iso31662Lvl4,
        required this.postcode,
        required this.country,
        required this.countryCode,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        road: json["road"],
        neighbourhood: json["neighbourhood"],
        suburb: json["suburb"],
        city: json["city"],
        state: json["state"],
        iso31662Lvl4: json["ISO3166-2-lvl4"],
        postcode: json["postcode"],
        country: json["country"],
        countryCode: json["country_code"],
    );

    Map<String, dynamic> toJson() => {
        "road": road,
        "neighbourhood": neighbourhood,
        "suburb": suburb,
        "city": city,
        "state": state,
        "ISO3166-2-lvl4": iso31662Lvl4,
        "postcode": postcode,
        "country": country,
        "country_code": countryCode,
    };
}
