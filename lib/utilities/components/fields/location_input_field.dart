// import 'package:flutter/material.dart';

// import '../../../routers/navigator.dart';
// import '../../../routers/routers.dart';
// import '../../theme/text_styles.dart';


// class LocationInputField extends StatefulWidget {
//   const LocationInputField({
//     super.key,
//     this.onChange,
//     this.errorText,
//     this.hintText,
//     this.labelText,
//     this.withBottomPadding = true,
//     this.hasError = false,
//     this.initialValue,
//   });
//   final String? hintText;
//   final String? labelText;
//   final String? errorText;
//   final bool hasError;
//   final Function(LocationData)? onChange;
//   final bool withBottomPadding;
//   final LocationData? initialValue;
//   @override
//   State<LocationInputField> createState() => _LocationInputFieldState();
// }

// class _LocationInputFieldState extends State<LocationInputField> {
//   LocationData? value;
//   @override
//   void initState() {
//     super.initState();
//     value = widget.initialValue;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (widget.labelText != null)
//           Text(
//             widget.labelText ?? "",
//             style: AppTextStyles.w700.copyWith(fontSize: 16),
//           ),
//         const SizedBox(height: 4),
//         GestureDetector(
//           onTap: () async {
//             // ignore: use_build_context_synchronously
//             LatLng position = await CustomNavigator.push(Routes.PICK_LOCATION);

//             value = LocationData(lat: position.latitude, lng: position.longitude,  country:await MapHelper.formatLatLng(latLng: position, getArea: true));
//             widget.onChange?.call(value!);
//             FocusScope.of(context).unfocus();
//             setState(() {});
//           },
//           child: Container(
//             height: 56,
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             decoration: BoxDecoration(
//               border: value != null ? _mapBorder(borderColor: Theme.of(context).colorScheme.primary) : _mapBorder(borderColor: Styles.BORDER_COLOR),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     value != null ? (value!.country ?? "") + (value!.city ?? "") : (widget.hintText ?? "Enter Location"),
//                     style: AppTextStyles.w700.copyWith(fontSize: 14, color: value == null ? Styles.GREY_TEXT_COLOR : null),
//                   ),
//                 ),
//                 drawSvgIcon("location", iconColor: Styles.ICONS_COLOR),
//               ],
//             ),
//           ),
//         ),
//         if (widget.hasError) const SizedBox(height: 8),
//         if (widget.hasError) Text(widget.errorText ?? "Error", style: TextStyle(color: Colors.red)),
//         if (widget.withBottomPadding) const SizedBox(height: 16),
//       ],
//     );
//   }

//   Border _mapBorder({required Color borderColor}) {
//     return Border.all(
//       width: 1,
//       color: borderColor,
//     );
//   }
// }

// class LocationData {
//   num? lat, lng;
//   String? city;
//   String? country;

//   LocationData({this.lng, this.lat, this.city, this.country});
// }
