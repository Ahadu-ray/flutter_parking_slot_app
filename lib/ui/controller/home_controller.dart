// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_parking_spot_mobile_app/core/models/data_models.dart';
import 'package:flutter_parking_spot_mobile_app/core/repositories/home_repositories.dart';
import 'package:flutter_parking_spot_mobile_app/core/services/location_service.dart';
import 'package:flutter_parking_spot_mobile_app/utils/constants/data_constants.dart';
import 'package:flutter_parking_spot_mobile_app/utils/constants/icon_images.dart';
import 'package:flutter_parking_spot_mobile_app/utils/enums/ui_enums.dart';
import 'package:flutter_parking_spot_mobile_app/utils/functions.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
//dependencies
  final HomeRepository repository;
  final LocationService locationService;

  HomeController({
    required this.repository,
    required this.locationService,
  });

//properties
  final _status = RxStatus.empty().obs;
  RxStatus get status => _status.value;
  set status(RxStatus value) => _status.value = value;

  late GoogleMapController mapController;
  LatLng currentLocation = kGooglePlex.target;
  // Placemark? currentLocationPlace;
  Rx<Completer<GoogleMapController>> mapCompleter =
      Completer<GoogleMapController>().obs;
  // StreamSubscription? _positionStream;

//markers
  final _markers = <Marker>{}.obs;
  Set<Marker> get markers => _markers.value;
  set markers(Set<Marker> value) => _markers.value = value;

//currently viewed polyline
  final _polylines = <Polyline>{}.obs;
  get polylines => _polylines.value;
  set polylines(value) => _polylines.value = value;

  BitmapDescriptor fullParkingSpace = BitmapDescriptor.defaultMarker;
  BitmapDescriptor freeParkingSpace = BitmapDescriptor.defaultMarker;
  BitmapDescriptor midParkingSpace = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  final _currentLocationMarker = Marker(
    markerId: MarkerId(MarkerIds.currentLocationMarker.name),
    position: kGooglePlex.target,
    icon: BitmapDescriptor.defaultMarker,
    infoWindow: const InfoWindow(title: "Current Location"),
  ).obs;
  Marker get currentLocationMarker => _currentLocationMarker.value;
  set currentLocationMarker(Marker value) =>
      _currentLocationMarker.value = value;

  var mapStyle = "".obs;

  final parkingAreas = <ParkingAreaModel>[].obs;
  @override
  Future<void> onInit() async {
    await loadCustomMapStyle().then((value) => mapStyle.value = value);
    await _setPinIcons();
    getUserLocation();
    getParkingAreas();
    super.onInit();
  }

//functions
  animateCameraToCurrentLocation() {
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        bearing: 0, target: currentLocation, tilt: 0, zoom: 18)));
  }

  Future<LatLng> getUserLocation() async {
    log("message1");
    return await locationService.getCurrentPosition().then((value) async {
      currentLocation = LatLng(value.latitude, value.longitude);
      setCurrentLocationMarker();
      return currentLocation;
    });
  }

  getParkingAreas() async {
    status = RxStatus.loading();
    try {
      parkingAreas.value = await repository.getParkingAreas();
      setParkingLotMarkers();
      status = RxStatus.success();
    } catch (e) {
      status = RxStatus.error(e.toString());
    }
  }

  setParkingLotMarkers() {
    _markers.clear();
    _markers.addAll(parkingAreas
        .map((e) => Marker(
              markerId: MarkerId(e.id.toString()),
              position: LatLng(e.center!.latitude, e.center!.longitude),
              icon: e.availableSlots == 0
                  ? fullParkingSpace
                  : e.availableSlots! < 10 && e.availableSlots! > 0
                      ? midParkingSpace
                      : freeParkingSpace,
              onTap: () {},
            ))
        .toSet());
    setCurrentLocationMarker();
    log("message2 ${markers.length}");
  }

  setCurrentLocationMarker() {
    _markers.removeWhere((element) =>
        element.markerId.value == MarkerIds.currentLocationMarker.name);
    _markers
        .add(currentLocationMarker.copyWith(positionParam: currentLocation));
    log("message");
  }

  _setPinIcons() async {
    double width = 0.2;
    currentLocationIcon = BitmapDescriptor.fromBytes(
        await getBytesFromAsset(IconImages.car, (width / 50).round()),
        size: Size((width / 50), (width / 50)));
    freeParkingSpace = BitmapDescriptor.fromBytes(
        await getBytesFromAsset(IconImages.greenPin, (width).round()));
    midParkingSpace = BitmapDescriptor.fromBytes(
        await getBytesFromAsset(IconImages.yellowPin, (width).round()));
    fullParkingSpace = BitmapDescriptor.fromBytes(
        await getBytesFromAsset(IconImages.redPin, (width).round()));
    Marker myLocMarker = Marker(
      markerId: MarkerId(MarkerIds.currentLocationMarker.name),
      icon: currentLocationIcon,
    );
    _currentLocationMarker.value = myLocMarker;
  }
}
