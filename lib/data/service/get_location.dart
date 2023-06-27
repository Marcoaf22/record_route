import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/data/model/location.dart';
import 'package:record_route/data/model/user_profile.dart';
import 'package:record_route/data/provider/request_service.dart';
import 'package:record_route/util/toastr.dart';
//import 'package:location/location.dart' as L;

class GetLocation {
  StreamSubscription<ServiceStatus>? serviceStatusStream;
  StreamSubscription<Position>? positionStream;

  RxBool requestService = true.obs;
  //L.Location location = L.Location();
  UserProfile user = Auth.instance.getUser();
  RequestService request = Get.find<RequestService>();
  Timer? timer;

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
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<bool> validatePermissions() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ToastrService().info('Ubicacion', 'Debe habilitar la ubicacion');
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ToastrService().info('Ubicacion', 'Ubicacion fue denegada');
        return false;
      }
    }

    return true;
  }

  void locationListen() async {
    print('LOCATION LISTEN');

    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );

    bool result = await validatePermissions();
    if (!result) return;
    RowLocationDB db = RowLocationDB();
    await db.open();
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings).listen(
            (Position? position) {
      print(position == null
          ? 'Unknown'
          : '${position.latitude.toString()}, ${position.longitude.toString()}');
      if (position != null) {
        db.insert(RowLocation(
            id: null,
            driverId: user.driver?.id ?? 0,
            latitude: position.latitude.toString(),
            longitude: position.longitude.toString(),
            routeId: user.routeActive?.id ?? 0,
            dateTime: DateTime.now()));
      }
    }, onError: (Object error) {
      print(error);
    });
  }

  void locationCancel() {
    positionStream?.cancel();
  }

  void serviceStatusListen() {
    serviceStatusStream =
        Geolocator.getServiceStatusStream().listen((ServiceStatus status) {
      if (status == ServiceStatus.disabled) {
        showLocation();
      }
      if (status == ServiceStatus.enabled) {
        hideLocation();
      }
      print(status);
    });
  }

  void serviceStatusCancel() {
    serviceStatusStream?.cancel();
  }

  void showLocation() {
    requestService.value = true;
    print('es true: ' + requestService.isFalse.toString());
  }

  void hideLocation() {
    requestService.value = false;
    print('es false: ' + requestService.isFalse.toString());
  }

  Future<List<Map>> getLocations() async {
    RowLocationDB db = RowLocationDB();
    await db.open();

    List<RowLocation> result = await db.getAllByState();
    return result.map((e) {
      return e.toJson();
    }).toList();
  }

  updateState() async {
    RowLocationDB db = RowLocationDB();
    await db.open();
    await db.updateState();
  }

  void initSendLocation() {
    print('🎢 init send data');
    timer = Timer.periodic(const Duration(minutes: 1), (timer) async {
      print('ENVIANDO DATA');
      List<Map> list = await getLocations();
      bool result = await request.post(url: '/routes/locations', body: list);
      if (result) {
        updateState();
      }
    });
  }

  void cancelSendLocation() {
    timer?.cancel();
  }

  Future<void> requestLocationService() async {
    //bool test = await location.serviceEnabled();
    //print('request ' + test.toString());
  }

  void routeActiveRecord() {
    locationListen();
    initSendLocation();
  }

  void routeCancelRecord() {
    positionStream?.cancel();
    timer?.cancel();
  }
}
