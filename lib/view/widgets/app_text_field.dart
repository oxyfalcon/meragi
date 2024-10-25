import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_app/view_model/value_listenable_change_notifier.dart';

class CustomTextFormField extends FormField<String> {
  CustomTextFormField({
    super.key,
    super.validator,
    required final TextEditingController controller,
    required final String title,
    String? hintText,
    String? labelText,
    final TextCapitalization? textCapitalization,
    final bool passwordObsureIcon = false,
    final TextInputType? keyboardType,
    final Widget? prefixIcon,
    final bool obscureText = false,
    final List<TextInputFormatter>? inputFormatters,
    final bool enabled = true,
    final void Function(String? value)? onChanged,
    final EdgeInsets? contentPadding,
  }) : super(
          initialValue: controller.text,
          builder: (state) {
            void onFieldChangedCallBack(String? value) =>
                state.didChange(value);

            return _AppTextFormField(
              title: title,
              key: key,
              errorText: state.errorText,
              validator: validator,
              textCapitalization: textCapitalization,
              passwordObsureIcon: passwordObsureIcon,
              keyboardType: keyboardType,
              hintText: hintText,
              labelText: labelText,
              onFieldChanged: onFieldChangedCallBack,
              enabled: enabled,
              controller: controller,
              prefixIcon: prefixIcon,
              obscureText: obscureText,
              inputFormatters: inputFormatters,
              onChanged: onChanged,
              contentPadding: contentPadding,
            );
          },
        );
}

class _AppTextFormField extends StatefulWidget {
  final String? hintText, labelText;
  final String title;
  final String? errorText;
  final TextCapitalization? textCapitalization;
  final bool passwordObsureIcon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String?) onFieldChanged;
  final bool enabled;
  final Widget? prefixIcon;
  final void Function(String? value)? onChanged;
  final EdgeInsets? contentPadding;

  const _AppTextFormField({
    super.key,
    required this.controller,
    required this.onFieldChanged,
    required this.title,
    this.textCapitalization,
    this.errorText,
    this.passwordObsureIcon = false,
    this.keyboardType,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.inputFormatters,
    this.validator,
    this.enabled = true,
    this.prefixIcon,
    this.onChanged,
    this.contentPadding,
  });

  @override
  State<_AppTextFormField> createState() => _AppTextFormFieldStateTwo();
}

class _AppTextFormFieldStateTwo extends State<_AppTextFormField> {
  bool _isTextObsure = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.validator != null) {
        widget.onFieldChanged.call(widget.controller.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        TextField(
          onChanged: widget.onChanged,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          inputFormatters: [...?widget.inputFormatters],
          style: widget.enabled
              ? null
              : const TextStyle(
                  color: Color(0xFF242424),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          obscureText:
              (widget.passwordObsureIcon) ? _isTextObsure : widget.obscureText,
          decoration: InputDecoration(
            floatingLabelStyle: TextStyle(
                color: widget.enabled
                    ? widget.errorText != null
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).colorScheme.primary
                    : const Color.fromRGBO(90, 90, 96, 1)),
            enabled: widget.enabled,
            errorText: widget.validator != null
                ? context.read<ValueListenableChangeNotifier<bool>>().value!
                    ? widget.errorText
                    : null
                : null,
            isDense: true,
            hintText: widget.hintText,
            labelText: widget.labelText,
            hintStyle: const TextStyle(color: Color(0xFFD4D4D4)),
            filled: false,
            contentPadding: widget.contentPadding ??
                const EdgeInsets.fromLTRB(16, 8, 16, 8),
            suffixIcon: (widget.passwordObsureIcon)
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isTextObsure = !_isTextObsure;
                      });
                    },
                    icon: Icon(
                      _isTextObsure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 12,
                      color: const Color(0xFF9DA3AA),
                    ))
                : null,
            prefixIcon: widget.prefixIcon,
            errorStyle: TextStyle(color: Theme.of(context).colorScheme.error),
            errorMaxLines: 4,
            focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            errorBorder: widget.validator != null
                ? context.read<ValueListenableChangeNotifier<bool>>().value!
                    ? widget.errorText != null
                        ? OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.error),
                          )
                        : null
                    : null
                : null,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Color(0xFFCFCFD2))),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Color(0xFFCFCFD2))),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            disabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                    color: widget.controller.text.isNotEmpty
                        ? const Color.fromRGBO(175, 175, 175, 1)
                        : const Color(0xFFCFCFD2))),
          ),
        ),
      ],
    );
  }
}
