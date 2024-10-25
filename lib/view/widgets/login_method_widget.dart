import 'package:flutter/material.dart';

class LoginMethodWidget extends StatelessWidget {
  const LoginMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Or, Login in with"),
            Row(
              children: [
                Expanded(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      onTap: () {},
                      child: SizedBox(
                        height: 38,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFAFA2C3),
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4))),
                          child: const Center(
                            child: Text(
                              "FaceBook",
                              style: TextStyle(color: Color(0xFF3E334E)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      onTap: () {},
                      child: SizedBox(
                        height: 38,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFAFA2C3),
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4))),
                          child: const Center(
                            child: Text(
                              "LinkedIn",
                              style: TextStyle(color: Color(0xFF3E334E)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashFactory: InkRipple.splashFactory,
                      onTap: () {},
                      child: SizedBox(
                        height: 38,
                        child: Ink(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFAFA2C3),
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4))),
                          child: const Center(
                            child: Text(
                              "Google",
                              style: TextStyle(color: Color(0xFF3E334E)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
