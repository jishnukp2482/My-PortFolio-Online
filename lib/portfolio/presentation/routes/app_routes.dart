import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:potfolio/portfolio/data/remote/modals/response/project/project_response_model.dart';
import 'package:potfolio/portfolio/presentation/pages/admin/about/update_about.dart';
import 'package:potfolio/portfolio/presentation/pages/admin/auth/auth.dart';
import 'package:potfolio/portfolio/presentation/pages/admin/contact/update_contact.dart';
import 'package:potfolio/portfolio/presentation/pages/admin/dashboard/admin_dashboard.dart';
import 'package:potfolio/portfolio/presentation/pages/admin/project/update_project.dart';
import 'package:potfolio/portfolio/presentation/pages/admin/resume/upload_resume.dart';
import 'package:potfolio/portfolio/presentation/pages/home/home.dart';
import 'package:potfolio/portfolio/presentation/pages/main/main_page.dart';
import 'package:potfolio/portfolio/presentation/pages/projects/project_view.dart';
import 'package:potfolio/portfolio/presentation/pages/splash.dart';
import 'package:potfolio/portfolio/presentation/routes/LocalStorageNames.dart';
import 'package:potfolio/portfolio/presentation/routes/app_pages.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/refres_me.dart';

class AppRoutes {
  static GoRouter routes = GoRouter(
    initialLocation: AppPages.mainScreen,
    routes: [
      GoRoute(
        path: AppPages.splashScreen,
        name: AppPages.splashScreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: AppPages.homeScreen,
        name: AppPages.homeScreen,
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: AppPages.mainScreen,
        name: AppPages.mainScreen,
        builder: (context, state) => MainPage(),
      ),
      GoRoute(
        path: AppPages.projectsView,
        name: AppPages.projectsView,
        builder: (context, state) {
          final projectsModal = state.extra as ProjectData?;
          if (projectsModal == null) {
            return RefreshMe();
          } else {
            return ProjectsViewPage(projectsModal: projectsModal);
          }
        },
      ),

      ////admin
      GoRoute(
        path: AppPages.auth,
        name: AppPages.auth,
        builder: (context, state) => AuthScreen(),
      ),
      GoRoute(
        path: AppPages.adminDashBoard,
        name: AppPages.adminDashBoard,
        builder: (context, state) => AdminDashboard(),
      ),
      GoRoute(
        path: AppPages.updateAbout,
        name: AppPages.updateAbout,
        builder: (context, state) => UpdateAbout(),
      ),
      GoRoute(
        path: AppPages.uploadResume,
        name: AppPages.uploadResume,
        builder: (context, state) => UploadResumePage(),
      ),
      GoRoute(
        path: AppPages.updateContact,
        name: AppPages.updateContact,
        builder: (context, state) => UpdateContact(),
      ),
      GoRoute(
        path: AppPages.updateProject,
        name: AppPages.updateProject,
        builder: (context, state) => UpdateProject(),
      ),
    ],
    redirect: (context, state) {
      final token = GetStorage().read(LocalStorageKeys.accessTokenKEY);

      final currentPath = state.uri.path;

      final isAuthPage = currentPath == AppPages.auth;

      final isAdminRoute = currentPath.startsWith("/admin");

      if (token == null && isAdminRoute) {
        return AppPages.auth;
      }

      if (token != null && isAuthPage) {
        return AppPages.adminDashBoard;
      }

      return null;
    },
  );
}
