import 'package:flutter/cupertino.dart';

PageRouteBuilder customPageRouteBuilder(Widget destination) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => destination,
    // opaque:false,
    // maintainState: false,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 1.0);
      const end = Offset.zero;

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
