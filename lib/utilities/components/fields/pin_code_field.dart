import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:bespoke/handlers/localization_handler.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeField extends StatelessWidget {
  final void Function(String?)? onSave;
  final void Function(String) onChanged;
  final TextEditingController? controller;
  final String? errorText;
  final bool hasError;
  PinCodeField({this.onSave, required this.onChanged, this.controller, this.errorText, this.hasError = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 24
      ),
      child: Column(
        children: [
          PinCodeTextField(
            
            // validator: (v) => VerifyCodeValidator.verifyCodeValidator(v!),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: Theme.of(context).primaryColor,
            backgroundColor: Colors.transparent,
            autoDisposeControllers: false,
            autoDismissKeyboard: true,
            enableActiveFill: true,
            controller: controller,
            enablePinAutofill: true,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Theme.of(context).primaryColor),
            pastedTextStyle: TextStyle(color: Color(0xFF8344AD)),
            pinTheme: PinTheme(
              borderWidth: 1,
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(10),
              fieldHeight: 60,
              fieldWidth: 60,
              fieldOuterPadding: EdgeInsets.symmetric(horizontal: 5),
              // activeFillColor: Styles.ACCENT_PRIMARY_COLOR,
              activeColor:Theme.of(context).primaryColor,
              inactiveColor: Colors.grey,
              inactiveFillColor: Colors.transparent,
              selectedFillColor: Colors.transparent,
              selectedColor: Theme.of(context).primaryColor.withOpacity(.4),
              disabledColor: Colors.transparent,
            ),
            appContext: context,
            length: 4,
            onSaved: onSave,
            onChanged: onChanged,
            hintCharacter: "-",
            hintStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          if (hasError)
            Row(
              textDirection: AppLocale.of(context).locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 16),
                const SizedBox(width: 4),
                Text(errorText ?? "Error", style: const TextStyle(color: Colors.red)),
              ],
            ),
        ],
      ),
    );
  }
}
