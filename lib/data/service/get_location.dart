import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:record_route/data/model/location.dart';
import 'package:record_route/pages/home/home_controller.dart';
import 'package:record_route/util/toastr.dart';
import 'package:location/location.dart' as L;

class GetLocation {
  StreamSubscription<ServiceStatus>? serviceStatusStream;
  StreamSubscription<Position>? positionStream;

  RxBool requestService = true.obs;
  L.Location location = L.Location();

  Future<bool> checkActiveService() async {
    bool serviceEnabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      requestService.value = true;
      return false;
    }
    requestService.value = false;
    return true;
  }

  Future<bool> checkPermission() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return false;
    }
    return true;
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  void updateLoction() {
    Timer.periodic(Duration(seconds: 2), (timer) async {
      Position result;
      result = await Geolocator.getCurrentPosition();
      // latitud = result.latitude.toString();
      // longitud = result.longitude.toString();
      print(result.latitude.toString() + ' ' + result.longitude.toString());
      // positions.add(latitud + ' ' + longitud);
      // update();
    });
  }

  Future<bool> validatePermissions() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      ToastrService().info('Ubicacion', 'Debe habilitar la ubicacion');
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        ToastrService().info('Ubicacion', 'Ubicacion fue denegada');
        return false;
      }
    }

    return true;
  }

  void locationListen() async {
    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );

    bool result = await validatePermissions();
    if (!result) return;

    RowLocationDB db = new RowLocationDB();
    await db.open();
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings).listen(
            (Position? position) {
      print(position == null
          ? 'Unknown'
          : '${position.latitude.toString()}, ${position.longitude.toString()}');
      if (position != null) {
        print('test');
        db.insert(RowLocation(
            id: -1,
            latitude: position.latitude.toString(),
            longitude: position.longitude.toString(),
            routeId: 7,
            dateTime: DateTime.now()));
      }
    }, onError: (Object error) {
      print(error);
      print('erron');
    });
  }

  void locationCancel() {
    positionStream?.cancel();
  }

  void serviceStatusListen() {
    serviceStatusStream =
        Geolocator.getServiceStatusStream().listen((ServiceStatus status) {
      if (status == ServiceStatus.disabled) {
        print('show');
        showLocation();
      }
      if (status == ServiceStatus.enabled) {
        print('hide');
        hideLocation();
      }
      print(status);
    });
  }

  void serviceStatusCancel() {
    serviceStatusStream?.cancel();
  }

  void showLocation() {
    // HomeController c = Get.find<HomeController>();
    // c.requestLocation = true;
    // requestLocation.toggle();
    requestService.value = true;
    print('es true: ' + requestService.isFalse.toString());
    // c.update();
  }

  void hideLocation() {
    // HomeController c = Get.find<HomeController>();
    // c.requestLocation = false;
    requestService.value = false;
    print('es false: ' + requestService.isFalse.toString());
    // c.update();
  }

  Future<void> requestLocationService() async {
    bool test = await location.serviceEnabled();
    print('request ' + test.toString());
  }
}
