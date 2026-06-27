import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/project/project_controller.dart';
import 'package:potfolio/portfolio/presentation/pages/admin/project/helper/update_project_helper.dart';
import 'package:potfolio/portfolio/presentation/pages/projects/common/project_grid_desktop.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_bottom_msg.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_loader.dart';

class UpdateProject extends ConsumerStatefulWidget {
  const UpdateProject({super.key});

  @override
  ConsumerState<UpdateProject> createState() => _UpdateContactState();
}

class _UpdateContactState extends ConsumerState<UpdateProject> {
  late ProjectController projectController;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      projectController = ref.read(projectControllerProvider.notifier);
      projectController.fetchProjects();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final projectState = ref.watch(projectControllerProvider);
    final projectController = ref.read(projectControllerProvider.notifier);
    ref.listen(projectControllerProvider, (previous, next) {
      if (previous?.isLoading == false && next.isLoading == true) {
        AppLoader.show(context);
      }
      if (previous?.isLoading == true && next.isLoading == false) {
        AppLoader.hide(context);
      }
      if (previous?.isLoading == true &&
          next.isLoading == false &&
          next.errorMsg != null) {
        bottomMsg(context, next.errorMsg ?? "");
        projectController.clearMessages();
      }
      if (previous?.isLoading == true &&
          next.isLoading == false &&
          next.createProjectResponse != null) {
        Future.microtask(() {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          bottomMsg(context, "Project Created successfully");
          projectController.clearMessages();
        });

        bottomMsg(context, "Project updated successfully");
        projectController.clearMessages();
      }
      if (previous?.isLoading == true &&
          next.isLoading == false &&
          next.updateProjectResponse != null) {
        Future.microtask(() {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        });

        bottomMsg(context, "Project updated successfully");
        projectController.clearMessages();
      }
      if (previous?.isLoading == true &&
          next.isLoading == false &&
          next.deleteProjectResponseModal != null) {
        Future.microtask(() {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        });
        bottomMsg(context, "Project Deleted successfully");
        projectController.clearMessages();
      }
      if (previous?.isLoading == true &&
          next.isLoading == false &&
          next.deleteProjectImgResponse != null) {
        bottomMsg(context, "Project Img Deleted successfully");
        projectController.clearMessages();
      }
    });

    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(20.w),
          children: [
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Projects",
                  style: GoogleFonts.inter(
                    color: AppColors.appBlue,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2.w,
                    fontSize: 26.sp,
                  ),
                ),
                SizedBox(width: 10.w),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    projectAlert(
                      context: context,
                      onConfirm: (model) {
                        projectController.createProject(model);
                      },
                      projectController: projectController,
                      projectState: projectState
                    );
                  },
                  icon: Icon(Icons.add, color: AppColors.appBlue),
                ),
              ],
            ),
            SizedBox(height: 50.h),
            ProjectsGridMenu(
              isFromAdmin: true,

              onDelete: (p0) {
                deleteItemProject(
                  context: context,
                  title: "Project",
                  deletingItemTtitle:
                      "${p0.projectName} - Show Status: ${p0.show}",
                  onConfirm: () {
                    projectController.deleteProject(p0.id);
                  },
                );
              },
              onAdminPress: (p0) {
                projectAlert(
                  model: p0,
                  context: context,
                  onConfirm: (model) {
                    projectController.updateProject(model);
                  },
                  projectController: projectController,
                  projectState: projectState
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
