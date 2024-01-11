import 'package:firebase/app/config/router/my_named_routes.dart';
import 'package:firebase/app/config/theme/my_colors.dart';
import 'package:firebase/app/core/extensions/build_context_extentions.dart';
import 'package:firebase/app/modules/auth/domain/provider/auth_providers.dart';
import 'package:firebase/app/modules/auth/domain/provider/controller/auth_controller.dart';
import 'package:firebase/app/modules/auth/widgets/my_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider.notifier);
    final formProvider = ref.watch(authFormController);
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.primary_500,
        automaticallyImplyLeading: false,
        title: Text(
          context.translate.register,
          style: context.textTheme.headlineMedium?.copyWith(
            fontSize: 16,
            color: MyColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyFormFields(formKey: formKey),
              SizedBox(
                height: context.screenHeight * 0.04,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() == true) {
                    authController
                        .register(
                            email: formProvider.email,
                            username: formProvider.userName,
                            password: formProvider.password)
                        .then((value) {
                      if (value == true) {
                        context.goNamed(MyNamedRoutes.chats);
                      }
                    });
                  }
                },
                child: Text(
                  context.translate.register,
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.04,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  context.translate.googleSignIn,
                  style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold, color: MyColors.primary_500),
                ),
              ),
              Visibility(
                  visible: authState.isLoading == true,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
