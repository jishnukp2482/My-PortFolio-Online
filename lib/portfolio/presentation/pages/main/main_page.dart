import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/home/home_controller.dart';
import 'package:potfolio/portfolio/presentation/pages/about/about.dart';
import 'package:potfolio/portfolio/presentation/pages/collaborator/collaborator.dart';
import 'package:potfolio/portfolio/presentation/pages/contacts/contacts.dart';
import 'package:potfolio/portfolio/presentation/pages/home/home.dart';
import 'package:potfolio/portfolio/presentation/pages/projects/projects.dart';
import 'package:potfolio/portfolio/presentation/routes/app_pages.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';
import 'package:potfolio/portfolio/presentation/widgets/appbar.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_print.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});
  static final GlobalKey<ScaffoldState> mainPagekey =
      GlobalKey<ScaffoldState>();

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  bool isDrawerOpen = false;

  void handleDrawerState(bool open) {
    setState(() {
      isDrawerOpen = open;
    });
  }

  int _tapCount = 0;
  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeControllerProvider);

    double widthValue = MediaQuery.of(context).size.width;
    customPrint("width=${MediaQuery.of(context).size.width}");
    double textSize = 12;
    double copySize = 12;
    if (widthValue == 600 || widthValue <= 600) {
      textSize = 23;
      copySize = 27;
    } else if (widthValue == 1200 || widthValue <= 1200) {
      textSize = 15;
      copySize = 20;
    } else {
      textSize = 12;
      copySize = 12;
    }
    return SafeArea(
      child: Scaffold(
        key: MainPage.mainPagekey,
        drawer: AppBarTitleMenu(isMobileAppBarTitleMenu: true),
        onDrawerChanged: (isOpened) => handleDrawerState(isOpened),
        body: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  // Mobile view
                  return Padding(
                    padding: EdgeInsets.only(
                      right: 20.w,
                      left: 20.w,
                      top: 10.h,
                    ),
                    child: HomeAppBar(isMobileAppbar: true),
                  );
                } else {
                  //others
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 68.w,
                      right: 68.w,
                      top: 80.w,
                    ),
                    child: HomeAppBar(isMobileAppbar: false),
                  );
                }
              },
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 900),
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: _getBody(homeState.body),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(2.0),
          child: GestureDetector(
            onTap: () {
              _tapCount++;
              if (_tapCount == 10) {
                GoRouter.of(context).goNamed(AppPages.auth);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.ideographic,
              children: [
                Text(
                  "©",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: copySize.w,
                    color: AppColors.white.withOpacity(0.2),
                  ),
                ),
                SizedBox(width: 5.w),
                Text(
                  "jishnu kp 2026",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: textSize.w,
                    color: AppColors.white.withOpacity(0.2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _getBody(int body) {
  switch (body) {
    case 0:
      return HomePage(key: ValueKey(0));
    case 1:
      return AboutPage(key: ValueKey(1));
    case 2:
      return ProjectsPage(key: ValueKey(2));
    case 3:
      return ContactsPage(key: ValueKey(3));
    case 4:
      return CollaboratorPage(key: ValueKey(4));
    default:
      return HomePage(key: ValueKey(0));
  }
}
