import 'package:flutter/material.dart';
import 'package:whatsapp_clone/presentation/screens/auth/auth_page.dart';
import '../../screens/auth/welcome_screen.dart';
import '../../screens/contact/contact_page.dart';
import '../../screens/chats/inbox.dart';
import '../../screens/updates/story_view.dart';

import '../../screens/main_screen/main_screen.dart';
import '../../screens/splash_screen.dart';

class RouteNames {
  static const String splashScreen = '/s';
  static const String mainScreen = '/mainScreen';
  static const String inbox = '/inbox';
  static const String storyPage = '/storyPage';
  static const String contactPage = '/contact';
  static const String welcome = '/welcome';
  static const String auth = '/auth';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SplashScreen());
      case RouteNames.mainScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const MainScreen());

      case RouteNames.inbox:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const Inbox());
      case RouteNames.storyPage:
        return MaterialPageRoute(
            settings: settings, builder: (_) => MyStoryPage());

      case RouteNames.contactPage:
        return MaterialPageRoute(
            settings: settings, builder: (_) => ContactPage());

      case RouteNames.welcome:
        return MaterialPageRoute(
            settings: settings, builder: (_) => WelcomeScreen());

      case RouteNames.auth:
        return MaterialPageRoute(
            settings: settings, builder: (_) => AuthPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No Route Found ${settings.name}'),
            ),
          ),
        );
    }
  }
}
