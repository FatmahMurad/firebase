import 'package:firebase/app/config/theme/my_colors.dart';
import 'package:firebase/app/core/extensions/build_context_extentions.dart';
import 'package:firebase/app/modules/auth/widgets/my_form_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyFormFields(formKey: formKey),
          SizedBox(
            height: context.screenHeight * 0.04,
          ),
          ElevatedButton(
            onPressed: () {},
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
        ],
      ),
    );
  }
}
