class NFTQuery {
  static final String healthyQuery = '''query healthy {
    healthy
  }''';

  static final String followsQuery = """
    query follows(\$request: FollowSearchInput!) {
      follows(request: \$request) {
        ...UsersResponseFields
      }
    }

    fragment UserResponseFields on UserResponse {
      status
      message
      result {
        ...UserDetailFields
      }
    }

    fragment ImageFields on Image {
        key
        fileName
        path
        contentType
    }

    fragment UserDetailFields on UserDetail {
      id
      name
      title
      icon {
        ...ImageFields
      }
      favoriteProject {
        ...ProjectItemFields
      }
    }

    fragment ProjectItemFields on ProjectItem {
      id
      address
      title
      overview
      quantity
      categoryId
      mainImage {
        ...ImageFields
      }
      subImage {
        ...ImageFields
      }
      targetAmount
      status
      deadline
      publishedDate
      network
      tag
      createDate
      updateDate
    }
""";

  static final String categoriesQuery = '''query categories {
  categories {
    ...MastersResponseFields
  }
}
fragment MastersResponseFields on MastersResponse {
  result {
    ...MastersFields
  }
}
fragment MastersFields on Masters {
  items {
    ...MasterFields
  }
}
fragment MasterFields on Master {
  id
  name
}
''';

  static final String messageQuery = '''query message(\$request: String){
    message(request: \$request){
      result {
        ...MessageFields
      }
      errors
      isSuccess
    }
  }
    fragment MessageFields on Messages {
      items {
        id
        sender {
          id
          name
          title
          overview
          icon {
            ...ImageFields
          }
        }
        text
        createDate
        updateDate
        replies {
          id
          sender{
            id
            name
            title
            overview
            icon {
              ...ImageFields
            }
        }
        text
        createDate
        updateDate
        }
      }

    }
    fragment ImageFields on Image {
        key
        fileName
        path
        contentType
    }
''';

  static final String networksQuery = '''query networks {
    result {
      ...MastersItemFields
    }
    errors
    isSuccess
  }
    fragment MastersItemFields on MastersItem {
      items {
        id
        label
      }
  }
 ''';

  static final String projectQuery = '''query project(request:\$String) {
    project(request: \$request){
      ...ProjectResponseFields
    }
  }
  fragment ImageFields on Image {
        key
        fileName
        path
        contentType
    }
  fragment ProjectResponseFields on ProjectItem {
      id
      address
      title
      overview
      quantity
      categoryId
      mainImage {
        ...ImageFields
      }
      subImage {
        ...ImageFields
      }
      targetAmount
      status
      deadline
      publishedDate
      network
      tag
      createDate
      updateDate
  }
  ''';

  static final String projectsQuery =
      '''query projects(request: \$ProjectSearchInput) {
    projects(request: \$request){
      ...ProjectsResponseFields
    }
  }
  fragment ProjectsResponseFields on Projects {
    items {
      ...ProjectResponseFields
    }
    pages {
      totalCount
    }
  }
  fragment ImageFields on Image {
    key
    fileName
    path
    contentType
  }
  fragment ProjectResponseFields on ProjectItem {
    id
    address
    title
    overview
    quantity
    categoryId
    mainImage {
      ...ImageFields
    }
    subImage {
      ...ImageFields
    }
    targetAmount
    status
    deadline
    publishedDate
    network
    tag
    createDate
    updateDate
  }
''';

  static final String projectMessagesQuery =
      '''query projectMessage(request: \$String){
  projectMessage(request: \$request){
      result {
        ...MessageFields
      }
      errors
      isSuccess
    }
  }
    fragment ImageFields on Image {
        key
        fileName
        path
        contentType
    }
    fragment MessageFields on Messages {
      items {
        id
        sender {
          id
          name
          title
          overview
          icon {
            ...ImageFields
          }
        }
        text
        createDate
        updateDate
        replies {
          id
          sender{
            id
            name
            title
            overview
            icon {
              ...ImageFields
            }
        }
        text
        createDate
        updateDate
        }
      }
    }
''';

  static final String reportQuery = '''query report(request: \$String){
    report(request: \$request){
      ...ReportResponseFields
    }
  }

  fragment  ReportResponseFields on ReportResponse {
    result {
      id
      projectId
      title
      overview
      status
      createDate
      updateDate
      messages {
        ...MessageFields
      }
    }
    errors
    isSuccess
  }
  fragment ImageFields on Image {
          key
          fileName
          path
          contentType
      }
      fragment MessageFields on Messages {
        items {
          id
          sender {
            id
            name
            title
            overview
            icon {
              ...ImageFields
            }
          }
          text
          createDate
          updateDate
          replies {
            id
            sender{
              id
              name
              title
              overview
              icon {
                ...ImageFields
              }
          }
          text
          createDate
          updateDate
          }
        }

    }
''';

  static final String reportsQuery =
      '''query reports(request: \$ReportSearchInput){
  reposts(request: \$request){
    ...ReportsResponse
  }
}''';

  static final String reportMessagesQuery =
      '''query reportMessages(request: \$String){
  reportMessages(request: \$request){
      result {
        ...MessageFields
      }
      errors
      isSuccess
    }
  }
    fragment ImageFields on Image {
        key
        fileName
        path
        contentType
    }
    fragment MessageFields on Messages {
      items {
        id
        sender {
          id
          name
          title
          overview
          icon {
            ...ImageFields
          }
        }
        text
        createDate
        updateDate
        replies {
          id
          sender{
            id
            name
            title
            overview
            icon {
              ...ImageFields
            }
        }
        text
        createDate
        updateDate
        }
      }
    }
''';

  static final String tagsQuery = '''query tags {
  ...TagsResponseFields 
  }

  fragment TagsResponseField on TagsResponse {
    result {
      items
    }
    errors 
    isSuccess
  }
''';
}
