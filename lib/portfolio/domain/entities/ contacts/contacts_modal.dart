class ContactsModal {
  final int id;
  final String title;
  final String img;
  final Uri url;
  final Function ontap;

  ContactsModal(
      {required this.id,
      required this.title,
      required this.img,
      required this.url,
      required this.ontap});
}
