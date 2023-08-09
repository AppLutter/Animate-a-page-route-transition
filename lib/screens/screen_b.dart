import 'package:flutter/material.dart';
import 'package:flutter_cookbook_animate_a_page_route_transition/screens/screen_a.dart';

import '../route_builders.dart';

class ScreenB extends StatelessWidget {
  const ScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent.withOpacity(0.1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              toString(),
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
              key: ValueKey(toString()),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  customPageRouteBuilder(
                    ScreenA(),
                  ),
                );
              },
              child: const Text('Go to ScreenA'),
            )
          ],
        ),
      ),
    );
  }
}
