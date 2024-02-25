import 'package:flutter/material.dart';
import '../../../../base/models/select_option.dart';
import '../../../../handlers/icon_handler.dart';
import '../../../theme/text_styles.dart';
import 'check_boxs_bottomsheet.dart';

class CheckBoxsInputField extends StatefulWidget {
  const CheckBoxsInputField({
    super.key,
    this.onChange,
    this.errorText,
    this.hintText,
    this.labelText,
    this.withBottomPadding = true,
    this.hasError = false,
    this.initialValue,
    required this.valueSet,
  });
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final bool hasError;
  final Function(List<SelectOption>)? onChange;
  final bool withBottomPadding;
  final List<SelectOption> valueSet;
  final List<SelectOption>? initialValue;
  @override
  State<CheckBoxsInputField> createState() => _CheckBoxsInputFieldState();
}

class _CheckBoxsInputFieldState extends State<CheckBoxsInputField> {
  List<SelectOption> values = [];
  @override
  void initState() {
    super.initState();
    values = widget.initialValue??[];
  }

  @override
  Widget build(BuildContext context) {
    String valuesText = "";
    values.forEach((element) {
      valuesText += element.label + ", ";
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) Text(widget.labelText ?? ""),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () async {
            await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              ),
              builder: (context) => CheckBoxsBottomSheet(
                valueSet: widget.valueSet,
                selecetValue: values,
                onSelect: (options) {
                  setState(() {
                    values = options;
                  });
                  widget.onChange?.call(options);
                },
              ),
            );
            // ignore: use_build_context_synchronously
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            height: 46,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: values.isNotEmpty ? _mapBorder(borderColor: Theme.of(context).colorScheme.primary) : _mapBorder(borderColor: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    values.isNotEmpty ? valuesText : widget.hintText ?? "",
                    style: AppTextStyles.w300.copyWith(color: values.isNotEmpty ? Theme.of(context).hintColor : null),
                  ),
                ),
                 drawSvgIcon("arrow_down_ios",iconColor: Theme.of(context).hintColor),
              ],
            ),
          ),
        ),
        if (widget.hasError) const SizedBox(height: 8),
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

  Border _mapBorder({required Color borderColor}) {
    return Border.all(
      width: 1,
      color: borderColor,
    );
  }
}