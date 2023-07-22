import 'dart:async';

// import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/data/model/location.dart';
import 'package:record_route/data/model/user_profile.dart';
import 'package:record_route/data/provider/request_service.dart';
import 'package:record_route/util/toastr.dart';

enum ServiceStatus {
  /// Indicates that the location service on the native platform is disabled.
  disabled,

  /// Indicates that the location service on the native platform is enabled.
  enabled,
}
class Position {
  /// The latitude of this position in degrees normalized to the interval -90.0
  /// to +90.0 (both inclusive).
  final double latitude;

  /// The longitude of the position in degrees normalized to the interval -180
  /// (exclusive) to +180 (inclusive).
  final double longitude;

  /// The time at which this position was determined.
  final DateTime? timestamp;

  /// The altitude of the device in meters.
  ///
  /// The altitude is not available on all devices. In these cases the returned
  /// value is 0.0.
  final double altitude;

  /// The estimated horizontal accuracy of the position in meters.
  ///
  /// The accuracy is not available on all devices. In these cases the value is
  /// 0.0.
  final double accuracy;

  /// The heading in which the device is traveling in degrees.
  ///
  /// The heading is not available on all devices. In these cases the value is
  /// 0.0.
  final double heading;

  /// The floor specifies the floor of the building on which the device is
  /// located.
  ///
  /// The floor property is only available on iOS and only when the information
  /// is available. In all other cases this value will be null.
  final int? floor;

  /// The speed at which the devices is traveling in meters per second over
  /// ground.
  ///
  /// The speed is not available on all devices. In these cases the value is
  /// 0.0.
  final double speed;

  /// The estimated speed accuracy of this position, in meters per second.
  ///
  /// The speedAccuracy is not available on all devices. In these cases the
  /// value is 0.0.
  final double speedAccuracy;

  /// Will be true on Android (starting from API lvl 18) when the location came
  /// from the mocked provider.
  ///
  /// On iOS this value will always be false.
  final bool isMocked;


  /// Constructs an instance with the given values for testing. [Position]
  /// instances constructed this way won't actually reflect any real information
  /// from the platform, just whatever was passed in at construction time.
  const Position({
    required this.longitude,
    required this.latitude,
    required this.timestamp,
    required this.accuracy,
    required this.altitude,
    required this.heading,
    required this.speed,
    required this.speedAccuracy,
    this.floor,
    this.isMocked = false,
  });
} 
class GetLocation {
  
  StreamSubscription<ServiceStatus>? serviceStatusStream;
  StreamSubscription<Position>? positionStream;

  RxBool requestService = true.obs;
  UserProfile user = UserProfile.fromJson({});
  RequestService request = Get.find<RequestService>();
  Timer? timer;

  GetLocation(){

  }

  initData() async{
    user = await Auth.instance.getUser();

  }

  /// verifica si esta activo la ubicacion, y lo aplica al stream
  Future<bool> checkActiveService() async {
    // bool serviceEnabled;
    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   requestService.value = true;
    //   return false;
    // }
    requestService.value = false;
    return true;
  }

  Future<bool> verifyPermissions() async {
    // LocationPermission permission;

    // permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
    //   return false;
    // }
    return true;
  }
  
  Future<bool> checkPermission() async {
    // LocationPermission permission;

    // permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();
    //   if (permission == LocationPermission.denied) {
    //     return false;
    //   }
    // }

    // if (permission == LocationPermission.deniedForever) {
    //   return false;
    // }
    return true;
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    // LocationPermission permission;

    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   return Future.error('Location services are disabled.');
    // }
    // permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();
    //   if (permission == LocationPermission.denied) {
    //     return Future.error('Location permissions are denied');
    //   }
    // }
    // if (permission == LocationPermission.deniedForever) {
    //   return Future.error(
    //       'Location permissions are permanently denied, we cannot request permissions.');
    // }
    // return await Geolocator.getCurrentPosition();

    return Position(longitude: 23, latitude: 23, timestamp: DateTime.now(), accuracy: 3, altitude: 23, heading: 43, speed: 1, speedAccuracy: 34);
  }

  Future<bool> validatePermissions() async {
    // bool serviceEnabled;
    // LocationPermission permission;
    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   ToastrService().info('Ubicacion', 'Debe habilitar la ubicacion');
    //   return false;
    // }

    // permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();
    //   if (permission == LocationPermission.denied) {
    //     ToastrService().info('Ubicacion', 'Ubicacion fue denegada');
    //     return false;
    //   }
    // }
    return true;
  }

  void locationListen() async {
    print('LOCATION LISTEN');

    // LocationSettings locationSettings = const LocationSettings(
    //   accuracy: LocationAccuracy.high,
    //   distanceFilter: 10,
    // );

    // bool result = await validatePermissions();
    // if (!result) return;
    // RowLocationDB db = RowLocationDB();
    // await db.open();
    // positionStream =
    //     Geolocator.getPositionStream(locationSettings: locationSettings).listen(
    //         (Position? position) {
    //   print(position == null
    //       ? 'Unknown'
    //       : '${position.latitude.toString()}, ${position.longitude.toString()}');
    //   if (position != null) {
    //     db.insert(RowLocation(
    //         id: null,
    //         driverId: user.driver?.id ?? 0,
    //         latitude: position.latitude.toString(),
    //         longitude: position.longitude.toString(),
    //         routeId: user.routeActive?.id ?? 0,
    //         dateTime: DateTime.now()));
    //   }
    // }, onError: (Object error) {
    //   print(error);
    // });
  }

  void locationCancel() {
    positionStream?.cancel();
  }

  void serviceStatusListen() {
    // serviceStatusStream =
    //     Geolocator.getServiceStatusStream().listen((ServiceStatus status) {
    //   print('😊 Listen Service: ' + status.toString());
    //   if (status == ServiceStatus.disabled) {
    //     showLocation();
    //   }
    //   if (status == ServiceStatus.enabled) {
    //     hideLocation();
    //   }
    // });
  }

  void serviceStatusCancel() {
    serviceStatusStream?.cancel();
  }

  void showLocation() {
    requestService.value = true;
  }

  void hideLocation() {
    requestService.value = false;
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
    timer = Timer.periodic(const Duration(minutes: 4), (timer) async {
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
