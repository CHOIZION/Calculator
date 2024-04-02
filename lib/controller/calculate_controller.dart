import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

// 컨트롤러 클래스 정의
class CalculateController extends GetxController {

  // 사용자 입력을 문자열로 저장하기 위한 변수 정의
  var userInput = "";
  // 계산 결과를 저장하기 위한 변수 정의
  var userOutput = "";

  /// '등호(=)' 버튼이 눌렸을 때 호출되는 함수. 사용자의 입력을 분석하고 계산 결과를 출력.
  equalPressed() {
    // 사용자 입력의 복사본을 제작
    String userInputFC = userInput;
    // 'x'를 '*'로 교체
    userInputFC = userInputFC.replaceAll("x", "*");

    Parser p = Parser();
    Expression exp = p.parse(userInputFC);
    ContextModel ctx = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, ctx);

    // 문자열로 변환하여 사용자 출력 업데이트
    userOutput = eval.toString();
    update();
  }

  /// 입력과 출력을 지우고, 계산기를 초기 상태로 재설정
  clearInputAndOutput() {
    userInput = "";
    userOutput = "";
    update();
  }

  /// 삭제 버튼이 눌렸을 때 호출되는 함수. 사용자 입력에서 마지막 문자를 제거.
  deleteBtnAction() {
    // 삭제할 입력이 있는지 확인하고 마지막 문자를 제거
    if (userInput.isNotEmpty) {
      userInput = userInput.substring(0, userInput.length - 1);
      update();
    }
  }

  /// 숫자 및 연산자 버튼 탭을 처리하여 탭된 버튼의 기호를 입력, 문자열에 추가하는 함수.
  onBtnTapped(List<String> buttons, int index) {
    // 버튼의 기호를 사용자 입력 문자열에 추가
    userInput += buttons[index];
    // 변경 사항에 따라 UI를 업데이트하기 위해 리스너들에게 알림
    update();
  }
}
