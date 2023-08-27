enum StatusNotice { DONE, CANCLE, NONE }

///TODO: Remove when apply function
class MockNotificationModel {
  const MockNotificationModel({
    this.id = 0,
    this.urlImage,
    this.content1,
    this.content2,
    this.status,
    this.time,
    this.isRead = false,
  });

  final int id;
  final String? urlImage;
  final String? content1;
  final String? content2;
  final StatusNotice? status;
  final bool isRead;
  final String? time;
}

class MockNotificationData {
  static List<MockNotificationModel> notices = [
    MockNotificationModel(
        id: 0,
        content1: '支援した「【神戸ハーバーランドにて開催】VR×現実×前衛アート書プロジェクト」が目標金額に達成したため、',
        content2: 'NFT「岩坂典子直筆の書画を画像化したNFT」が受け取れるようになりました。',
        urlImage:
            'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg',
        isRead: true,
        time: '9時間',
        status: StatusNotice.DONE),
    MockNotificationModel(
        id: 0,
        content1: '支援した「【神戸ハーバーランドにて開催】VR×現実×前衛アート書プロジェクト」が目標金額に達成したため、',
        content2: 'NFT「岩坂典子直筆の書画を画像化したNFT」が受け取れるようになりました。',
        urlImage: 'https://www.w3schools.com/howto/img_avatar.png',
        isRead: false,
        time: '2時間',
        status: StatusNotice.CANCLE),
    MockNotificationModel(
        id: 0,
        content1: '支援した「【神戸ハーバーランドにて開催】VR×現実×前衛アート書プロジェクト」が目標金額に達成したため、',
        content2: 'NFT「岩坂典子直筆の書画を画像化したNFT」が受け取れるようになりました。',
        urlImage:
            'https://images.theconversation.com/files/500899/original/file-20221214-461-22jr1l.jpg',
        time: '35時間',
        isRead: true,
        status: StatusNotice.NONE),
    MockNotificationModel(
        id: 0,
        content1: '支援した「【神戸ハーバーランドにて開催】VR×現実×前衛アート書プロジェクト」が目標金額に達成したため、',
        content2: 'NFT「岩坂典子直筆の書画を画像化したNFT」が受け取れるようになりました。',
        urlImage:
            'https://static.toiimg.com/thumb/resizemode-4,msid-76729750,imgsize-249247,width-720/76729750.jpg',
        isRead: false,
        time: '22時間',
        status: StatusNotice.DONE),
    MockNotificationModel(
        id: 0,
        content1: '支援した「【神戸ハーバーランドにて開催】VR×現実×前衛アート書プロジェクト」が目標金額に達成したため、',
        content2: 'NFT「岩坂典子直筆の書画を画像化したNFT」が受け取れるようになりました。',
        urlImage:
            'https://cdn.pixabay.com/photo/2018/08/28/13/29/avatar-3637561_1280.png',
        isRead: false,
        time: '17時間',
        status: StatusNotice.CANCLE)
  ];

  static List<MockNotificationModel> noticesTab2 = [
    MockNotificationModel(
        id: 0,
        content1: '',
        content2: 'NFT「岩坂典子直筆の書画を画像化したNFT」が受け取れるようになりました。',
        urlImage:
            'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg',
        isRead: true,
        time: '9時間',
        status: StatusNotice.DONE),
    MockNotificationModel(
        id: 0,
        content1: '支援した「【神戸ハーバーランドにて開催】VR×現実×前衛アート書プロジェクト」が目標金額に達成したため、',
        content2: 'NFT「岩坂典子直筆の書画を画像化したNFT」が受け取れるようになりました。',
        urlImage: 'https://www.w3schools.com/howto/img_avatar.png',
        isRead: false,
        time: '2時間',
        status: StatusNotice.CANCLE),
    MockNotificationModel(
        id: 0,
        content1: '支援した「【神戸ハーバーランドにて開催】VR×現実×前衛アート書プロジェクト」が目標金額に達成したため、',
        urlImage:
            'https://images.theconversation.com/files/500899/original/file-20221214-461-22jr1l.jpg',
        time: '35時間',
        isRead: true,
        status: StatusNotice.NONE),
  ];

  static List<MockNotificationModel> noticesTab3 = [
    MockNotificationModel(
        id: 0,
        content1: '',
        content2: 'NFT「岩坂典子直筆の書画を画像化したNFT」が受け取れるようになりました。',
        urlImage:
            'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg',
        isRead: true,
        time: '9時間',
        status: StatusNotice.DONE),
    MockNotificationModel(
        id: 0,
        content1: '支援した「',
        content2: 'が受け取れるようになりました。',
        urlImage: 'https://www.w3schools.com/howto/img_avatar.png',
        isRead: false,
        time: '2時間',
        status: StatusNotice.CANCLE),
    MockNotificationModel(
        id: 0,
        content1: 'が目標金額に達成したため、',
        urlImage:
            'https://images.theconversation.com/files/500899/original/file-20221214-461-22jr1l.jpg',
        time: '35時間',
        isRead: true,
        status: StatusNotice.NONE),
  ];
}
