import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/components/notice_component/notice_list.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/view_models/notification/notification_provider.dart';

class NotificationPage extends StatefulHookConsumerWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _NotificationSate();
}

class _NotificationSate extends ConsumerState<NotificationPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(final BuildContext context) {
    final state = ref.watch(notificationProvider);
    final viewModel = ref.read(notificationProvider.notifier);
    useEffect(() {
      _tabController.animateTo(state.tabIndex.index);
      return;
    }, [state.tabIndex]);

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(50, kToolbarHeight),
          child: Container(
            alignment: Alignment.bottomLeft,
            color: AppColors.primary,
            padding: const EdgeInsets.only(bottom: 5, left: 5),
            child: TabBar(
              isScrollable: true,
              indicatorColor: AppColors.yellow,
              labelStyle: TextStyle(fontWeight: FontWeight.w700),
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 3, color: AppColors.yellow),
                  insets: EdgeInsets.symmetric(horizontal: 16)),
              labelColor: AppColors.yellow2,
              dividerColor: AppColors.white,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(
                  text: LocaleKeys.newArrivalOrder.tr(),
                ),
                Tab(
                  text: LocaleKeys.byProject.tr(),
                ),
                Tab(
                  text: LocaleKeys.byLumiere.tr(),
                ),
              ],
              controller: _tabController,
              onTap: (index) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  viewModel.setTabIndex(_tabController.index);
                  if (_tabController.index != 1) {
                    viewModel.setTabBarSelectedValue(0);
                  }
                });
              },
            ),
          ),
        ),
        body: NoticeList(viewModel: viewModel));
  }
}
