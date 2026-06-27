class SocialMediaModal {
  final String id;
  final String title;
  final String img;
  final String url;
  final Function ontap;

  SocialMediaModal(
      {required this.id,
      required this.title,
      required this.img,
      required this.url,
      required this.ontap});

  SocialMediaModal copyWith({String? id, String? url}) {
    return SocialMediaModal(
        id: id ?? this.id,
        title: title,
        img: img,
        url: url ?? this.url,
        ontap: ontap);
  }
}
