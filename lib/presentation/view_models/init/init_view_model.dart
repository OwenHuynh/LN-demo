import 'dart:async';

import 'package:lnsp/presentation/components/product_component/product_item_card.dart';
import 'package:lnsp/presentation/navigation/app_router.gr.dart';
import 'package:lnsp/presentation/navigation/navigation_handler.dart';
import 'package:lnsp/presentation/view_models/base/base_view_model.dart';
import 'package:lnsp/presentation/view_models/init/init_state.dart';

class InitViewModel extends BaseViewModel<InitState> {
  InitViewModel({required this.navigationHandler}) : super(InitState());

  final NavigationHandler navigationHandler;

  @override
  Future<void> onInit() async {
    setListProduct();
  }

  void setTabIndex(int tabIndex) {
    setState(
      (state) => state.copyWith(
        tabIndex: TabIndex.values.firstWhere(
          (element) => element.index == tabIndex,
        ),
      ),
    );
  }

  void setTabBarSelectedValue(int value) {
    setState((state) => state.copyWith(
          tabBarSelected: value,
        ));
  }

  void setTilteListProduct(String value) {
    setState((state) => state.copyWith(titleProductList: value));
  }

  void setListProduct() {
    final listProduct = List.generate(
        20,
        (index) => Product("name $index", "brand", "objectid",
            "https://picsum.photos/200/300", 1234));
    setState((state) => state.copyWith(listProduct: listProduct));
  }

  void goToLogin() {
    navigationHandler.push(route: LoginPageRoute());
  }

  Future<bool> logout() async {
    // TODO(handler): handle logout
    return true;
  }
}
