import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:potfolio/portfolio/data/remote/modals/request/auth/login_request_model.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/auth/auth_controller.dart';
import 'package:potfolio/portfolio/presentation/routes/app_pages.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_bottom_msg.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custome_gradient_widget.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custome_label_text_field.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});
  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final nameCntlr = TextEditingController();
  final passwordCntlr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final authCntlr = ref.read(authControllerProvider.notifier);
    final authState = ref.watch(authControllerProvider);
    ref.listen(authControllerProvider, (previous, next) {
      if (previous?.isLoading == true &&
          next.isLoading == false &&
          next.loginResponseModel != null) {
        context.go(AppPages.adminDashBoard);
        TextInput.finishAutofillContext();
      }

      if (previous?.isLoading == true &&
          next.isLoading == false &&
          next.errorMsg != null) {
        bottomMsg(context, next.errorMsg ?? "");
      }
    });
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.35,
            vertical: h * 0.25,
          ),
          children: [
            AutofillGroup(
              child: Column(
                children: [
                  LabelCustomTextField(
                    hintText: "Name",
                    textFieldLabel: "",
                    controller: nameCntlr,
                    autofillHints: const [AutofillHints.username],
                    textInputAction: TextInputAction.next,
                    validator: (val) => val.isEmpty ? 'Enter username' : null,
                  ),
                  SizedBox(height: 10.h),
                  LabelCustomTextField(
                    hintText: "Password",
                    textFieldLabel: "",
                    controller: passwordCntlr,
                    textInputAction: TextInputAction.done,
                    autofillHints: const [AutofillHints.password],
                    iconColor: AppColors.black,
                    passwordfield: true,
                    validator: (val) => val.isEmpty ? 'Enter password' : null,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            authState.isLoading
                ? SizedBox(
                    height: h * 0.05,
                    child: Center(
                      child: SizedBox(
                        height: w * 0.02,
                        width: w * 0.02,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.appBlue,
                        ),
                      ),
                    ),
                  )
                : CustomGradientButton(
                    buttonLColor: AppColors.appBlue,
                    buttonRColor: AppColors.appBlue,
                    textColor: AppColors.black,
                    title: "Login",
                    onPressed: () {
                      if (nameCntlr.text.isNotEmpty &&
                          passwordCntlr.text.isNotEmpty) {
                        authCntlr.getLogin(
                          LoginRequestModel(
                            email: nameCntlr.text,
                            password: passwordCntlr.text,
                          ),
                        );
                      } else {
                        bottomMsg(context, "username or password is empty");
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
