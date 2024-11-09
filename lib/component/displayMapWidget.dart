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

class DisplayMapWidget extends StatelessWidget {
  final NMarker marker = NMarker(
    id: 'GYM',
    position: const NLatLng(37.5855175, 127.0305901),
    caption: const NOverlayCaption(text: '에너메카 안암점'),
  );

  final infoWindow = NInfoWindow.onMap(
    id: 'GYM',
    text: "HelloWorld",
    position: const NLatLng(37.5855175, 127.0305901),
  );

  DisplayMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mapController = Provider.of<NaverMapProvider>(context, listen: false);

    marker.setOnTapListener((NMarker marker) {
      print("마커가 터치되었습니다. id:${marker.info.id}");
      mapController.controller.addOverlay(infoWindow);
    });

    return Container(
      width: 425.0,
      height: 550.0,
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
                mapController.controller.addOverlay(marker);
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
