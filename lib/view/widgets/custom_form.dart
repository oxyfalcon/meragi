import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/view_model/value_listenable_change_notifier.dart';

class CustomForm extends StatelessWidget {
  final GlobalKey<CustomFormState>? formKey;
  const CustomForm({super.key, this.formKey, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ValueListenableChangeNotifier<bool>>(
      create: (context) => ValueListenableChangeNotifier<bool>(value: false),
      builder: (context, child) => _CustomForm(
          key: formKey,
          onChanged: () {
            if (context.read<ValueListenableChangeNotifier<bool>>().value!) {
              formKey!.currentState!.validate();
            }
          },
          child: this.child),
    );
  }
}

class _CustomForm extends Form {
  const _CustomForm({super.key, required super.child, super.onChanged});

  @override
  FormState createState() => CustomFormState();
}

class CustomFormState extends FormState {
  @override
  bool validate() {
    context.read<ValueListenableChangeNotifier<bool>>().setValue(true);
    return super.validate();
  }

  @override
  void reset() {
    super.reset();
    context.read<ValueListenableChangeNotifier<bool>>().setValue(false);
  }
}
