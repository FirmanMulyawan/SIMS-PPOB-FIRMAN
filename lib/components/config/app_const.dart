import 'package:flutter_dotenv/flutter_dotenv.dart';

class LinkImage {
  String? linkUrl;
  String? image;

  LinkImage({this.linkUrl, this.image});
}

class AppConst {
  static String appName = "SIMS PPOB-Firman";
  static bool isDebuggable = true;
  static String appUrl = "${dotenv.env['API_LINK']!}/take-home-test/";

  static String apiVersion({String version = "v1"}) {
    return version;
  }

  // images
  static String assetsLogo = 'assets/images/Logo.png';
  static String assetsImageNF = 'assets/images/image_not_found.png';

  // ======== Icons svg
  static String assetPadlock = 'assets/icons/ic_padlock.svg';
  static String assetEyeVisibility = 'assets/icons/ic_eye_visibility.svg';
  static String assetEyeVisibilityOff =
      'assets/icons/ic_eye_visibility_off.svg';
  static String assetAtSign = 'assets/icons/ic_at_sign.svg';
  // ====
  static String assetHomePage = 'assets/icons/ic_beranda.svg';
  static String assetFacebook = 'assets/icons/ic_facebook.svg';
  static String assetFavoriteBadge = 'assets/icons/ic_favorite_badge.svg';
  static String assetFavorite = 'assets/icons/ic_favorites.svg';
  static String assetInstagram = 'assets/icons/ic_instagram.svg';
  static String assetIonicIosSearch = 'assets/icons/ic_ionic_ios_search.svg';
  static String assetItaly = 'assets/icons/ic_italy.svg';
  static String assetLanguageB = 'assets/icons/ic_language_b.svg';
  static String assetLanguageA = 'assets/icons/ic_language.svg';
  static String assetNotFavoriteBadge =
      'assets/icons/ic_not_favorite_badge.svg';
  static String assetSpain = 'assets/icons/ic_spain.svg';
  static String assetTrash = 'assets/icons/ic_tash.svg';
  static String assetTwitter = 'assets/icons/ic_twitter.svg';
  static String assetUK = 'assets/icons/ic_uk.svg';
  static String assetWebsite = 'assets/icons/ic_website.svg';
  static String assetYoutube = 'assets/icons/ic_youtube.svg';
}
