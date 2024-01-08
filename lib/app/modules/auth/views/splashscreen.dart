import 'package:firebase/app/config/router/my_named_routes.dart';
import 'package:firebase/app/core/extensions/build_context_extentions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.amber,
          height: context.screenHeight * 0.3,
          width: context.screenWidth * 0.3,
          child: GestureDetector(
            onTap: () {
              context.pushNamed(MyNamedRoutes.register);
            },
            child: Text("Splash Screen"),
          ),
        ),
      ),
    );
  }
}
