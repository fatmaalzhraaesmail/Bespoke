import 'package:flutter/material.dart';
import '../../../../base/models/select_option.dart';
import '../../../../routers/navigator.dart';
import '../../../components/custom_btn.dart';
import '../../../theme/text_styles.dart';
import '../../select_option_view.dart';

class SingleSelectBottomSheet extends StatefulWidget {
  const SingleSelectBottomSheet({
    Key? key,
    required this.onSelect,
    required this.valueSet,
    this.selecetedValue,
  }) : super(key: key);
  final Function(SelectOption option) onSelect;
  final List<SelectOption> valueSet;
  final SelectOption? selecetedValue;

  @override
  State<SingleSelectBottomSheet> createState() => _SingleSelectBottomSheetState();
}

class _SingleSelectBottomSheetState extends State<SingleSelectBottomSheet> {
  SelectOption? selecetValue;
  @override
  void initState() {
    super.initState();
    selecetValue = widget.selecetedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 480,
        decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "اختر من القائمة",
                    style: AppTextStyles.w700.copyWith(fontSize: 18, color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () => CustomNavigator.pop(),
                    child: Icon(
                      Icons.close,
                      color: Color(0xff8B97A3),
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(24), child: Divider(height: 1, color: Colors.grey)),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: List.generate(
                      widget.valueSet.length,
                      (index) => GestureDetector(
                        onTap: () {
                          selecetValue = widget.valueSet[index];
                          setState(() {
                            
                          });
                        },
                        child: SelectOptionView(
                          isSelected: selecetValue!=null? (selecetValue!.value == widget.valueSet[index].value):false,
                          option: widget.valueSet[index],
                        )
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:24,vertical: 16),
              child: CustomBtn(
                text: "تأكيد",
                onTap: () {
                  widget.onSelect(selecetValue!);
                  CustomNavigator.pop();
                },
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
