// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:jailbreak_root_detection/jailbreak_root_detection.dart';
// import 'package:pride_agent_collection/pride_collection/presentation/widgets/custom/custom_print.dart';
// import 'package:pride_agent_collection/pride_collection/presentation/widgets/custom/custom_snackbar.dart';
// import 'package:pride_agent_collection/pride_collection/presentation/widgets/custom/custome_alert_dialogue.dart';

// class SecurityBreakChecker {
//   Timer? timer;

//   void startChecking() {
//     timer = Timer.periodic(
//       const Duration(seconds: 30),
//       (timer) {
//         checkJailBreak();
//       },
//     );
//   }

//   void stopChecking() {
//     timer?.cancel();
//     timer = null;
//   }

//   Future<void> checkJailBreak() async {
//     try {
//       final isJailBroken = await JailbreakRootDetection.instance.isJailBroken;
//       final isRealDevice = await JailbreakRootDetection.instance.isRealDevice;
//       final isDevMode = await JailbreakRootDetection.instance.isDevMode;

//       if (isJailBroken) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           customAlertDialogue(
//               title: "Security Alert",
//               content:
//                   "This device is jailbroken or rooted. You cannot use the app under these conditions.",
//               txtbutton1Action: () {
//                 exit(0);
//               },
//               txtbuttonName1: "Exit");
//         });
//         return;
//       }

//       if (!isRealDevice) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           customAlertDialogue(
//               title: "Security Alert",
//               content:
//                   "This device is not a real device (emulator detected). You cannot use the app under these conditions.",
//               txtbutton1Action: () {
//                 exit(0);
//               },
//               txtbuttonName1: "Exit");
//         });
//         return;
//       }

//       if (isDevMode) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           customAlertDialogue(
//               title: "Security Alert",
//               content:
//                   "The device is in Developer Mode. Turn off Developer Mode to use this app.",
//               txtbutton1Action: () {
//                 exit(0);
//               },
//               txtbutton2Action: () {
//                 openDeveloperOptions();
//               },
//               txtbuttonName2: "Open Settings",
//               txtbuttonName1: "Exit");
//         });
//       } else {
//         customPrint('Device is secure. Proceeding...');
//       }
//     } catch (e) {
//       bottomMsg("Error", "$e", false);
//       customPrint("ClientId storage Failed:$e");
//     }
//   }

//   static const platform = MethodChannel('posPrintingChannel');

//   Future<void> openDeveloperOptions() async {
//     try {
//       await platform.invokeMethod('openDeveloperOptions');
//     } on PlatformException catch (e) {
//       customPrint("Failed to open Developer Options: '${e.message}'.");
//     }
//   }
// }
