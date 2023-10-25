import 'package:flutter_dotenv/flutter_dotenv.dart';

class LinkImage {
  String? linkUrl;
  String? image;

  LinkImage({this.linkUrl, this.image});
}

class AppConst {
  static String appName = "SIMS PPOB-Firman";
  static bool isDebuggable = true;
  static String appUrl = "${dotenv.env['API_LINK']!}/";

  static String apiVersion({String version = "v1"}) {
    return version;
  }

  // images
  static String assetsLogo = 'assets/images/Logo.png';
  static String assetsImageNF = 'assets/images/image_not_found.png';
  static String assetsListrik = 'assets/images/Listrik.png';
  static String assetsprofile = 'assets/images/Profile.png';
  static String assetsProfileDashboard = 'assets/images/ProfileDashboard.png';

  // ======== Icons svg
  static String assetPadlock = 'assets/icons/ic_padlock.svg';
  static String assetEyeVisibility = 'assets/icons/ic_eye_visibility.svg';
  static String assetEyeVisibilityOff =
      'assets/icons/ic_eye_visibility_off.svg';
  static String assetAtSign = 'assets/icons/ic_at_sign.svg';
  static String assetUser = 'assets/icons/ic_user.svg';
  static String assetCardATM = 'assets/icons/ic_card_atm.svg';
  static String assetHome = 'assets/icons/ic_home.svg';
  static String assetMoney = 'assets/icons/ic_money.svg';
  static String assetUserDashboard = 'assets/icons/ic_user_dashboard.svg';
  static String assetPen = 'assets/icons/ic_pen.svg';
}
