import 'package:flutter/material.dart';

import '../../theme/text_styles.dart';


class TextDescriptionInputField extends StatefulWidget {
  const TextDescriptionInputField({
    super.key,
    this.onChange,
    this.controller,
    this.errorText,
    this.hintText,
    this.initialValue,
    this.labelText,
    this.withBottomPadding = true,
    this.hasError = false,
  });
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final bool hasError;
  final String? initialValue;
  final TextEditingController? controller;
  final Function(String)? onChange;
  final bool withBottomPadding;
  @override
  State<TextDescriptionInputField> createState() => _TextDescriptionInputFieldState();
}

class _TextDescriptionInputFieldState extends State<TextDescriptionInputField> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Text(
            widget.labelText ?? "",
            style: AppTextStyles.w700.copyWith(fontSize: 14),
          ),
        if (widget.labelText != null) const SizedBox(height: 4),
        SizedBox(
          height: 150,
          child: TextFormField(
            expands: true,
            maxLines: null,
            minLines: null,
            textAlignVertical: TextAlignVertical.top,
            controller: widget.controller,
            initialValue: widget.controller != null ? null : widget.initialValue,
            onChanged: (val) {
              setState(() {
                if (val.isNotEmpty)
                  this.value = val;
                else
                  this.value = null;
              });
              widget.onChange?.call(val);
            },
            keyboardType: TextInputType.multiline,
            style: AppTextStyles.w300,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.grey),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              enabledBorder: _mapBorder(borderColor: value == null ?Colors.grey : Theme.of(context).colorScheme.primary),
              focusedBorder: _mapBorder(borderColor: Theme.of(context).colorScheme.primary),
              errorBorder: _mapBorder(borderColor: Colors.red),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),
        if (widget.hasError) const SizedBox(height: 4),
        if (widget.hasError)
          Row(
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 16),
              const SizedBox(width: 4),
              Text(widget.errorText ?? "Error", style: const TextStyle(color: Colors.red)),
            ],
          ),
        if (widget.withBottomPadding) const SizedBox(height: 16),
      ],
    );
  }

  OutlineInputBorder _mapBorder({required Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: borderColor),
    );
  }
}
