import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:inthon2024/provider/naverMapProvider.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

Future<Position?> checkPermissionAndGetLocation() async {
  final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

  if (!isLocationEnabled) {
    return null;
  }

  LocationPermission checkedPermission = await Geolocator.checkPermission();

  if (checkedPermission == LocationPermission.denied) {
    checkedPermission = await Geolocator.requestPermission();
    if (checkedPermission == LocationPermission.denied) {
      return null;
    }
  }
  if (checkedPermission == LocationPermission.deniedForever) {
    return null;
  }

  return await Geolocator.getCurrentPosition();
}

class DonateMapWidget extends StatelessWidget {
  const DonateMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mapController = Provider.of<NaverMapProvider>(context, listen: false);

    for (var marker in mapController.trash_markers) {
      marker.setOnTapListener((NOverlay<void> clickedOverlay) {
        if (clickedOverlay is NMarker) {
          print('클릭된 마커: ${clickedOverlay.info.id}');
          mapController.setSelectedMarker(clickedOverlay);
        }
      });
    }

    return Container(
      width: 425.0,
      height: 500.0,
      decoration: BoxDecoration(
        color: Colors.green[100],
      ),
      child: FutureBuilder(
        future: checkPermissionAndGetLocation(),
        builder: (context, snapshot) {
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            Position userLocation = snapshot.data!;
            return NaverMap(
              options: NaverMapViewOptions(
                initialCameraPosition: NCameraPosition(
                  target: NLatLng(userLocation.latitude, userLocation.longitude),
                  zoom: 15,
                ),
                locationButtonEnable: true,
              ),
              onMapReady: (controller) {
                mapController.setController(controller);
                mapController.controller.addOverlayAll(mapController.trash_markers);
              },
            );
          }
          return Center(
            child: Text(
              snapshot.data.toString(),
            ),
          );
        },
      ),
    );
  }
}
