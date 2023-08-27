import 'package:flutter/material.dart';
import 'package:lnsp/presentation/pages/notification/mock/notification_model.dart';
import 'package:lnsp/presentation/theme/spacing_alias.dart';

enum Type_Avatar { Rectangle, Circle }

class NoticeCardItem extends StatelessWidget {
  const NoticeCardItem(
      {Key? key,
      required this.noticeDemoModel,
      this.typeAvatar = Type_Avatar.Rectangle})
      : super(key: key);
  final MockNotificationModel noticeDemoModel;
  final Type_Avatar? typeAvatar;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(SpacingAlias.Spacing16),
        child: Row(
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 10, right: 5),
                        child: Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                              shape: typeAvatar == Type_Avatar.Rectangle
                                  ? BoxShape.rectangle
                                  : BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(noticeDemoModel.urlImage!),
                                fit: BoxFit.fill,
                              )),
                        )),
                    if (!noticeDemoModel.isRead)
                      Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                  ],
                ),
                SpacingAlias.SizeWidth16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _statusNotice(noticeDemoModel.status!),
                      SpacingAlias.SizeHeight12,
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 150,
                        child: RichText(
                            maxLines: 5,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: noticeDemoModel.content1,
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                  text: noticeDemoModel.content2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black))
                            ])),
                      ),
                      SpacingAlias.SizeHeight12,
                      Text(
                        noticeDemoModel.time!,
                        style: TextStyle(color: Colors.grey[500]),
                      )
                    ],
                  ),
                ),
              ],
            )),
            Center(
              child: InkWell(
                child: Icon(Icons.navigate_next_outlined,
                    size: 30, color: Colors.grey),
              ),
            )
          ],
        ));
  }

  Widget _statusNotice(StatusNotice status) {
    switch (status) {
      case StatusNotice.DONE:
        return Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: Icon(Icons.done, color: Colors.white, size: 22),
            ),
            SpacingAlias.SizeWidth12,
            Text(
              '受け取り可能です',
              style: TextStyle(color: Colors.green),
            )
          ],
        );
      case StatusNotice.CANCLE:
        return Text(
          '受け取り可能です!!!',
          style: TextStyle(color: Colors.orange),
        );
      case StatusNotice.NONE:
        return const SizedBox.shrink();
    }
  }
}
