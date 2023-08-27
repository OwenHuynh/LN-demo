class AppStrings {
  static const String showMoreLabel = "もっと見る";
  static const String showLessLabel = "閉じる";
  static const String empty = "";
  static const String okLabel = "OK";
  static const String cancelLabel = "キャンセル";
  static const String pleaseAddContent = "内容を追加してくだい。";
  static const String askterickDot = "*";
  static const String changeLabel = "Change";
  static const String verifyLabel = "VERIFY";
  static const String resendCodeLabel = "RESEND CODE";
  static const String nextLabel = "Next";

  /// [Error]
  static const String errMsgErrorLabel = "エラーが発生しました。通信環境をご確認ください。";
  static const String errNotMatchRule = "半角英数字を合わせてください。";
  static const String errEmptyField = "必須項目です";
  static const String errConfirmPasswordNotMatch = "新しいパスワード]が一致しません";
  static const String errPasswordTooShort = "8～20文字までの範囲です";
  static const String errNoticeRegister =
      "会員登録がお済みの方はログインしてください。\nまだ登録されていない方は会員登録をお願いします。";
  static const String errEmailAddress = "Please use a valid email address";
  static const String errNotUrl = "Please use a valid url address";
  static const String errNotPhoneNumber = "Please use a valid phone number";
  static const String errNotCode6 = "Please input a valid code";

  /// [LOGIN]
  static const String loginTitleLabel = "メールアドレス";
  static const String passwordLabel = "パスワード";
  static const String forgotPasswordLabel = "パスワードをお忘れですか？";
  static const String loginLabel = "ログイン";
  static const String loginErrorLabel =
      "メールアドレス・パスワードに誤りがあるか、\n入力されたメールアドレスは登録されていません。";
  static const String privacyPolicy = "プライバシーポリシーを確認しました";

  /// [HOME]
  static const String homeTitle = "ホーム";
  static const String searchTitle = "検索";
  static const String searchText = "さがす";
  static const String handshakeText = "支援済み";
  static const String notificationText = "お知らせ";
  static const String myPageText = "Myページ";
  static const String all = "全て";
  static const String gourmetBeverage = "グルメ・飲料";
  static const String alcohol = "酒類（アルコール）";
  static const String search = "絞り込み";
  static const String healthcare = "日用品・ヘルスケア";
  static const String hairCare = "コスメ・ヘアケア";
  static const String interiorHomePets = "インテリア・住まい・ペット";
  static const String fashion = "ファッション";
  static const String entertainmentHobbyArt = "エンタメ・ホビー・アート";
  static const String books = "書籍";
  static const String emptyListProduct = "お取り扱い商品がございません";
  static const String allProductTitle = "全ての商品";

  static const String trend = "人気";
  static const String newText = "新着";
  static const String feature = "特集";
  static const String favorite = "お気に入り";

  /// [FORGOT PASSWORD]
  static const String forWhoForgottenPassword = "パスワードを忘れた方";
  static const String enterEmail =
      "会員登録時に登録されたメールアドレスを入力してください。\nパスワード再設定ページへのメールをお送りします。";
  static const String emailAddressAndMakeSureCorrectLabel =
      "メールアドレス*（正しいことを確認してください）";
  static const String emailAddress = "メールアドレス";
  static const String sendEmail = "メールを送信する";

  /// [Change Password]
  static const String changePasswordTitle = "パスワードを変更";
  static const String passwordRule =
      " ※パスワードはメールアドレスと異なる、半角英数字を合わせた8～20文字を入力してください。";
  static const String saveChanges = "変更を保存する";
  static const String logoutLabel = "ログアウト";
  static const String errNoticeRegisterLabel =
      "会員登録がお済みの方はログインしてください。\nまだ登録されていない方は会員登録をお願いします。";
  static const String confirmEmailContentLabel = "仮登録メール内のリンクから本登録を行ってください。";

  /// [Change Password Confirm]
  static String confirmEmailLabel(String email) => "$emailへメールを再送信する";
  static const String updateSuccessLabel = "更新を完了しました。";
  static const String changePasswordConfirmTitle = "パスワード完了";

  /// [Basic Information]
  static const String basicInformationTitle = "基本情報を変更";
  static const String labelName = "名前";
  static const String labelGender = "性別";
  static const String labelBirthday = "生年月日";

  static const twoDash = "--";
  static const threeDash = "---";

  /// [SIGNUP]
  static const String sex = "性別";
  static const male = "男性";
  static const female = "女性";
  static const other = "その他";
  static const emailInvalidError = "入力内容を確認してください";
  static const passwordInvalidError = "8～20文字までの範囲ですパスワード*";
  static const phoneNumber = "電話番号";

  static const letUsKnowAboutYou = "Let us know about you";
  static const surName = "姓";
  static const name = "名";
  static const notationName = "表記名（20字以内）";
  static const mailAddress = "メールアドレス";
  static const walletAddress = "Wallet アドレス";
  static const telephoneNumber = "電話番号";
  static const smsAuthentication = "セキュリティ強化のためSMS認証で使用で";
  static const neverBePublic = "します。 公開されることはありません。";
  static const reEnterPassword = "パスワード (再入力)";
  static const termsOfUse = "利用規約を確認しました";
  static const submit = "Submit";

  static const String goToSaleSite = "販売サイトへ移動する";
  static const String otherProducts = "その他商品";
  static const String goToProductPage = "商品一覧を見る";

  static const String version = "バージョン：";

  static const String language = 'Language';
  static const lumireNote = 'Lumière note';
  static const findOut = '''世界の小さな灯火を
  見つけよう''';
  static const crownFunding = '''ウォレットで支援するクラウドファンディング
  プロジェクトの成功は、貴方の成功''';
  static const createNewAccount = 'Create New Account';
  static const openAddress = 'Open Address';
  static const password = 'Password';
  static const signIn = 'Sign-In';

  /// [MyProfile]
  static const String searchMyProfile = "Seach";
  static const String nameCalled = "Name Called";
  static const String emailMyProfile = "E-mail";
  static const String phoneNumberMyProfile = "Phone Number";
  static const String termofServices = "Terms of Service";
  static const String privacyPolicyMyProfile = "Privacy Policy";
  static const String SpecifiedComercialTransactionArt =
      "Specified Commercial Transaction Act";
  static const String contact = "Contact";
  static const String urlString = "URL";
  static const String confirmUpdateMsg =
      "Your change have been \nsuccessfully updated!";
  static const String confirmURL = "Confirm URL";
  static const String currentPassword = "CurrentPassword";
  static const String newPassword = "Password";
  static const String confirmNewPassword = "Password";
  static const String forgotPassword = "Don't know your password?";
  static const String everyLanguage = "Every Language";
  static const String selectedLanguageOnly = "Selected Language only";

  static String currentPhoneNumber(String phoneNumber) =>
      "Current Phone Number: $phoneNumber";
  static const enterSMSCode = 'Enter 6 digits code send to your phone';
  static const resend = '再送する';
  static const smsVerificationNumber = 'SMS認証番号';
  static const confirmSmsText = 'Confirm SMS Text';
  static const welcome = 'ようこそ！';
  static const lumireNoteLabel = '''Lumière noteは、
ウォレットで支援するクラウドファンディングです
リターンにはNFTが配布されます
貴方が応援するプロジェクトが成功していくに従い
NFTの価値も向上することがあります

たくさんの小さな灯火に出会い、
ルミエーラー達と一緒に世界に大きな変化を作りましょう''';
  static const lampNotebook = 'ともしび　ノート';
  static const goToProject = 'プロジェクトに出会う';
  static const trendOfThisWeek = '今週のトレンド';

  /// [SIGNUP]
  static const String projectPageLabel = "プロジェクトページ";
  static const String homeTabLabel = "ホーム";
  static const String commentTabLabel = "コメント";
  static const String activityStatusTabLabel = "活動状況";
  static const String succeedLabel = 'Succeed!';
  static const String closedLabel = 'Closed';
  static const String currencyEthUnitLabel = "Eth";
  static const String currencyMaticUnitLabel = "Matic";
  static const String percentageLabel = "%";
  static const String replyLabel = "件の返信";
  static const String seeMoreLabel = "もっと見る";
  static const String supportPlanLabel = "支援プラン";
  static const String showDetailLabel = "詳細をみる";
  static const String closeDetailLabel = "詳細を閉じる";
  static const String onlyLittleLeftLabel = "残りわずかです!";
  static const String helpBuyLabel = "支援購入する";
  static const String recentlyUpdatedActivityStatusLabel = "最近更新された活動状況があります";
  static const String sameOriginatorProjectLabel = "同じ起案者のプロジェクト";
  static const String dayLeftLabel = "day left";
  static const String peopleSupportingLabel = "人が支援中";
  static const String limitLabel = "限定";
  static const String commentLabel = "コメント";
  static const String addCommentLabel = "コメントをする";
}
