import 'package:equatable/equatable.dart';

class SidemenuModel extends Equatable {
  final String key;
  final String image;
  final String? imageUrl;
  final String? campaignID;
  final String title;
  final bool enable;
  final String? URL;

  const SidemenuModel({
    required this.key,
    required this.image,
    required this.imageUrl,
    required this.campaignID,
    required this.title,
    required this.enable,
    required this.URL,
  });

  factory SidemenuModel.fromJson(Map<String, dynamic> json) {
    return SidemenuModel(
        key: json['key'] as String,
        image: json['image'] as String,
        imageUrl: json['imageURL'] as String?,
        campaignID: json['campaignID'] as String?,
        title: json['title'] as String,
        enable: json['enable'] as bool,
        URL: json['url'] as String?);
  }

  @override
  List<Object?> get props =>
      [key, image, imageUrl, campaignID, title, enable, URL];
}
