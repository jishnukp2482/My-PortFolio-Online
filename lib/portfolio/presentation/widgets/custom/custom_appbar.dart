// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pride_agent_collection/pride_collection/presentation/themes/app_colors.dart';

// class CustomAppBar extends StatelessWidget {
//   const CustomAppBar({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     this.onPressed,
//     this.isnotLoginpage = false,
//     this.height,
//     this.firstcircleradius,
//     this.secondcircleradius,
//     this.locationTitle,
//     this.locationName,
//     this.isAccountPage = false,
//     this.isNotShowBackButton = false,
//     this.firstCircleColor,
//     this.secondCircleColor,
//     this.thirdCircleColor,
//   });
//   final double? height;
//   final String title;
//   final String subtitle;
//   final void Function()? onPressed;
//   final bool? isnotLoginpage;
//   final double? firstcircleradius;
//   final double? secondcircleradius;
//   final bool? isAccountPage;
//   final String? locationTitle;
//   final String? locationName;
//   final bool? isNotShowBackButton;
//   final Color? firstCircleColor;
//   final Color? secondCircleColor;
//   final Color? thirdCircleColor;
//   @override
//   Widget build(BuildContext context) {
//     final h = MediaQuery.sizeOf(context).height;
//     final w = MediaQuery.sizeOf(context).width;
//     return Container(
//       height: height ?? h * 0.5,
//       color: thirdCircleColor ?? Theme.of(context).primaryColorDark,
//       child: Stack(
//         children: [
//           //second circle
//           Positioned(
//             left: -w * 0.1,
//             top: -h * 0.1,
//             child: CircleAvatar(
//               radius: secondcircleradius ?? w * 0.5,
//               backgroundColor:
//                   secondCircleColor ?? Theme.of(context).primaryColorLight,
//             ),
//           ),
//           //firstcircle
//           Positioned(
//             top: -h * 0.1,
//             left: -w * 0.4,
//             child: CircleAvatar(
//               radius: firstcircleradius ?? w * 0.5,
//               backgroundColor:
//                   firstCircleColor ?? Theme.of(context).primaryColor,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.fromLTRB(w * 0.05, h * 0.05, 0, h * 0.1),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 isnotLoginpage == false && isNotShowBackButton == false
//                     ? Padding(
//                         padding: EdgeInsets.only(bottom: h * 0.07),
//                         child: Container(
//                           width: w * 0.08,
//                           height: w * 0.08,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border:
//                                   Border.all(color: const Color(0xff2563EB))),
//                           child: IconButton(
//                               padding: EdgeInsets.zero,
//                               onPressed: () {
//                                 onPressed!();
//                               },
//                               icon: Icon(
//                                 Icons.arrow_back,
//                                 size: w * 0.05,
//                                 color: AppColors.white,
//                               )),
//                         ),
//                       )
//                     : const SizedBox.shrink(),
//                 isnotLoginpage == false
//                     ? Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(title,
//                               style: GoogleFonts.poppins(
//                                   fontWeight: FontWeight.w600,
//                                   color: AppColors.white,
//                                   fontSize: w * 0.06)),
//                           SizedBox(
//                             height: h * 0.005,
//                           ),
//                           Text(subtitle,
//                               style: GoogleFonts.poppins(
//                                   fontWeight: FontWeight.w500,
//                                   color: AppColors.white,
//                                   fontSize: w * 0.03))
//                         ],
//                       )
//                     : Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             width: w * 0.1,
//                             height: w * 0.1,
//                             alignment: Alignment.center,
//                             decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 border:
//                                     Border.all(color: const Color(0xff2563EB))),
//                             child: IconButton(
//                                 padding: EdgeInsets.zero,
//                                 onPressed: () {
//                                   onPressed!();
//                                 },
//                                 icon: Icon(
//                                   Icons.arrow_back,
//                                   size: w * 0.07,
//                                   color: AppColors.white,
//                                 )),
//                           ),
//                           SizedBox(
//                             width: w * 0.05,
//                           ),
//                           Text(title,
//                               style: GoogleFonts.poppins(
//                                   fontWeight: FontWeight.w600,
//                                   color: AppColors.white,
//                                   fontSize: w * 0.06))
//                         ],
//                       ),
//                 isAccountPage == true
//                     ? Padding(
//                         padding: EdgeInsets.only(right: w * 0.04),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             SizedBox(
//                               height: h * 0.032,
//                               // color: AppColors.black,
//                               child: Text(
//                                 textAlign: TextAlign.start,
//                                 locationTitle ?? "",
//                                 overflow: TextOverflow.ellipsis,
//                                 style: GoogleFonts.poppins(
//                                     fontSize: w * 0.035,
//                                     color: AppColors.white),
//                               ),
//                             ),
//                             SizedBox(
//                               //color: AppColors.red,
//                               width: w * 0.75,
//                               height: h * 0.032,
//                               child: Text(
//                                 textAlign: TextAlign.start,
//                                 locationName ?? " ",
//                                 overflow: TextOverflow.ellipsis,
//                                 style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: w * 0.035,
//                                     color: AppColors.white),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     : const SizedBox.shrink(),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
