import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:potfolio/portfolio/data/remote/modals/request/form_submit_request_modal.dart';
import 'package:potfolio/portfolio/presentation/manager/controller/contact/contact_controller.dart';
import 'package:potfolio/portfolio/presentation/manager/text_cntlrs.dart/text_cntlrs.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_bottom_msg.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custom_print.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custome_gradient_widget.dart';
import 'package:potfolio/portfolio/presentation/widgets/custom/custome_label_text_field.dart';

class CollaboratorFormPage extends ConsumerStatefulWidget {
  const CollaboratorFormPage({super.key, this.titleFontSize});
  final double? titleFontSize;
  @override
  ConsumerState<CollaboratorFormPage> createState() =>
      _CollaboratorFormPageState();
}

class _CollaboratorFormPageState extends ConsumerState<CollaboratorFormPage> {
  final cntlrs = TextCntlrs();

  final formKey = GlobalKey<FormState>();
  late PhoneController _phoneController;

  @override
  void initState() {
    super.initState();
    _phoneController = PhoneController(
      initialValue: PhoneNumber(isoCode: IsoCode.IN, nsn: ''),
    );
  }

  @override
  void dispose() {
    cntlrs.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contactController = ref.read(contactControllerProvider.notifier);
    final contactState = ref.read(contactControllerProvider);

    ref.listen(contactControllerProvider, (previous, next) {
      if (next.formError != null) {
        bottomMsg(context, next.formError!);
      }
    });

    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Let’s Collaborate!",
                    style: GoogleFonts.poppins(
                      color: AppColors.white,
                      fontSize: widget.titleFontSize ?? 30.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                LabelCustomTextField(
                  hintText: "Name",
                  textFieldLabel: "",
                  controller: cntlrs.nameCntlr,
                  textInputAction: TextInputAction.next,
                  validator: (val) => val.isEmpty ? 'Enter name' : null,
                ),
                LabelCustomTextField(
                  hintText: "Email",
                  textFieldLabel: "",
                  controller: cntlrs.emailCntlr,
                  textInputAction: TextInputAction.next,
                  validator: (val) =>
                      !val.contains('@') ? 'Enter valid email' : null,
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Container(
                    width: w,
                    decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(15),
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        inputDecorationTheme: InputDecorationTheme(
                          counterStyle: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      child: PhoneFormField(
                        textInputAction: TextInputAction.next,
                        validator: PhoneValidator.compose([
                          PhoneValidator.required(context),
                          PhoneValidator.validMobile(context),
                        ]),
                        autofocus: false,
                        controller: _phoneController,
                        countrySelectorNavigator: CountrySelectorNavigator.page(
                          subtitleStyle: TextStyle(
                            color: AppColors.white.withOpacity(0.4),
                          ),
                          titleStyle: TextStyle(
                            color: AppColors.white.withOpacity(0.5),
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          //labelText: 'Phone Number',
                          labelStyle: TextStyle(color: AppColors.white),
                          filled: true,
                          fillColor: AppColors.white,

                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.greyText,
                              width: 0.3,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 0.3,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.greyText,
                              width: 0.3,
                            ),
                          ),
                          disabledBorder: const OutlineInputBorder(),
                          contentPadding: const EdgeInsets.all(15),
                          hintStyle: const TextStyle(color: Colors.grey),
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 12.sp,
                          ),
                        ),
                        onChanged: (p0) {
                          cntlrs.phoneNoCntlr.text = p0.nsn;
                          warningPrint("phone No =${cntlrs.phoneNoCntlr.text}");
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                LabelCustomTextField(
                  isRemoveVerticalPadding: true,
                  hintText: "Whatsapp No",
                  textFieldLabel: "",
                  inputType: TextInputType.phone,
                  controller: cntlrs.whatsAppNoCntlr,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
                  ],
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Enter WhatsApp number';
                    }

                    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');

                    if (!phoneRegex.hasMatch(val)) {
                      return 'Enter valid phone number';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                LabelCustomTextField(
                  isRemoveVerticalPadding: true,
                  hintText: "Description",
                  textFieldLabel: "",
                  controller: cntlrs.descriptionCntlr,
                  textInputAction: TextInputAction.done,
                  validator: (val) =>
                      val.isEmpty ? 'Enter a  description' : null,
                ),
                Visibility(
                  visible: false,
                  child: LabelCustomTextField(
                    hintText: "HoneyPot",
                    textFieldLabel: "",
                    controller: cntlrs.honeyPotCntlr,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                SizedBox(height: 20.h),
                contactState.isLoading == true
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.appBlue,
                        ),
                      )
                    : CustomGradientButton(
                        title: "Submit",
                        textColor: AppColors.black,
                        buttonLColor: AppColors.appBlue,
                        buttonRColor: AppColors.appBlue,
                        onPressed: () {
                          final isValidForm =
                              formKey.currentState?.validate() ?? false;

                          warningPrint("isvalidFrom$isValidForm");

                          if (isValidForm) {
                            if (cntlrs.honeyPotCntlr.text.isEmpty) {
                              contactController.formSubmit(
                                FormSubmitRequestModal(
                                  name: cntlrs.nameCntlr.text,
                                  email: cntlrs.emailCntlr.text,
                                  phone: cntlrs.phoneNoCntlr.text,
                                  whatsapp: cntlrs.whatsAppNoCntlr.text,
                                  description: cntlrs.descriptionCntlr.text,
                                ),
                              );
                            }
                          } else {
                            bottomMsg(context, "Please Enter All fields");
                          }
                        },
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
