import 'package:flutter/widgets.dart';
import 'package:lnsp/presentation/components/input/text_form_label.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/theme/font_alias.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';

class DetailDescriptionProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SpacingAlias.SizeHeight16,
        LabelCustom(
            label: "Product name",
            color: AppColors.grey1,
            fontWeight: FontWeight.w300,
            fontSize: FontAlias.fontAlias18),
        LabelCustom(
            label: "Category",
            fontSize: FontAlias.fontAlias18,
            fontWeight: FontWeight.w300),
        SpacingAlias.SizeHeight20,
        LabelCustom(
          label: "Prices",
          fontSize: FontAlias.fontAlias28,
        ),
        SpacingAlias.SizeHeight20,
        LabelCustom(
            color: AppColors.grey1,
            fontSize: FontAlias.fontAlias18,
            fontWeight: FontWeight.w300,
            label:
                '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
''')
      ]),
    );
  }
}
