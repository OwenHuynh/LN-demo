import 'package:flutter/material.dart';
import 'package:lnsp/presentation/theme/colors.dart';
import 'package:lnsp/presentation/view_models/search/search_view_model.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.viewModel}) : super(key: key);
  final SearchViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 10, bottom: 6),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        cursorColor: AppColors.yellow3,
        textAlignVertical: TextAlignVertical.center,
        onChanged: viewModel.searchEvent,
        decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              color: AppColors.yellow3,
              iconSize: 25,
              onPressed: () {},
            )),
        style: TextStyle(color: AppColors.yellow3, fontSize: 15),
      ),
    );
  }
}
