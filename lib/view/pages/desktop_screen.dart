import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/utils/extensions.dart';
import 'package:test_app/view/widgets/app_text_field.dart';
import 'package:test_app/view/widgets/custom_form.dart';
import 'package:test_app/view/widgets/login_button.dart';
import 'package:test_app/view/widgets/login_method_widget.dart';
import 'package:test_app/view_model/value_listenable_change_notifier.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({super.key});

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  final GlobalKey<CustomFormState> formKey = GlobalKey<CustomFormState>();
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
    return Scaffold(
      body: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 1000),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: UnconstrainedBox(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1300),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset("assets/logo_black.svg"),
                        const Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text('Design Guild',
                              style: TextStyle(
                                  color: Color(0xFF3C2C20),
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600)),
                        ),
                        const Spacer(),
                        Flexible(
                          child: CustomForm(
                            formKey: formKey,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: CustomTextFormField(
                                        controller: emailController,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 16),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.deny(
                                              RegExp(r'\s')),
                                          UpperCaseFormatter()
                                        ],
                                        textCapitalization:
                                            TextCapitalization.none,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (val) =>
                                            val.emailValidator(),
                                        title: "Email"),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: Column(
                                      children: [
                                        CustomTextFormField(
                                            controller: passwordController,
                                            passwordObsureIcon: true,
                                            title: "Password"),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 16.0),
                                          child: InkWell(
                                            splashFactory:
                                                InkRipple.splashFactory,
                                            onTap: () {},
                                            child: const Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text("Forgot Password?",
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .underline))),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: SizedBox.fromSize(
                                size: const Size(150, 37),
                                child: LoginButton(
                                    formKey: formKey,
                                    emailController: emailController,
                                    passwordController: passwordController,
                                    listenableChangeNotifier:
                                        listenableChangeNotifier),
                              ),
                            ),
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              child: UnconstrainedBox(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1300),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome to Design Guild',
                            style: TextStyle(
                              fontFamily: "sora",
                              fontSize: 48,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Join the world\'s largest community for designers',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF3C2C20)),
                          ),
                          const SizedBox(height: 40),
                          const Text(
                            "Recent Login",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "sora",
                                color: Color(0xFF3C2C20)),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              InkWell(
                                splashFactory: InkRipple.splashFactory,
                                onTap: () {},
                                child: Ink(
                                  width: 156,
                                  height: 158,
                                  decoration: const ShapeDecoration(
                                      shape: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFFC1A28B)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)))),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/random1.png'),
                                        radius: 40,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 16.0),
                                        child: Text(
                                          "Aliana Hepburn",
                                          style: TextStyle(
                                              fontFamily: "dm_sans",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                splashFactory: InkRipple.splashFactory,
                                onTap: () {},
                                child: Ink(
                                  width: 156,
                                  height: 158,
                                  decoration: const ShapeDecoration(
                                      shape: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFFC1A28B)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)))),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/random2.png'),
                                        radius: 40,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 16.0),
                                        child: Text(
                                          "Andrew Pochink",
                                          style: TextStyle(
                                              fontFamily: "dm_sans",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                splashFactory: InkRipple.splashFactory,
                                onTap: () {},
                                child: Ink(
                                    width: 156,
                                    height: 158,
                                    decoration: const ShapeDecoration(
                                        color: Color(0xFFF1EAE4),
                                        shape: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFFC1A28B)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16)))),
                                    child: const Center(
                                      child: CircleAvatar(
                                        backgroundColor: Color(0xFFDFCFC2),
                                        radius: 40,
                                        child: Icon(Icons.add,
                                            size: 24, color: Colors.black),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(flex: 1),
                      Expanded(
                        flex: 4,
                        child: Center(
                          widthFactor: 2,
                          child: SizedBox(
                            height: 478,
                            width: 318,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: "Join Our\n",
                                      style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w700)),
                                  TextSpan(
                                      text: "Community today",
                                      style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w700)),
                                ])),
                                const Padding(
                                  padding: EdgeInsets.only(top: 16.0),
                                  child: Text(
                                      "Get connected, find designers to start a project",
                                      style: TextStyle(
                                          fontFamily: "sora",
                                          fontSize: 20,
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SliverFillRemaining(
              hasScrollBody: false,
              child: SizedBox(
                height: 200,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Color(0xFFFB6564),
                        Color(0xFFA03CEA),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
