import 'package:flutter/material.dart';
import 'package:bespoke/handlers/icon_handler.dart';
import '../../../../base/models/select_option.dart';
import '../../../components/custom_btn.dart';
import '../../../theme/text_styles.dart';
import '../../check_box_view.dart';

class CheckBoxsBottomSheet extends StatefulWidget {
  const CheckBoxsBottomSheet({
    Key? key,
    required this.onSelect,
    required this.valueSet,
    this.selecetValue,
  }) : super(key: key);
  final Function(List<SelectOption> option) onSelect;
  final List<SelectOption> valueSet;
  final List<SelectOption>? selecetValue;

  @override
  State<CheckBoxsBottomSheet> createState() => _CheckBoxsBottomSheetState();
}

class _CheckBoxsBottomSheetState extends State<CheckBoxsBottomSheet> {
  List<SelectOption> selectedList = [];
  @override
  void initState() {
    // TODO: implement initState
    selectedList = widget.selecetValue ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 400,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).hintColor.withOpacity(.5),
                borderRadius: const BorderRadius.all(Radius.circular(2)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  GestureDetector(onTap: () => Navigator.of(context).pop(), child: drawSvgIcon("close_circle", iconColor: Theme.of(context).colorScheme.primary)),
                  Expanded(
                    child: Center(
                      child: Text(
                        "اختر من القائمة",
                        style: AppTextStyles.w600.copyWith(fontSize: 18, color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Column(
                children: List.generate(
                  widget.valueSet.length,
                  (index) {
                    bool isSelected = false;
                    if (widget.selecetValue != null) {
                      isSelected = widget.selecetValue!.any((element) => element.value == widget.valueSet[index].value);
                    }
                    return ListTile(
                      onTap: () {
                        if (selectedList.any((element) => element.value == widget.valueSet[index].value)) {
                          selectedList.removeWhere((element) => element.value == widget.valueSet[index].value);
                        } else {
                          selectedList.add(widget.valueSet[index]);
                        }
                        setState(() {});
                      },
                      minLeadingWidth: 12,
                      dense: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                      leading: CheckBoxView(isChecked: isSelected),
                      title: Text(
                        widget.valueSet[index].label,
                        style: AppTextStyles.w600.copyWith(fontSize: 18, color: Colors.black),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: CustomBtn(
                text: "تأكيد",
                onTap: () {
                  widget.onSelect(selectedList);

                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
