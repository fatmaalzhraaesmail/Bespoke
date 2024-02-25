// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import '../../../handlers/file_picker_handler.dart';
import '../../../handlers/icon_handler.dart';
import '../../components/custom_btn.dart';
import '../../theme/media.dart';
import '../../theme/text_styles.dart';

class FileInputField extends StatefulWidget {
  const FileInputField({
    super.key,
    required this.requestTitle,
    this.onChange,
    this.errorText,
    this.initialValue,
    this.labelText,
    this.withBottomPadding = true,
    this.hasError = false,
  });
  final String? labelText;
  final String? errorText;
  final bool hasError;
  final File? initialValue;
  final Function(File?)? onChange;
  final bool withBottomPadding;
  final String requestTitle;
  @override
  State<FileInputField> createState() => _FileInputFieldState();
}

class _FileInputFieldState extends State<FileInputField> {
  File? _file;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _file = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText ?? "",
          style: AppTextStyles.w700.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: _file == null
              ? () async {
                  setState(() {
                    isLoading = true;
                  });
                  _file = await FilePickerHelper.pickFile(allowedExtensions: ["pdf"]);
                  // _file = await Network().request(
                  //   Endpoints.UPLOAD_FILE,
                  //   method: ServerMethods.POST,
                  //   model: FileModel(),
                  //   body: FormData.fromMap(
                  //     {
                  //       "file": await MultipartFile.fromFile(file.path),
                  //       "title": widget.requestTitle,
                  //     },
                  //   ),
                  // );
                  // if (_file!.statusCode == 200) {
                  //   widget.onChange?.call(_file);
                  // } else {
                  //   _file = null;
                  // }
                  setState(() {
                    isLoading = false;
                  });
                }
              : null,
          borderRadius: BorderRadius.circular(8),
          child: isLoading
              ? Container(
                  height: _file == null ? 146 : 136,
                  width: MediaHelper.width,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage("assets/images/dashed_border.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  height: _file == null ? 146 : 136,
                  width: MediaHelper.width,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage("assets/images/dashed_border.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: _file == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            drawSvgIcon(
                              "upload",
                              width: 24,
                              height: 24,
                              iconColor: Theme.of(context).hintColor,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "قم برفع ملف",
                              style: AppTextStyles.w400.copyWith(fontSize: 14),
                            )
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  drawSvgIcon(
                                    "pdf",
                                    iconColor: Theme.of(context).colorScheme.primary,
                                    width: 36,
                                    height: 36,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      _file == null ? "" : _file!.path.split('/').last,
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomBtn(
                                    text: "ازالة",
                                    height: 36,
                                    buttonColor: Colors.transparent,
                                    textColor: Theme.of(context).colorScheme.primary,
                                    onTap: () {
                                      setState(() {
                                        _file = null;
                                      });
                                      widget.onChange?.call(_file);
                                    },
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: CustomBtn(
                                    text: "تغير",
                                    height: 36,
                                    onTap: () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      _file = await FilePickerHelper.pickFile(allowedExtensions: ["pdf"]);
                                      // File file = await FilePickerHelper.pickFile(allowedExtensions: ["pdf"]);
                                      // _file = await Network().request(
                                      //   Endpoints.UPLOAD_FILE,
                                      //   method: ServerMethods.POST,
                                      //   model: FileModel(),
                                      //   body: FormData.fromMap({
                                      //     "file": await MultipartFile.fromFile(file.path),
                                      //     "title": widget.requestTitle,
                                      //   }),
                                      // );
                                      // if (_file!.statusCode == 200) {
                                      //   widget.onChange?.call(_file);
                                      // } else {
                                      //   _file = null;
                                      // }
                                      setState(() {
                                        isLoading = false;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
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
}
