import 'dart:io';
import 'package:flutter/material.dart';
import '../../../handlers/icon_handler.dart';
import '../../../handlers/image_picker_handler.dart';
import '../../components/custom_btn.dart';
import '../../theme/media.dart';
import '../../theme/text_styles.dart';

class ImageInputField extends StatefulWidget {
  const ImageInputField({
    super.key,
    this.onChange,
    this.errorText,
    this.initialValue,
    this.labelText,
    this.hintText,
    this.withBottomPadding = true,
    this.hasError = false,
    this.requestTitle,
  });
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final bool hasError;
  final File? initialValue;
  final Function(File?)? onChange;
  final bool withBottomPadding;
  final String? requestTitle;
  @override
  State<ImageInputField> createState() => _ImageInputFieldState();
}

class _ImageInputFieldState extends State<ImageInputField> {
  File? _image;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _image = widget.initialValue;
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
          onTap: _image == null
              ? () async {
                  setState(() {
                    isLoading = true;
                  });
                  File? file = await ImagePickerHelper.pickImage();
                  _image = file;
                  // if (file != null) {
                  //   // _image = await NetworkHandler.instance!.get(url: ApiNames().);
                  //   // ,().request(Endpoints.UPLOAD_IMAGE_WITHOUT_RESIZE,
                  //   //     method: ServerMethods.POST,
                  //   //     model: File(),
                  //   //     body: FormData.fromMap({
                  //   //       "image": await MultipartFile.fromFile(file.path),
                  //   //       "title": widget.requestTitle,
                  //   //     }));
                  //   if (_image?.statusCode == 200) {
                  //     widget.onChange?.call(_image);
                  //   } else {
                  //     _image = null;
                  //   }
                  // }
                  setState(() {
                    isLoading = false;
                  });
                }
              : null,
          borderRadius: BorderRadius.circular(8),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: _image == null ? 124 : 152,
            width: MediaHelper.width,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/dashed_border.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : _image == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          drawSvgIcon("upload", iconColor: Theme.of(context).hintColor, width: 24, height: 24),
                          SizedBox(height: 8),
                          Text(
                            widget.hintText ?? "قم برفع صورة",
                            style: AppTextStyles.w400.copyWith(fontSize: 14, color: Theme.of(context).hintColor),
                          )
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(image: FileImage(_image!), fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  _image!.path.split("/").last,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: CustomBtn(
                                  text: "Remove",
                                  height: 36,
                                  buttonColor: Colors.transparent,
                                  textColor: Theme.of(context).colorScheme.primary,
                                  onTap: () {
                                    setState(() {
                                      _image = null;
                                    });
                                    widget.onChange?.call(_image);
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: CustomBtn(
                                  text: "Change",
                                  height: 36,
                                  onTap: () async {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    File? file = await ImagePickerHelper.pickImage();
                                    _image = file;
                                    // File? file = await ImagePickerHelper.openGallery();
                                    // if (file != null) {
                                    //   _image = await Network().request(Endpoints.UPLOAD_IMAGE_WITHOUT_RESIZE,
                                    //       method: ServerMethods.POST,
                                    //       model: File(),
                                    //       body: FormData.fromMap({
                                    //         "image": await MultipartFile.fromFile(file.path),
                                    //         "title": widget.requestTitle,
                                    //       }));
                                    //   widget.onChange?.call(_image);
                                    // }
                                    setState(
                                      () {
                                        isLoading = false;
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
          ),
        ),
        const SizedBox(width: 16),
        if (widget.withBottomPadding) const SizedBox(height: 16),
      ],
    );
  }
}
