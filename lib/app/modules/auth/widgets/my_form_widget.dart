import 'package:firebase/app/core/extensions/build_context_extentions.dart';
import 'package:firebase/app/modules/auth/domain/helper/auth_validator.dart';
import 'package:firebase/app/modules/auth/widgets/my_textform_widget.dart';
import 'package:flutter/material.dart';

class MyFormFields extends StatefulWidget {
  const MyFormFields({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  State<MyFormFields> createState() => _MyFormFieldState();
}

class _MyFormFieldState extends State<MyFormFields> {
  final _authValidators = AuthValidators();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final FocusNode userNameNode = FocusNode();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    emailNode.dispose();
    passwordNode.dispose();
    userNameNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MyTextFormField(
              textEditingController: emailController,
              myFocusNode: emailNode,
              myTextInputAction: TextInputAction.next,
              labelText: context.translate.email,
              prefixIcon: const Icon(Icons.email),
              obscureText: false,
              onChanged: null,
              validator: (value) {
                return _authValidators.emailValidator(value);
              },
            ),
            SizedBox(
              height: context.screenHeight * 0.005,
            ),
            MyTextFormField(
              textEditingController: userNameController,
              myFocusNode: userNameNode,
              myTextInputAction: TextInputAction.next,
              labelText: context.translate.userName,
              prefixIcon: const Icon(Icons.person),
              obscureText: false,
              onChanged: null,
            ),
            SizedBox(
              height: context.screenHeight * 0.005,
            ),
            MyTextFormField(
              textEditingController: passwordController,
              myFocusNode: passwordNode,
              myTextInputAction: TextInputAction.next,
              labelText: context.translate.password,
              prefixIcon: const Icon(Icons.remove_red_eye_outlined),
              obscureText: true,
              onChanged: null,
            ),
          ],
        ),
      ),
    );
  }
}
