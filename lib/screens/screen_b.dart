import 'package:flutter/material.dart';
import 'package:flutter_cookbook_animate_a_page_route_transition/screens/screen_a.dart';

import '../route_builders.dart';

class ScreenB extends StatefulWidget {
  const ScreenB({super.key});

  @override
  State<ScreenB> createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
  bool isTransparent = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isTransparent = false;
      });
    });
  }

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
            AnimatedOpacity(
              duration: const Duration(seconds: 3),
              opacity: isTransparent ? 0.0 : 1.0,
              child: Text(
                "ScreenB",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
                key: ValueKey(toString()),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  customPageRouteBuilder(
                    ScreenA(),
                  ),
                );
              },
              child: const Text('Go to ScreenA'),
            ),
            Hero(
              tag: 'aa',
              child: Container(
                color: Colors.blue,
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
