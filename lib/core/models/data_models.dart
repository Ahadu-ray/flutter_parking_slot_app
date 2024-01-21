import 'package:flutter_parking_spot_mobile_app/utils/enums/ui_enums.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TownDetailModel {
  final String id;
  final String? name;
  final String? description;
  final String? imageUrl;
  final double? latitude;
  final double? longitude;
  final List<ParkingAreaModel>? parkingAreas;
  final AreaSafety? safety;
  final int? totalAvailableParkingAreas;
  final double? radius;
  final double? averagePricePerHour;
  final List<ParkingAreaType>? parkingAreaTypes;

  TownDetailModel({
    required this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.latitude,
    this.longitude,
    this.parkingAreas,
    this.safety,
    this.totalAvailableParkingAreas,
    this.radius = 1000,
    this.averagePricePerHour,
    this.parkingAreaTypes,
  });

  factory TownDetailModel.fromJson(Map<String, dynamic> json) {
    return TownDetailModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      parkingAreas: json['parkingAreas'] != null
          ? (json['parkingAreas'] as List)
              .map((e) => ParkingAreaModel.fromJson(e))
              .toList()
          : null,
      safety: json['safety'] != null
          ? AreaSafety.values.firstWhere(
              (element) => element.name == json['safety'],
              orElse: () => AreaSafety.safe,
            )
          : null,
      totalAvailableParkingAreas: json['totalAvailableParkingAreas'],
      radius: json['radius'],
      averagePricePerHour: json['averagePricePerHour'],
      parkingAreaTypes: json['parkingAreaTypes'] != null
          ? (json['parkingAreaTypes'] as List)
              .map((e) => ParkingAreaType.values.firstWhere(
                    (element) => element.name == e,
                    orElse: () => ParkingAreaType.onStreet,
                  ))
              .toList()
          : null,
    );
  }
}

class ParkingAreaModel {
  final String id;
  final String? name;
  final String? address;
  final String? description;
  final String? imageUrl;
  final LatLng? center;
  final List<LatLng>? polygon;
  final int? totalSlots;
  final int? availableSlots;
  final int? occupiedSlots;
  final int? reservedSlots;
  final int? pricePerHour;
  final AreaSafety? safety;
  final ParkingAreaType? parkingAreaType;
  final List<ParkingSlotType>? parkingSlotTypes;
  final double? rating;

  ParkingAreaModel({
    required this.id,
    this.name,
    this.address,
    this.description,
    this.imageUrl,
    this.center,
    this.polygon,
    this.totalSlots,
    this.availableSlots,
    this.occupiedSlots,
    this.reservedSlots,
    this.pricePerHour,
    this.safety,
    this.parkingAreaType,
    this.parkingSlotTypes,
    this.rating,
  });

  factory ParkingAreaModel.fromJson(Map<String, dynamic> json) {
    return ParkingAreaModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      center: json['center'] != null
          ? LatLng(json['center']['latitude'], json['center']['longitude'])
          : null,
      polygon: json['polygon'] != null
          ? (json['polygon'] as List)
              .map((e) => LatLng(e['latitude'], e['longitude']))
              .toList()
          : null,
      totalSlots: json['totalSlots'],
      availableSlots: json['availableSlots'],
      occupiedSlots: json['occupiedSlots'],
      reservedSlots: json['reservedSlots'],
      pricePerHour: json['pricePerHour'],
      safety: json['safety'] != null
          ? AreaSafety.values.firstWhere(
              (element) => element.name == json['safety'],
              orElse: () => AreaSafety.safe,
            )
          : null,
      parkingAreaType: json['parkingAreaType'] != null
          ? ParkingAreaType.values.firstWhere(
              (element) => element.name == json['parkingAreaType'],
              orElse: () => ParkingAreaType.onStreet,
            )
          : null,
      parkingSlotTypes: json['parkingSlotTypes'] != null
          ? (json['parkingSlotTypes'] as List)
              .map((e) => ParkingSlotType.values.firstWhere(
                    (element) => element.name == e,
                    orElse: () => ParkingSlotType.parallel,
                  ))
              .toList()
          : null,
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'description': description,
      'imageUrl': imageUrl,
      'center': center != null
          ? {'latitude': center!.latitude, 'longitude': center!.longitude}
          : null,
      'polygon': polygon
          ?.map((e) => {'latitude': e.latitude, 'longitude': e.longitude})
          .toList(),
      'totalSlots': totalSlots,
      'availableSlots': availableSlots,
      'occupiedSlots': occupiedSlots,
      'reservedSlots': reservedSlots,
      'pricePerHour': pricePerHour,
      'safety': safety?.name,
      'parkingAreaType': parkingAreaType?.name,
      'parkingSlotTypes': parkingSlotTypes?.map((e) => e.name).toList(),
      'rating': rating,
    };
  }
}
