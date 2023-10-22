import 'package:get/get_navigation/src/routes/get_route.dart';
// Splashscreen
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/splash/binding/splash_binding.dart';
// loginScreen
import '../../features/login/presentation/login_screen.dart';
import '../../features/login/binding/login_binding.dart';

// home
import '../../features/home_navigation/presentation/home_navigation_screen.dart';
import '../../features/home_navigation/binding/home_navigation_binding.dart';

class AppRoute {
  static const String defaultRoute = '/';
  static const String notFound = '/notFound';
  static const String login = '/login';
  static const String homeNavigationScreen = '/homeScreen';
  static List<GetPage> pages = [
    GetPage(
        name: defaultRoute,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: login, page: () => const LoginScreen(), binding: LoginBinding()),
    GetPage(
        name: homeNavigationScreen,
        page: () => const HomeNavigationScreen(),
        binding: HomeNavigationBinding()),
  ];
}
