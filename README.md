# 리:아트 (Re:Art) - 예술품 기부 플랫폼 API

## 프로젝트 소개

리:아트는 재활용품을 활용한 예술 프로젝트를 지원하는 플랫폼입니다. 주민들이 기부한 재활용품이 예술 작품으로 다시 태어나는 과정을 경험할 수 있으며, 예술가와 기부자를 연결하여 환경 보호와 예술 창작을 동시에 실현합니다.

## 주요 기능

- 재활용품 기부 가능 위치 조회 및 방문 신청
- 재활용품 기부 현황 조회 서비스
- 전시 및 기부 캠페인 조회 서비스
- 위치 기반 근처 전시 및 기부처 탐색
- 나의 기부내역 확인 

## 기술 스택

- Flutter
- Provider
- Geolocator
- flutter_naver_map
- http
- dio

## 프로젝트 구조

```
lib
├── component                # UI 구성 요소 (위젯)
│   ├── campaignCard.dart          # 캠페인 카드 위젯
│   ├── displayBottomSheetWidget.dart # 디스플레이 하단 시트 위젯
│   ├── displayMapWidget.dart      # 디스플레이 지도 위젯
│   ├── donateMapWidget.dart       # 기부 지도 위젯
│   └── squareCardWidget.dart      # 정사각형 카드 위젯
│
├── const                    # 상수 정의
│   ├── colors.dart                # 색상 상수
│   └── fontStyle.dart             # 폰트 스타일 상수
│
├── model                    # 데이터 모델
│   ├── cardModel.dart             # 카드 모델
│   ├── displaycardModel.dart      # 디스플레이 카드 모델
│   └── userModel.dart             # 사용자 모델
│
├── provider                 # 상태 관리 (Provider)
│   ├── campaignCardProvider.dart  # 캠페인 카드 상태 관리
│   ├── cardSelectionProvider.dart # 카드 선택 상태 관리
│   ├── displayCardProvider.dart   # 디스플레이 카드 상태 관리
│   ├── naverMapProvider.dart      # 네이버 지도 상태 관리
│   ├── navigationBarProvider.dart # 네비게이션 바 상태 관리
│   ├── pageViewProvider.dart      # 페이지 뷰 상태 관리
│   └── scrollControllerProvider.dart # 스크롤 컨트롤러 상태 관리
│
├── repository               # 데이터 저장소 (Repository)
│   ├── campaignRepository.dart    # 캠페인 데이터 저장소
│   └── displayRepository.dart     # 디스플레이 데이터 저장소
│
├── screen                   # 화면 구성
│   ├── main_screen               # 주요 화면
│   │   ├── campaign_screen.dart     # 캠페인 화면
│   │   ├── display_screen.dart      # 디스플레이 화면
│   │   ├── home_screen.dart         # 홈 화면
│   │   └── profile_screen.dart      # 프로필 화면
│   └── sub_screen                # 서브 화면
│       ├── campaignInfo_screen.dart # 캠페인 정보 화면
│       └── donateMap_screen.dart    # 기부 지도 화면
│
└── main.dart                # 앱 진입점

```
