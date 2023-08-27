class NFTMutation {
  static final String loginMutation = '''
mutation login(\$request: String!) {
  login(request: \$request) {
    ...Response!
    }
  }

  fragment Response on UserResponse {
    result {
      ...User
      }
    isSuccess
    errors
  }

  fragment User on UserDetail {
    id
    name
    title
    overview
    icon
    favoriteProjects {
      ...FavoriteProjects
      }
  }

  fragment FavoriteProjects on Project {
    id
    address
    title
    overview
    categoryId
    mainImage {
      ...ImageResponse
      }
    subImages {
      ...ImageResponse
      }
    targeAmount
    status
    deadline
    publishedDate
    network
    tags
    createDate
    updateDate
  }

  fragment ImageResponse on Image {
    key
    fileName
    path
    contentType
  }
  
  ''';

  static final String followMutation = '''
mutation follow(\$request: Followinput!) {
  follow(request: \$request) {
    ...Response!
    }

  fragment Response on CommandResponse {
    result {
      ...CommandResult
      }
    errors
    isSuccess
  }

  fragment CommandResult on Command {
    status
    message
  }''';

  static final String followRemoveMutation = '''
mutation followRemove(\$request: Followinput!) {
  follow(request: \$request) {
    ...Response!
    }
  }

  fragment Response on CommandResponse {
    result {
      ...CommandResult
      }
    errors
    isSuccess
  }

  fragment CommandResult on Command {
    status
    message
  }
  
  ''';

  static final String messageCreateInProject = '''
mutation messageCreateInProject(\$request: MessageInput!) {
  messageCreateInProject(request: \$request) {
    ...Response!
    }
  }

  fragment Response on CommandResponse {
    result {
      ...CommandResult
      }
    errors
    isSuccess
  }

  fragment CommandResult on Command {
    status
    message
  }
  
  ''';

  static final String messageCreateInReport = '''
mutation messageCreateInReport(\$request: MessageInput!) {
  messageCreateInReport(request: \$request) {
    ...Response!
    }
  }

  fragment Response on CommandResponse {
    result {
      ...CommandResult
      }
    errors
    isSuccess
  }

  fragment CommandResult on Command {
    status
    message
  }
  
  ''';

  static final String messageUpdated = '''
mutation messageUpdated(\$request: MessageUpdateInput!) {
  messageUpdated(request: \$request) {
    ...Response!
    }
  }

  fragment Response on CommandResponse {
    result {
      ...CommandResult
      }
    errors
    isSuccess
  }

  fragment CommandResult on Command {
    status
    message
  }''';

  static final String nftImageUrlCreate = '''
mutation nftImageUrlCreate(\$request: ImageUrlInput!) {
  nftImageUrlCreate(request: \$request) {
    ...Response!
    }
  }

  fragment Response on ImageUrlResponse {
    result {
      ...Image
      }
    errors
    isSuccess
  }

  fragment Image on ImageUrl {
    url
    key
  }''';

  static final String nftInvest = '''
mutation nftInvest(\$request: InvestInput!) {
  nftInvest(request: \$request) {
    ...Response!
    }
  }

  fragment Response on CommandResponse {
    result {
      ...CommandResult
      }
    errors
    isSuccess
  }

  fragment CommandResult on Command {
    status
    message
  }''';

  static final String projectCreate = '''
mutation projectCreate(\$request: ProjectInput!) {
  projectCreate(request: \$request) {
    ...CommandResponse!
    }
  }

  fragment Response on CommandResponse {
    result {
      ...CommandResult
      }
    errors
    isSuccess
  }

  fragment CommandResult on Command {
    status
    message
  }''';

  static final String projectUpdate = '''
mutation projectUpdate(\$request: ProjectUpdateInput!) {
  projectUpdate(request: \$request) {
    ...Response!
    }
  }

  fragment Response on CommandResponse {
    result {
      ...CommandResult
      }
    errors
    isSuccess
  }

  fragment CommandResult on Command {
    status
    message
  }''';

  static final String projectLiked = '''
mutation projectLiked(\$request: ProjectLikedInput!) {
  projectLiked(request: \$request) {
    ...Response!
    }
  }

  fragment Response on CommandResponse {
    result {
      ...CommandResult
      }
    errors
    isSuccess
  }

  fragment CommandResult on Command {
    status
    message
  }''';

  static final String projectImageUrlCreate = '''
mutation projectImageUrlCreate(\$request: ImageUrlInput!) {
  projectImageUrlCreate(request: \$request) {
    ...Response!
    }
  }

  fragment Response on ImageUrlResponse {
    result {
      ...Image
      }
    errors
    isSuccess
  }

  fragment Image on ImageUrls {
    items {
      ...ImageItem
      }
  }

  fragment ImageItem on ImageUrl {
    url
    key
  }''';

  static final String reportCreate = '''
mutation reportCreate(\$request: ReportInput!) {
  reportCreate(request: \$request) {
    ...Response!
    }
  }

  fragment Response on CommandResponse {
    result {
      ...CommandResult
      }
    errors
    isSuccess
  }

  fragment CommandResult on Command {
    status
    message
  }''';

  static final String reportUpdate = '''
mutation reportUpdate(\$request: ReportUpdateInput!) {
  reportUpdate(request: \$request) {
    ...Response!
    }
  }

  fragment Response on CommandResponse {
    result {
      ...CommandResult
      }
    errors
    isSuccess
  }

  fragment CommandResult on Command {
    status
    message
  }''';

  static final String replayAdd = '''
mutation replayAdd(\$request: ReplayInput!) {
  replayAdd(request: \$request) {
    ...Response!
    }
  }

  fragment Response on CommandResponse {
    result {
      ...CommandResult
      }
    errors
    isSuccess
  }

  fragment CommandResult on Command {
    status
    message
  }''';

  static final String replayUpdate = '''
mutation replayUpdate(\$request: ReplayUpdateInput!) {
  replayUpdate(request: \$request) {
    ...Response!
    }
  }

  fragment Response on CommandResponse {
    result {
      ...CommandResult
      }
    errors
    isSuccess
  }

  fragment CommandResult on Command {
    status
    message
  }''';

  static final String userCreate = '''
mutation userCreate(\$request: UserInput!) {
  userCreate(request: \$request) {
    ...Response!
    }
  }

  fragment Response on CommandResponse {
    result {
      ...CommandResult
      }
    errors
    isSuccess
  }

  fragment CommandResult on Command {
    status
    message
  }''';

  static final String userUpdate = '''
mutation useUpdate(\$request: UserUpdateInput!) {
  useUpdate(request: \$request) {
    ...CommandResponse!
    }
  }

  fragment Response on CommandResponse {
    result {
      ...CommandResult
      }
    errors
    isSuccess
  }

  fragment CommandResult on Command {
    status
    message
  }''';

  static final String userImageUrlCreate = '''
mutation userImageUrlCreate(\$request: ImageUrlInput!) {
  userImageUrlCreate(request: \$request) {
    ...Response!
    }
  }

  fragment Response on ImageUrlResponse {
    result {
      ...Image
    }
    errors
    isSuccess
  }
  fragment Image on ImageUrl {
    url
    key
  }
  ''';
}
