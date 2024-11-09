import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class NaverMapProvider with ChangeNotifier {
  final Set<NAddableOverlay> display_markers = dmarkers;
  final Set<NAddableOverlay> trash_markers = tmarkers;
  NMarker _selectedMarker = NMarker(
    id: '에너메카 안암점',
    position: const NLatLng(37.5855175, 127.0305901),
    caption: const NOverlayCaption(text: '에너메카 안암점'),
  );
  late NaverMapController _controller;

  NaverMapController get controller => _controller;
  NMarker get selectedMarker => _selectedMarker;

  void setController(NaverMapController controller) {
    _controller = controller;
    notifyListeners();
  }

  void setSelectedMarker(NMarker marker) {
    _selectedMarker = marker;
    notifyListeners();
  }
}

final Set<NAddableOverlay> dmarkers = {
  NMarker(
    id: 'GYM',
    position: const NLatLng(37.5855175, 127.0305901),
    caption: const NOverlayCaption(text: '에너메카 안암점'),
  ),
  NMarker(
    id: '고려대학교 본관',
    position: const NLatLng(37.5892, 127.0334),
    caption: const NOverlayCaption(text: '고려대학교 본관'),
  ),
  NMarker(
    id: '고려대학교 중앙도서관',
    position: const NLatLng(37.5895, 127.0337),
    caption: const NOverlayCaption(text: '고려대학교 중앙도서관'),
  ),
  NMarker(
    id: '고려대학교 안암병원',
    position: const NLatLng(37.5864, 127.0276),
    caption: const NOverlayCaption(text: '고려대학교 안암병원'),
  ),
  NMarker(
    id: '안암동 주민센터',
    position: const NLatLng(37.5869, 127.0297),
    caption: const NOverlayCaption(text: '안암동 주민센터'),
  ),
  NMarker(
    id: '고려대학교 라이시움',
    position: const NLatLng(37.5886, 127.0329),
    caption: const NOverlayCaption(text: '고려대학교 라이시움'),
  ),
};

final Set<NAddableOverlay> tmarkers = {
  NMarker(
    id: 'GYM',
    position: const NLatLng(37.5855175, 127.0305901),
    caption: const NOverlayCaption(text: '에너메카 안암점'),
  ),
  NMarker(
    id: '고려대학교 본관',
    position: const NLatLng(37.5892, 127.0334),
    caption: const NOverlayCaption(text: '고려대학교 본관'),
  ),
  NMarker(
    id: '고려대학교 중앙도서관',
    position: const NLatLng(37.5895, 127.0337),
    caption: const NOverlayCaption(text: '고려대학교 중앙도서관'),
  ),
  NMarker(
    id: '고려대학교 안암병원',
    position: const NLatLng(37.5864, 127.0276),
    caption: const NOverlayCaption(text: '고려대학교 안암병원'),
  ),
  NMarker(
    id: '안암동 주민센터',
    position: const NLatLng(37.5869, 127.0297),
    caption: const NOverlayCaption(text: '안암동 주민센터'),
  ),
  NMarker(
    id: '고려대학교 라이시움',
    position: const NLatLng(37.5886, 127.0329),
    caption: const NOverlayCaption(text: '고려대학교 라이시움'),
  ),
};