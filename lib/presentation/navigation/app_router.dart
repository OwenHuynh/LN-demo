import 'package:auto_route/auto_route.dart';
import 'package:lnsp/presentation/navigation/auth_guard.dart';
import 'package:lnsp/presentation/pages/pages.dart';

@CustomAutoRouter(
    replaceInRouteName: 'Page',
    routes: <AutoRoute>[
      AutoRoute(page: InitPage, guards: [AuthGuard]),
      AutoRoute(initial: true, page: LoginPage),
      AutoRoute(page: SignUpPage),
      AutoRoute(page: SMSConfirmationPage),
      AutoRoute(page: WelcomePage),
      AutoRoute(page: HomePage)
    ],
    transitionsBuilder: TransitionsBuilders.slideLeft,
    durationInMilliseconds: 400)
class $AppRouter {}
