import 'package:flutter_parking_spot_mobile_app/core/models/data_models.dart';
import 'package:flutter_parking_spot_mobile_app/utils/enums/ui_enums.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeRepository {
  Future<List<ParkingAreaModel>> getParkingAreas(Position from) async {
    return [
      ParkingAreaModel(
        id: "1",
        name: "Lebu Promise Building",
        center: const LatLng(8.950463601901554, 38.71939368209245),
        polygon: const [
          LatLng(8.95045341377963, 38.71900480981972),
          LatLng(8.950130595973107, 38.719408022012985),
          LatLng(8.950536928787407, 38.71977058781579),
          LatLng(8.950834049332737, 38.719365749766915),
        ],
        address: "Lebu Muzika Sefer",
        availableSlots: 10,
        totalSlots: 20,
        pricePerHour: 10,
        description: "Basement Parking Area",
        imageUrl: "",
        occupiedSlots: 10,
        reservedSlots: 0,
        safety: AreaSafety.safe,
        parkingAreaType: ParkingAreaType.garageParking,
        parkingSlotTypes: [
          ParkingSlotType.perpendicular,
          ParkingSlotType.angled
        ],
      ),
      ParkingAreaModel(
        id: "2",
        name: "Fikre Kunispagna",
        center: const LatLng(8.949343213981537, 38.720447991856496),
        polygon: const [
          LatLng(8.949500720597625, 38.7200516207421),
          LatLng(8.949317629457088, 38.72043044510108),
          LatLng(8.94907029566481, 38.72038817285502),
          LatLng(8.949097598754031, 38.720436948523556),
          LatLng(8.94929996276322, 38.72047434320277),
          LatLng(8.94925499299312, 38.720630425342094),
          LatLng(8.949417205351967, 38.72065969074321),
          LatLng(8.94956335701928, 38.72028574395108),
        ],
        address: "Lebu Medhanialem",
        availableSlots: 3,
        totalSlots: 30,
        pricePerHour: 15,
        description: "Lebu Medhanialem",
        imageUrl: "",
        occupiedSlots: 10,
        reservedSlots: 0,
        safety: AreaSafety.warning,
        parkingAreaType: ParkingAreaType.onStreet,
        parkingSlotTypes: [
          ParkingSlotType.parallel,
          ParkingSlotType.perpendicular,
          ParkingSlotType.angled,
        ],
      ),
      // TownDetailModel(
      //     id: "1",
      //     name: "Lebu Musika Sefer",
      //     latitude: 8.95001433658335,
      //     longitude: 38.71928235760839,
      //     description: "Includes Basement and Hotel Parking",
      //     imageUrl: "",
      //     parkingAreas: [

      //     ],
      //     safety: AreaSafety.safe,
      //     totalAvailableParkingAreas: 10,
      //     radius: 300,
      //     averagePricePerHour: 30,
      //     parkingAreaTypes: [
      //       ParkingAreaType.onStreet,
      //       ParkingAreaType.offStreet,
      //       ParkingAreaType.garageParking,
      //     ]),
      // TownDetailModel(
      //     id: "2",
      //     name: "Lebu Medhanialem",
      //     latitude: 8.952802306675572,
      //     longitude: 38.7159259003641,
      //     description: "Areas infron of the church",
      //     imageUrl: "",
      //     parkingAreas: [],
      //     safety: AreaSafety.warning,
      //     totalAvailableParkingAreas: 10,
      //     radius: 100,
      //     averagePricePerHour: 12.5,
      //     parkingAreaTypes: [
      //       ParkingAreaType.onStreet,
      //     ]),
      // TownDetailModel(
      //   id: "3",
      //   name: "Gara Mart",
      //   latitude: 8.948546828126688,
      //   longitude: 38.7292915442601,
      //   description: "Supermarket Parking Area. Advised to be cautious",
      //   imageUrl: "",
      //   parkingAreas: [],
      //   safety: AreaSafety.danger,
      //   totalAvailableParkingAreas: 10,
      //   radius: 200,
      //   averagePricePerHour: 12.5,
      //   parkingAreaTypes: [
      //     ParkingAreaType.garageParking,
      //   ],
      // ),
    ];
  }
}
