import 'package:flutter_parking_spot_mobile_app/utils/enums/ui_enums.dart';

extension ParkingAreaTypeExtension on ParkingAreaType {
  String get uiName {
    switch (this) {
      case ParkingAreaType.onStreet:
        return 'On Street';
      case ParkingAreaType.offStreet:
        return 'Off Street';
      case ParkingAreaType.garageParking:
        return 'Garage';
      default:
        return '';
    }
  }
}

extension AreaSafetyExtension on AreaSafety {
  String get uiName {
    switch (this) {
      case AreaSafety.safe:
        return 'Safe';
      case AreaSafety.warning:
        return 'Moderate';
      case AreaSafety.danger:
        return 'Dangerous';
      default:
        return '';
    }
  }
}

extension ParkingLotTypeExtension on ParkingSlotType {
  String get uiName {
    switch (this) {
      case ParkingSlotType.parallel:
        return 'Parallel';
      case ParkingSlotType.angled:
        return 'Angled';
      case ParkingSlotType.perpendicular:
        return 'Perpendicular';
      default:
        return '';
    }
  }
}
