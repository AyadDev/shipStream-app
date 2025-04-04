// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// import 'package:location/location.dart';
// import 'package:http/http.dart' as http;

// import 'Core/widgets/custom_app_bar.dart';
// import 'Core/widgets/custom_navigation_service.dart';

// class MapView extends StatefulWidget {
//   const MapView({super.key});

//   @override
//   State<MapView> createState() => _MapViewState();
// }

// class _MapViewState extends State<MapView> {
//   final MapController mapController = MapController();
//   LocationData? currentLocation;
//   List<LatLng> routePoints = [];
//   List<Marker> markers = [];
//   final String orsApiKey =
//       '5b3ce3597851110001cf6248ca98de92d91f4ec5b2e8990b440969c1';

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     var location = Location();
//     try {
//       var userLocation = await location.getLocation();
//       setState(() {
//         currentLocation = userLocation;
//         Marker(
//           height: 80.0,
//           width: 80.0,
//           point: LatLng(userLocation.latitude!, userLocation.longitude!),
//           child: const Icon(
//             Icons.my_location,
//             color: Colors.blue,
//             size: 40,
//           ),
//         );
//       });
//     } on Exception {
//       currentLocation = null;
//     }
//     location.onLocationChanged.listen((LocationData newLocation) {
//       setState(() {
//         currentLocation = newLocation;
//       });
//     });
//   }

//   Future<void> _getRoute(LatLng destination) async {
//     if (currentLocation == null) return;
//     final start =
//         LatLng(currentLocation!.latitude!, currentLocation!.longitude!);

//     final response = await http.get(
//       Uri.parse(
//           'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$orsApiKey&start=${start.longitude},${start.latitude}&end=${destination.longitude},${destination.latitude}'),
//     );
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       final List<dynamic> coords =
//           data['features'][0]['geometry']['coordinates'];
//       setState(() {
//         routePoints =
//             coords.map((coord) => LatLng(coord[1], coord[0])).toList();
//         Marker(
//           height: 80.0,
//           width: 80.0,
//           point: destination,
//           child: const Icon(
//             Icons.location_on,
//             color: Colors.red,
//             size: 40,
//           ),
//         );
//       });
//     } else {
//       print('Failed to fetch route');
//     }
//   }

//   Future<void> _addDestinationMarker(LatLng point) async {
//     setState(() {
//       markers.add(
//         Marker(
//           height: 80.0,
//           width: 80.0,
//           point: point,
//           child: const Icon(
//             Icons.location_on,
//             color: Colors.red,
//             size: 40,
//           ),
//         ),
//       );
//     });
//     _getRoute(point);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(49),
//           child: CustomAppBar(
//             title: 'Pickup Map',
//             onTap: () => Nav.back(),
//           )),
//       body: currentLocation == null
//           ? const Center(child: CircularProgressIndicator())
//           : SizedBox(
//               height: MediaQuery.sizeOf(context).height,
//               child: FlutterMap(
//                 mapController: mapController,
//                 options: MapOptions(
//                   initialCenter: LatLng(
//                       currentLocation!.latitude!, currentLocation!.longitude!),
//                   initialZoom: 15.0,
//                   onTap: (tapPosition, point) => _addDestinationMarker(point),
//                 ),
//                 children: [
//                   TileLayer(
//                     urlTemplate:
//                         'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                     subdomains: ['a', 'b', 'c'],
//                   ),
//                   MarkerLayer(
//                     markers: markers,
//                   ),
//                   PolylineLayer(polylines: [
//                     Polyline(
//                       points: routePoints,
//                       strokeWidth: 4.0,
//                       color: Colors.blue,
//                     ),
//                   ])
//                 ],
//               ),
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           if (currentLocation != null) {
//             mapController.move(
//               LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
//               15.0,
//             );
//           }
//         },
//         child: const Icon(Icons.my_location),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shipstreem_app/Core/widgets/custom_app_bar.dart';
import 'package:shipstreem_app/constants.dart';

import 'Core/widgets/custom_navigation_service.dart';
import 'Features/from me/data/address_model.dart';
import 'Features/from me/presentation/view_model/address_cubit/address_cubit.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final MapController mapController = MapController();
  LocationData? currentLocation;
  LatLng? destinationMarker; // نقطة الوجهة التي يحددها المستخدم
  // مفتاح API لحساب الطريق (إذا كان مطلوبًا)
  final String orsApiKey =
      '5b3ce3597851110001cf6248ca98de92d91f4ec5b2e8990b440969c1';

  @override
  void initState() {
    super.initState();
    _checkPermissionsAndGetLocation();
  }

  // التحقق من صلاحيات الموقع والحصول على الموقع الحالي
  Future<void> _checkPermissionsAndGetLocation() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      await _getCurrentLocation();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("لم يتم منح صلاحية الموقع")),
      );
    }
  }

  // الحصول على الموقع الحالي للمستخدم
  Future<void> _getCurrentLocation() async {
    final location = Location();
    try {
      var userLocation = await location.getLocation();
      setState(() {
        currentLocation = userLocation;
      });
    } catch (e) {
      debugPrint("خطأ في جلب الموقع: $e");
      setState(() {
        currentLocation = null;
      });
    }
    location.onLocationChanged.listen((LocationData newLocation) {
      setState(() {
        currentLocation = newLocation;
      });
    });
  }

  // عند النقر على الخريطة يتم حفظ نقطة الوجهة
  void _onMapTap(TapPosition tapPosition, LatLng point) {
    setState(() {
      destinationMarker = point;
    });
  }

  // عند الضغط على زر التأكيد يتم استخدام reverse geocoding لاسترجاع بيانات العنوان وتحديث الحالة
  Future<void> _confirmSelection() async {
    if (destinationMarker == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("الرجاء تحديد نقطة الوجهة")),
      );
      return;
    }
    try {
      List<geocoding.Placemark> placemarks =
          await geocoding.placemarkFromCoordinates(
        destinationMarker!.latitude,
        destinationMarker!.longitude,
      );
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        Address newAddress = Address(
          country: place.country ?? "غير معروف",
          city: place.locality ?? "غير معروف",
          district: place.administrativeArea ?? "غير معروف",
          street: place.street ?? "غير معروف",
        );
        context.read<AddressCubit>().updateAddress(newAddress);
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تعذر العثور على العنوان')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('حدث خطأ أثناء استرجاع العنوان: $e')),
      );
    }
  }

  Widget _buildMarker() {
    return const Icon(
      Icons.location_on,
      color: Colors.red,
      size: 40,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(101),
        child: Stack(
          children: [
            Positioned(
              child: CustomAppBar(
                title: 'Map',
                onTap: () => Nav.back(),
              ),
            ),
            Positioned(
              top: 25,
              left: MediaQuery.sizeOf(context).width,
              child: IconButton(
                icon: const Icon(Icons.check, size: 28, color: Colors.white),
                onPressed: _confirmSelection,
              ),
            ),
          ],
        ),
      ),
      body: currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
              mapController: mapController,
              options: MapOptions(
                backgroundColor: Colors.white,
                initialCenter: LatLng(
                  currentLocation!.latitude!,
                  currentLocation!.longitude!,
                ),
                initialZoom: 15.0,
                onTap: _onMapTap,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                  userAgentPackageName:
                      'com.example.shipstreem_app', // استبدل بمعرف تطبيقك
                ),
                if (destinationMarker != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: destinationMarker!,
                        width: 80.0,
                        height: 80.0,
                        child: _buildMarker(),
                      ),
                    ],
                  ),
              ],
            ),
      // زر لتوسيط الخريطة على الموقع الحالي للمستخدم
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          if (currentLocation != null) {
            mapController.move(
              LatLng(
                currentLocation!.latitude!,
                currentLocation!.longitude!,
              ),
              15.0,
            );
          }
        },
        child: const Icon(Icons.my_location, color: Colors.white),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:geocoding/geocoding.dart';

// import 'Features/from me/data/address_model.dart';
// import 'Features/from me/presentation/view_model/address_cubit/address_cubit.dart';

// class MapSelectionScreen extends StatefulWidget {
//   const MapSelectionScreen({Key? key}) : super(key: key);

//   @override
//   _MapSelectionScreenState createState() => _MapSelectionScreenState();
// }

// class _MapSelectionScreenState extends State<MapSelectionScreen> {
//   LatLng _selectedLocation = LatLng(30.0444, 31.2357);
//   bool _markerSelected = false;

//   void _onMapTap(LatLng latlng) {
//     setState(() {
//       _selectedLocation = latlng;
//       _markerSelected = true;
//     });
//   }

//   Future<void> _confirmSelection() async {
//     try {
//       // استرجاع بيانات العنوان باستخدام reverse geocoding
//       List<Placemark> placemarks = await placemarkFromCoordinates(
//         _selectedLocation.latitude,
//         _selectedLocation.longitude,
//       );
//       if (placemarks.isNotEmpty) {
//         final place = placemarks.first;
//         Address newAddress = Address(
//           country: place.country ?? "",
//           city: place.locality ?? "",
//           district: place.administrativeArea ?? "",
//           street: place.street ?? "",
//         );
//         // تحديث الحالة في Cubit
//         BlocProvider.of<AddressCubit>(context).updateAddress(newAddress);
//         Navigator.pop(context);
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('لا توجد بيانات للعنوان')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('حدث خطأ أثناء استرجاع العنوان: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('اختر الموقع')),
//       body: FlutterMap(
//         options: MapOptions(
//           initialCenter: _selectedLocation,
//           initialZoom: 4,
//           onTap: (tapPosition, latlng) => _onMapTap(latlng),
//         ),
//         // في الإصدارات الحديثة يُفضل استخدام nonRotatedChildren للطبقات الأساسية
//         children: [
//           TileLayer(
//             urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//             subdomains: const ['a', 'b', 'c'],

//             // attributionBuilder: (context) => const Text('© OpenStreetMap contributors'),
//           ),
//           if (_markerSelected)
//             MarkerLayer(
//               markers: [
//                 Marker(
//                   point: _selectedLocation,
//                   width: 80,
//                   height: 80,
//                   child: const Icon(
//                     Icons.location_on,
//                     size: 40,
//                     color: Colors.red,
//                   ),
//                 ),
//               ],
//             ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _confirmSelection,
//         child: const Icon(Icons.check),
//       ),
//     );
//   }
// }
