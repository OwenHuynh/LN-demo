import 'package:flutter/material.dart';
import 'package:lnsp/presentation/components/notice_component/notice_card_item.dart';
import 'package:lnsp/presentation/pages/notification/mock/notification_model.dart';
import 'package:lnsp/presentation/view_models/notification/notification_view_model.dart';

class NoticeList extends StatelessWidget {
  const NoticeList({Key? key, this.viewModel}) : super(key: key);
  final NotificationViewModel? viewModel;

  @override
  Widget build(BuildContext context) {
    ///TODO: handle data
    switch (viewModel!.state.tabIndex.index) {
      case 0:
        return ListView.separated(
          itemCount: MockNotificationData.notices.length,
          shrinkWrap: true,
          cacheExtent: 200,
          separatorBuilder: (context, index) {
            return Divider(
              height: 1,
              thickness: 2,
            );
          },
          itemBuilder: (context, index) {
            return NoticeCardItem(
              noticeDemoModel: MockNotificationData.notices[index],
            );
          },
        );
      case 1:
        return ListView.separated(
          itemCount: MockNotificationData.noticesTab2.length,
          shrinkWrap: true,
          cacheExtent: 200,
          separatorBuilder: (context, index) {
            return Divider(
              height: 1,
              thickness: 2,
            );
          },
          itemBuilder: (context, index) {
            return NoticeCardItem(
              noticeDemoModel: MockNotificationData.noticesTab2[index],
            );
          },
        );
      case 2:
        return ListView.separated(
          itemCount: MockNotificationData.noticesTab3.length,
          shrinkWrap: true,
          cacheExtent: 200,
          separatorBuilder: (context, index) {
            return Divider(
              height: 1,
              thickness: 2,
            );
          },
          itemBuilder: (context, index) {
            return NoticeCardItem(
              noticeDemoModel: MockNotificationData.noticesTab3[index],
              typeAvatar: Type_Avatar.Circle,
            );
          },
        );
      default:
        return Container();
    }
  }
}
