import 'package:flutter/material.dart';
import 'package:test_app/model/login_service.dart';
import 'package:test_app/view/pages/page.dart';
import 'package:test_app/view/widgets/custom_form.dart';
import 'package:test_app/view_model/value_listenable_change_notifier.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.listenableChangeNotifier,
  });

  final GlobalKey<CustomFormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final ValueListenableChangeNotifier<bool?> listenableChangeNotifier;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        splashFactory: InkRipple.splashFactory,
        onTap: () {
          if (formKey.currentState!.validate()) {
            if (LoginService.login(
                emailController.text, passwordController.text)) {
              listenableChangeNotifier.setValue(false, notifyListener: true);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const PageScreen()));
            } else {
              listenableChangeNotifier.setValue(true, notifyListener: true);
            }
          }
        },
        child: Ink(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Color(0xFFFB6564),
                Color(0xFFA03CEA),
              ],
            ),
          ),
          child: const Center(
            child: Text(
              "Login",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
