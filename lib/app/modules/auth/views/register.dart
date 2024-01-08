import 'package:firebase/app/core/extensions/build_context_extentions.dart';
import 'package:firebase/app/modules/auth/widgets/my_form_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(context.translate.register),
      ),
      body: Column(
        children: [
          MyFormFields(formKey: formKey),
        ],
      ),
    );
  }
}
