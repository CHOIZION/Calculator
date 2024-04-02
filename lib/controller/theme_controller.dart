import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// 앱의 테마를 관리
class ThemeController extends GetxController {
  // 현재 테마 상태를 나타내는 변수
  bool isDark = true;

  final switcherController = ValueNotifier<bool>(false);

  // 밝은 테마로 전환하는 함수
  lightTheme() {
    isDark = false;
    // 시스템 UI 오버레이 스타일을 밝은 테마에 맞게 설정
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    // 상태 업데이트를 통해 UI에 변경 사항을 알립니다.
    update();
  }

  // 어두운 테마로 전환하는 함수
  darkTheme() {
    isDark = true;
    // 시스템 UI 오버레이 스타일을 어두운 테마에 맞게 설정
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    // 상태 업데이트를 통해 UI에 변경 사항을 알립니다.
    update();
  }

  @override
  void onInit() {
    // switcherController 리스너를 추가하여 스위치의 값이 변경될 때마다 테마를 전환
    switcherController.addListener(() {
      if (switcherController.value) {
        lightTheme(); // 스위치가 켜지면 밝은 테마로 전환
      } else {
        darkTheme(); // 스위치가 꺼지면 어두운 테마로 전환
      }
    });
    super.onInit(); // 부모 클래스의 onInit 함수를 호출하여 초기화 과정을 완료
  }
}
