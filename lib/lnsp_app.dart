import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/data/remotes/graphql/client_provider.dart';
import 'package:lnsp/gen/fonts.gen.dart';
import 'package:lnsp/presentation/navigation/auto_slide_route_observer.dart';
import 'package:lnsp/presentation/navigation/navigation_handler.dart';
import 'package:lnsp/presentation/view_models/main_app/lnsp_app_provider.dart';
import 'package:lnsp/presentation/view_models/profile/profile_provider.dart';
import 'package:lnsp/utils/hooks/use_mount.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class lnspApp extends HookConsumerWidget {
  const lnspApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lnspAppViewModel =
        ref.watch(lnspAppProvider.notifier);

    final language = ref.watch(profileProvider).language;

    useMount(lnspAppViewModel.init);
    return Builder(builder: (context) {
      return EasyLocalization(
        path: 'assets/translations',
        supportedLocales: [Locale('ja', 'JP'), Locale('en', 'US')],
        fallbackLocale: Locale('ja', 'JP'),
        startLocale: language,
        child: RefreshConfiguration(
          footerTriggerDistance: 60,
          dragSpeedRatio: 0.91,
          headerBuilder: MaterialClassicHeader.new,
          footerBuilder: ClassicFooter.new,
          enableLoadingWhenNoData: false,
          enableRefreshVibrate: false,
          enableLoadMoreVibrate: true,
          shouldFooterFollowWhenNotFull: (state) {
            return false;
          },
          child: FutureBuilder<ValueNotifier<GraphQLClient>>(
              future: ref.read(clientProvider).graphQLClient,
              builder: (context, data) {
                if (data.hasData) {
                  return GraphQLProvider(
                    client: data.data,
                    child: MaterialApp.router(
                        debugShowCheckedModeBanner: false,
                        theme:
                            ThemeData(fontFamily: FontFamily.sFProTextRegular),
                        builder: EasyLoading.init(),
                        routerDelegate: AutoRouterDelegate(
                          appRouter,
                          navigatorObservers: () => [
                            AutoSlideRouteObserver(),
                          ],
                        ),
                        routeInformationProvider: appRouter.routeInfoProvider(),
                        routeInformationParser: appRouter.defaultRouteParser(),
                        localizationsDelegates: context.localizationDelegates,
                        supportedLocales: context.supportedLocales,
                        locale: language),
                  );
                }
                return Container();
              }),
        ),
      );
    });
  }
}
