import 'package:firebase/app/config/router/my_named_routes.dart';
import 'package:firebase/app/core/extensions/build_context_extentions.dart';
import 'package:firebase/app/modules/auth/domain/provider/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkIfUserAuthenticated =
        ref.watch(checkIfAuthinticatedFutureProvider);

    return Scaffold(
      body: Center(
        child: checkIfUserAuthenticated.when(
            data: (data) {
              if (data.value?.uid != null) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  GoRouter.of(context).goNamed(MyNamedRoutes.chats);
                });
              } else {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  GoRouter.of(context).goNamed(MyNamedRoutes.register);
                });
              }
              return Center(child: Text("Splash Screen"));
            },
            loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
            error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                )),
      ),
    );
  }
}
