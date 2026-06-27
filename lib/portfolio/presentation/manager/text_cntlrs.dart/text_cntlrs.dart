import 'package:flutter/cupertino.dart';

class TextCntlrs {
  final nameCntlr = TextEditingController();
  final emailCntlr = TextEditingController();
  final phoneNoCntlr = TextEditingController();
  final whatsAppNoCntlr = TextEditingController();
  final honeyPotCntlr = TextEditingController();
  final descriptionCntlr = TextEditingController();

  void dispose() {
    nameCntlr.clear();
    emailCntlr.clear();
    phoneNoCntlr.clear();
    whatsAppNoCntlr.clear();
    honeyPotCntlr.clear();
    descriptionCntlr.clear();
  }
}
