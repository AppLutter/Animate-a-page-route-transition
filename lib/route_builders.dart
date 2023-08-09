import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PageRouteBuilder customPageRouteBuilder(Widget destination) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => destination,

    /// barrierColor에 투명도가 있어서 뒤가 보이는 경우
    /// 쌓이는 페이지가 현재 화면을 완전히 가리지 않은 경우
    /// 아래 깔려있는 페이지를 보여줄 지 말지 정하는 플래그 값
    /// false를 주면 새로 쌓인 페이지가 가리지 못한 부분이 까맣게 표시된다.
    opaque:true,

    /// 페이지 전환 동안에 페이지가 그려지지 않은 부분의 색상
    barrierColor: Colors.transparent,

    /// barrier를 눌렀을 때 pop 가능
    /// 단, 아래 다른 스크린이 있을 때만 가능
    barrierDismissible: true,

    /// false 경우
    /// 앱에 뒤로가기 화살표(<-)가 있고, IOS에서는 슬라이드로 뒤로가기 가능
    ///
    /// true인 경우
    /// 앱의 뒤로가기가 사라지고 닫기(X) 버튼 생김, IOS 슬라이드로 뒤로가기 안됨
    fullscreenDialog: false,

    /// 이거는 Hero 쓰면 멈춰 보일 수 있다고 하는데..
    /// 차이를 모르겠음
    allowSnapshotting:  false,

    transitionDuration: const Duration(seconds: 2),
    reverseTransitionDuration: const Duration(seconds: 2),
    // maintainState: false,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 1.0);
      const end = Offset(0.0, 0.0);

      const curve = Curves.ease;

      /// Tween이라는 Animatable과 합성하기 위해서는 Animatable를 상속받은 CurveTween에 넣어야 한다.
      final curveTween = CurveTween(curve: curve);

      final tween = Tween(begin: begin, end: end).chain(curveTween);


      /// .drive를 통해 각종 [Tween], 예를 들어 [CurveTween], [AlignmentTween]등 을 동반 시킬 수 있다.
      final offsetAnimation = animation.drive(tween);

      /// SlideTransition은 AnimatedWidget을 상속 받았다.
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
