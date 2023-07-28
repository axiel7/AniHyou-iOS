// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ThreadCommentsQuery: GraphQLQuery {
  public static let operationName: String = "ThreadComments"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query ThreadComments($page: Int, $perPage: Int, $threadId: Int) { Page(page: $page, perPage: $perPage) { __typename threadComments(threadId: $threadId) { __typename id comment(asHtml: false) likeCount createdAt user { __typename id name avatar { __typename medium } } } pageInfo { __typename currentPage hasNextPage } } }"#
    ))

  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>
  public var threadId: GraphQLNullable<Int>

  public init(
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>,
    threadId: GraphQLNullable<Int>
  ) {
    self.page = page
    self.perPage = perPage
    self.threadId = threadId
  }

  public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "threadId": threadId
  ] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Page", Page?.self, arguments: [
        "page": .variable("page"),
        "perPage": .variable("perPage")
      ]),
    ] }

    public var page: Page? { __data["Page"] }

    /// Page
    ///
    /// Parent Type: `Page`
    public struct Page: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Page }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("threadComments", [ThreadComment?]?.self, arguments: ["threadId": .variable("threadId")]),
        .field("pageInfo", PageInfo?.self),
      ] }

      public var threadComments: [ThreadComment?]? { __data["threadComments"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

      /// Page.ThreadComment
      ///
      /// Parent Type: `ThreadComment`
      public struct ThreadComment: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.ThreadComment }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("comment", String?.self, arguments: ["asHtml": false]),
          .field("likeCount", Int.self),
          .field("createdAt", Int.self),
          .field("user", User?.self),
        ] }

        /// The id of the comment
        public var id: Int { __data["id"] }
        /// The text content of the comment (Markdown)
        public var comment: String? { __data["comment"] }
        /// The amount of likes the comment has
        public var likeCount: Int { __data["likeCount"] }
        /// The time of the comments creation
        public var createdAt: Int { __data["createdAt"] }
        /// The user who created the comment
        public var user: User? { __data["user"] }

        /// Page.ThreadComment.User
        ///
        /// Parent Type: `User`
        public struct User: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.User }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int.self),
            .field("name", String.self),
            .field("avatar", Avatar?.self),
          ] }

          /// The id of the user
          public var id: Int { __data["id"] }
          /// The name of the user
          public var name: String { __data["name"] }
          /// The user's avatar images
          public var avatar: Avatar? { __data["avatar"] }

          /// Page.ThreadComment.User.Avatar
          ///
          /// Parent Type: `UserAvatar`
          public struct Avatar: AniListAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.UserAvatar }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("medium", String?.self),
            ] }

            /// The avatar of user at medium size
            public var medium: String? { __data["medium"] }
          }
        }
      }

      /// Page.PageInfo
      ///
      /// Parent Type: `PageInfo`
      public struct PageInfo: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.PageInfo }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("currentPage", Int?.self),
          .field("hasNextPage", Bool?.self),
        ] }

        /// The current page
        public var currentPage: Int? { __data["currentPage"] }
        /// If there is another page
        public var hasNextPage: Bool? { __data["hasNextPage"] }
      }
    }
  }
}
