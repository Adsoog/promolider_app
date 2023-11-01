import 'package:flutter/widgets.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

final facebookUrl =
    Uri.parse('https://www.facebook.com/profile.php?id=100063926738412');
final instagramLink =
    Uri.parse('https://www.instagram.com/promoliderorg/?hl=es');
final linkedInLink =
    Uri.parse('https://www.linkedin.com/company/promol%C3%ADder/');
final youtubeLink = Uri.parse('https://www.youtube.com/@promolider6910');
final tiktokLink = Uri.parse(
    'https://www.tiktok.com/@promolider?is_from_webapp=1&sender_device=pc');

class SocialMediaData {
  final Uri url;
  final IconData icon;

  SocialMediaData({
    required this.url,
    required this.icon,
  });
}

final List<SocialMediaData> socialMediaData = [
  SocialMediaData(url: facebookUrl, icon: TablerIcons.brand_facebook),
  SocialMediaData(url: instagramLink, icon: TablerIcons.brand_instagram),
  SocialMediaData(url: linkedInLink, icon: TablerIcons.brand_linkedin),
  SocialMediaData(url: youtubeLink, icon: TablerIcons.brand_youtube),
  SocialMediaData(url: tiktokLink, icon: TablerIcons.brand_tiktok),
];
