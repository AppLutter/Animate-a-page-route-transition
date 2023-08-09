import 'package:flutter/material.dart';
import 'package:flutter_cookbook_animate_a_page_route_transition/route_builders.dart';
import 'package:flutter_cookbook_animate_a_page_route_transition/screens/screen_b.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.3),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(builder: (context) {
              return Hero(
                tag: 'aa',
                child: Container(
                  color: Colors.redAccent,
                  width: 30,
                  height: 30,
                ),
              );
            }),
            Text(
              toString(),
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  customPageRouteBuilder(
                    ScreenB(),
                  ),
                );
              },
              child: const Text('Go to ScreenB'),
            )
          ],
        ),
      ),
    );
  }
}
