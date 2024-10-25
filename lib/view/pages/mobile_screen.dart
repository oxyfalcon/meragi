import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:test_app/utils/extensions.dart';
import 'package:test_app/view/widgets/app_text_field.dart';
import 'package:test_app/view/widgets/custom_form.dart';
import 'package:test_app/view/widgets/login_button.dart';
import 'package:test_app/view/widgets/login_method_widget.dart';
import 'package:test_app/view_model/value_listenable_change_notifier.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final GlobalObjectKey<CustomFormState> formKey =
      const GlobalObjectKey<CustomFormState>("form");
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late ValueListenableChangeNotifier<bool?> listenableChangeNotifier;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    listenableChangeNotifier = ValueListenableChangeNotifier<bool?>();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    listenableChangeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Color(0xFFFB6564),
                Color(0xFFA03CEA),
              ],
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: 250.0,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 34.0),
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/logo.svg"),
                            const Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: FittedBox(
                                child: Text('Design Guild',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w600)),
                              ),
                            )
                          ]),
                    )),
              ),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(200, 60),
                          topRight: Radius.elliptical(200, 60)),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 100, left: 24, right: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "Join Our\n",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w700)),
                            TextSpan(
                                text: "Community today",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w700)),
                          ])),
                          const Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: Text(
                                "Get connected, find designers to start a project",
                                style: TextStyle(
                                    fontFamily: "sora",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 48.0),
                            child: Material(
                              child: SizedBox.fromSize(
                                size: const Size.fromHeight(48),
                                child: InkWell(
                                  splashFactory: InkRipple.splashFactory,
                                  onTap: () {},
                                  child: Ink(
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
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
                                        "Sign Up",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const LoginMethodWidget(),
                          Padding(
                            padding: const EdgeInsets.only(top: 56.0),
                            child: Column(
                              children: [
                                ValueListenableBuilder<bool?>(
                                  valueListenable: listenableChangeNotifier,
                                  builder: (context, ref, child) => Visibility(
                                    visible: ref == true,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20.0, bottom: 8),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Incorrect Credential",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .error),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                CustomForm(
                                  formKey: formKey,
                                  child: Column(
                                    children: [
                                      CustomTextFormField(
                                        controller: emailController,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.deny(
                                              RegExp(r'\s')),
                                          UpperCaseFormatter()
                                        ],
                                        textCapitalization:
                                            TextCapitalization.none,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        title: "Email",
                                        validator: (val) =>
                                            val.emailValidator(),
                                      ),
                                      const SizedBox(height: 12),
                                      CustomTextFormField(
                                        controller: passwordController,
                                        title: "Password",
                                        passwordObsureIcon: true,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 16.0),
                                        child: InkWell(
                                          splashFactory:
                                              InkRipple.splashFactory,
                                          onTap: () {},
                                          child: const Align(
                                              alignment: Alignment.centerRight,
                                              child: Text("Forgot Password?",
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .underline))),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: SizedBox.fromSize(
                              size: const Size.fromHeight(48),
                              child: LoginButton(
                                  formKey: formKey,
                                  emailController: emailController,
                                  passwordController: passwordController,
                                  listenableChangeNotifier:
                                      listenableChangeNotifier),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
