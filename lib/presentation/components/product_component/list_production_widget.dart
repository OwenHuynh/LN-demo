import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lnsp/generated/locale_keys.g.dart';
import 'package:lnsp/presentation/components/input/input_export.dart';
import 'package:lnsp/presentation/components/product_component/product_export.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';
import 'package:lnsp/presentation/view_models/init/init_provider.dart';

class ListProductWidget extends HookConsumerWidget {
  const ListProductWidget({
    Key? key,
    this.amountProductView,
  }) : super(key: key);

  final int? amountProductView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listProduct = ref.watch(initProvider).listProduct;

    final _amountItem =
        (amountProductView != null && amountProductView! < listProduct.length)
            ? amountProductView
            : listProduct.length;

    return listProduct.isNotEmpty
        ? Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: SpacingAlias.Spacing8),
            child: GridView.builder(
              itemCount: _amountItem,
              itemBuilder: (context, index) {
                return ProductCardView(product: listProduct[index]);
              },
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.5,
                mainAxisSpacing: SpacingAlias.Spacing8,
                crossAxisSpacing: SpacingAlias.Spacing8,
                crossAxisCount: 2,
              ),
              physics: NeverScrollableScrollPhysics(),
            ),
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Center(
              child: TextCommon(text: LocaleKeys.emptyListProduct.tr()),
            ),
          );
  }
}
