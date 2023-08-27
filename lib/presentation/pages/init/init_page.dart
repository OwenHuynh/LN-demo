import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/presentation/components/slide_menu/slide_menu.dart';
import 'package:lnsp/presentation/pages/init/child/child_pages.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/view_models/init/init_provider.dart';
import 'package:lnsp/presentation/view_models/init/init_state.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class InitPage extends StatefulHookConsumerWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _InitPageState();
}

class _InitPageState extends ConsumerState<InitPage>
    with SingleTickerProviderStateMixin {
  late PersistentTabController _controller;
  late bool _hideNavBar;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _hideNavBar = false;
    _tabController = TabController(vsync: this, length: 1);
  }

  @override
  Widget build(final BuildContext context) {
    final state = ref.watch(initProvider);
    final viewModel = ref.read(initProvider.notifier);

    useEffect(() {
      _controller.jumpToTab(state.tabIndex.index);
      return;
    }, [state.tabIndex]);

    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(30),
      //   child: Container(
      //     alignment: Alignment.bottomCenter,
      //     color: AppColors.primary,
      //     child: TabBar(
      //       indicatorColor: AppColors.primary,
      //       labelColor: AppColors.white,
      //       tabs: [
      //         Tab(
      //           text: "fefew",
      //           height: 30,
      //         )
      //       ],
      //       controller: _tabController,
      //     ),
      //   ),
      // ),
      ///TODO: Handle when all the tabs are complete
      appBar: state.tabIndex.index != 3 &&
              state.tabIndex.index != 0 &&
              state.tabIndex.index != 1
          ? AppBar(
              title: Row(
                children: [
                  Text(
                    state.tabIndex.title,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              backgroundColor: AppColors.primary,
              // centerTitle: true,
              elevation: 0.5,
              automaticallyImplyLeading: false,
            )
          : null,
      drawer: SlideMenu(),
      body: WillPopScope(
        onWillPop: viewModel.logout,
        child: PersistentTabView.custom(
          context,
          controller: _controller,
          itemCount: buildInitScreen().length,
          screens: buildInitScreen(),
          resizeToAvoidBottomInset: true,
          selectedTabScreenContext: (context) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              viewModel.setTabIndex(_controller.index);
              if (_controller.index != 1) {
                viewModel.setTabBarSelectedValue(0);
              }
            });
          },
          handleAndroidBackButtonPress: true,
          onWillPop: (context) async {
            return await true;
          },
          backgroundColor: AppColors.primary,
          hideNavigationBar: _hideNavBar,
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          customWidget: CustomNavBarWidget(
            selectedIndex: _controller.index,
            items: navBarsInitScreen(_controller.index),
            onItemSelected: (index) {
              setState(() {
                _controller.index = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
