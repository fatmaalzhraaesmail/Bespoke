import 'package:flutter/material.dart';
import 'package:bespoke/utilities/components/fields/single_select_bottomsheet/single_select_bottomsheet.dart';

import '../../../../base/models/select_option.dart';
import '../../../../handlers/icon_handler.dart';
import '../../../theme/text_styles.dart';


class SingleSelectInputField extends StatefulWidget {
  const SingleSelectInputField({
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
  final Function(SelectOption)? onChange;
  final bool withBottomPadding;
  final List<SelectOption> valueSet;
  final SelectOption? initialValue;
  @override
  State<SingleSelectInputField> createState() => _SingleSelectInputFieldState();
}

class _SingleSelectInputFieldState extends State<SingleSelectInputField> {
  SelectOption? value;
  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Text(
            widget.labelText ?? "",
            style: AppTextStyles.w700.copyWith(fontSize: 16),
          ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () async {
            await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              ),
              builder: (context) => SingleSelectBottomSheet(
                valueSet: widget.valueSet,
                selecetedValue: value,
                onSelect: (option) {
                  setState(() {
                    value = option;
                  });
                  widget.onChange?.call(option);
                },
              ),
            );
            // ignore: use_build_context_synchronously
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: value != null ? _mapBorder(borderColor: Theme.of(context).colorScheme.primary) : _mapBorder(borderColor: Theme.of(context).hintColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value != null ? value!.label : widget.hintText ?? "",
                    style: AppTextStyles.w700.copyWith(fontSize: 14,color: value == null ? Theme.of(context).hintColor : null),
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