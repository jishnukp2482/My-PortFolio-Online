import 'dart:ui_web' as ui;

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http_parser/http_parser.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/about/about_controller.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/about/about_state.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_bottom_msg.dart';
import 'dart:html' as html;

class UploadResumePage extends ConsumerStatefulWidget {
  const UploadResumePage({super.key});

  @override
  ConsumerState<UploadResumePage> createState() => _UploadResumePageState();
}

class _UploadResumePageState extends ConsumerState<UploadResumePage> {
  late AboutController aboutController;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        aboutController = ref.read(aboutControllerProvider.notifier);
        aboutController.downloadResume(true);
      },
    );
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final aboutState = ref.watch(aboutControllerProvider);
    final resume = aboutState.downloadResumeResponseModel?.data;
    ref.listen(
      aboutControllerProvider,
      (previous, next) {
        if (previous?.isLoading == true && next.isLoading == false) {
          if (next.errorMsg != null) {
            bottomMsg(context, next.errorMsg ?? "");
          } else {
            bottomMsg(context, "Resume Uploaded SuccessFully");
          }
        }
      },
    );

    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 50.h,
        children: [
          Text(
            "Upload Resume",
            style: GoogleFonts.inter(
              color: AppColors.appBlue,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2.w,
              fontSize: 26.sp,
            ),
          ),
          Center(
              child: resume == null
                  ? _uploadBox(context, aboutController, aboutState)
                  : _resumeCard(
                      context, resume.fileUrl, aboutController, aboutState))
        ],
      ),
    ));
  }

  Widget _uploadBox(BuildContext context, AboutController aboutController,
      AboutState aboutState) {
    return GestureDetector(
      onTap: aboutState.isLoading
          ? null
          : () async {
              final result = await FilePicker.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
                withData: true,
              );

              if (result != null) {
                final file = result.files.first;
                final multipartFile = MultipartFile.fromBytes(
                  file.bytes!,
                  filename: file.name,
                  contentType: MediaType('application', 'pdf'),
                );
                aboutController.uploadResume(multipartFile);
              }
            },
      child: Container(
        height: 200.h,
        width: 400.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          gradient: LinearGradient(colors: [
            Theme.of(context).primaryColorDark,
            AppColors.lightBlack,
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
        ),
        child: Center(
          child: aboutState.isLoading
              ? CircularProgressIndicator(
                  color: AppColors.appBlue,
                )
              : Icon(
                  Icons.upload_file_outlined,
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  size: 37.sp,
                ),
        ),
      ),
    );
  }

  Widget pdfPreview(String url) {
    final viewId = 'pdf-${url.hashCode}';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      viewId,
      (int viewId) => html.IFrameElement()
        ..src = url
        ..style.border = 'none'
        ..width = '100%'
        ..height = '100%',
    );

    return SizedBox(
      height: 400,
      width: 400,
      child: HtmlElementView(viewType: viewId),
    );
  }

  Widget _resumeCard(BuildContext context, String url,
      AboutController aboutController, AboutState aboutState) {
    return Container(
      width: 400.w,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        color: AppColors.lightBlack,
      ),
      child: Column(
        children: [
          pdfPreview(url),
          SizedBox(
            height: 25.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    html.window.open(url, "_blank");
                  },
                  child: Text("View")),
              ElevatedButton(
                  onPressed: aboutState.isLoading
                      ? null
                      : () async {
                          final result = await FilePicker.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['pdf'],
                            withData: true,
                          );

                          if (result != null) {
                            final file = result.files.first;
                            final multipartFile = MultipartFile.fromBytes(
                              file.bytes!,
                              filename: file.name,
                              contentType: MediaType('application', 'pdf'),
                            );
                            aboutController.uploadResume(multipartFile);
                          }
                        },
                  child: Text("Update"))
            ],
          )
        ],
      ),
    );
  }
}
