import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:inthon2024/provider/naverMapProvider.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:inthon2024/const/colors.dart';

Future<String> checkPermission() async {
  final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

  if (!isLocationEnabled) {
    return '위치 사용 권한을 허용해주세요';
  }

  LocationPermission checkedPermission = await Geolocator.checkPermission();

  if (checkedPermission == LocationPermission.denied) {
    checkedPermission = await Geolocator.requestPermission();
    if (checkedPermission == LocationPermission.denied) {
      return '위치 권한을 허용해주세요';
    }
  }
  if (checkedPermission == LocationPermission.deniedForever) {
    return '앱의 위치 권한을 설정에서 허용해주세요';
  }

  return '위치 권한이 허가 되었습니다';
}

class DisplayMapWidget extends StatelessWidget {
  const DisplayMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mapController = Provider.of<NaverMapProvider>(context, listen: false);

    return Container(
      width: 425.0,
      height: 550.0,
      decoration: BoxDecoration(
        color: Colors.green[100],
      ),
      child: FutureBuilder(
        future: checkPermission(),
        builder: (context, snapshot) {
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == '위치 권한이 허가 되었습니다') {
            return NaverMap(
              options: const NaverMapViewOptions(
                initialCameraPosition: NCameraPosition(
                  target: NLatLng(37.5855175, 127.0305901),
                  zoom: 15,
                ),
                locationButtonEnable: true,
              ),
              onMapReady: (controller) {
                mapController.setController(controller);
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