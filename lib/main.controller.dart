// import 'dart:async';

// // import 'package:background_location/background_location.dart';
// import 'package:flutter/foundation.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';

// class MainController extends GetxController {
//   String title = 'Prueba';
//   String latitud = '';
//   String longitud = '';
//   List<String> positions = [];
//   late LocationSettings locationSettings;

//   MainController();

//   void updateLoction() {
//     Timer.periodic(Duration(seconds: 2), (timer) async {
//       Position result;
//       result = await Geolocator.getCurrentPosition();
//       latitud = result.latitude.toString();
//       longitud = result.longitude.toString();
//       print(latitud + ' ' + longitud);
//       positions.add(latitud + ' ' + longitud);
//       update();
//     });
//   }

//   /// Determine the current position of the device.
//   ///
//   /// When the location services are not enabled or permissions
//   /// are denied the `Future` will return an error.
//   Future<void> determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, next time you could try
//         // requesting permissions again (this is also where
//         // Android's shouldShowRequestPermissionRationale
//         // returned true. According to Android guidelines
//         // your App should show an explanatory UI now.
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }

//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.o
//   }

//   void backgroundLocation() {
//     // BackgroundLocation.setAndroidNotification(
//     //   title: "Notification title",
//     //   message: "Notification message",
//     //   icon: "@mipmap/ic_launcher",
//     // );

//     // BackgroundLocation.setAndroidConfiguration(1000);

//     // BackgroundLocation.startLocationService();
//     // BackgroundLocation.startLocationService(distanceFilter: 10);

//     // BackgroundLocation.startLocationService(forceAndroidLocationManager: true);

//     // BackgroundLocation.getLocationUpdates((location) {
//     //   print(location);
//     // });
//   }

//   void initLocation() {
//     if (defaultTargetPlatform == TargetPlatform.android) {
//       locationSettings = AndroidSettings(
//           accuracy: LocationAccuracy.high,
//           distanceFilter: 100,
//           forceLocationManager: true,
//           intervalDuration: const Duration(seconds: 10),
//           //(Optional) Set foreground notification config to keep the app alive
//           //when going to the background
//           foregroundNotificationConfig: const ForegroundNotificationConfig(
//             notificationText:
//                 "Example app will continue to receive your location even when you aren't using it",
//             notificationTitle: "Running in Background",
//             enableWakeLock: true,
//           ));
//     } else if (defaultTargetPlatform == TargetPlatform.iOS ||
//         defaultTargetPlatform == TargetPlatform.macOS) {
//       locationSettings = AppleSettings(
//         accuracy: LocationAccuracy.high,
//         activityType: ActivityType.fitness,
//         distanceFilter: 100,
//         pauseLocationUpdatesAutomatically: true,
//         // Only set to true if our app will be started up in the background.
//         showBackgroundLocationIndicator: false,
//       );
//     } else {
//       locationSettings = LocationSettings(
//         accuracy: LocationAccuracy.high,
//         distanceFilter: 100,
//       );
//     }

//     StreamSubscription<Position> positionStream =
//         Geolocator.getPositionStream(locationSettings: locationSettings)
//             .listen((Position? position) {
//       print(position == null
//           ? 'Unknown'
//           : '${position.latitude.toString()}, ${position.longitude.toString()}');
//     });
//   }
// }
