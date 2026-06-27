import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potfolio/portfolio/presentation/themes/app_colors.dart';

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.buttonRColor,
    this.buttonLColor,
    this.textColor,
    this.width,
    this.height,
    this.iconButton = false,
    this.icon,
    this.iconColor,
    this.iconRightSide = true,
    this.textStyle,
    this.gradientToptobottom = false,
  });

  final String title;
  final Function onPressed;
  final Color? buttonRColor;
  final Color? buttonLColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final bool iconButton;
  final IconData? icon;
  final Color? iconColor;
  final bool iconRightSide;
  final TextStyle? textStyle;
  final bool? gradientToptobottom;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width ?? w,
      height: height ?? h * 0.06,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () => onPressed(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: gradientToptobottom == true
                    ? Alignment.topCenter
                    : Alignment.centerLeft,
                end: gradientToptobottom == true
                    ? Alignment.bottomCenter
                    : Alignment.centerRight,
                colors: [
                  buttonLColor ?? Theme.of(context).primaryColorLight,
                  buttonRColor ?? Theme.of(context).primaryColorDark,
                ],
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null && iconRightSide == false)
                    Icon(
                      icon!,
                      color: iconColor ?? Colors.white,
                    ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: iconRightSide == false ? w * 0.02 : 0,
                      right: iconRightSide == true ? w * 0.02 : 0,
                    ),
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: textColor ?? AppColors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  if (icon != null && iconRightSide == true)
                    Icon(
                      icon!,
                      color: iconColor ?? Colors.white,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
