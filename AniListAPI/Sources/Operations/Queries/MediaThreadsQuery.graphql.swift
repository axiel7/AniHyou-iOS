// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class MediaThreadsQuery: GraphQLQuery {
  public static let operationName: String = "MediaThreads"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query MediaThreads($page: Int, $perPage: Int, $mediaCategoryId: Int, $sort: [ThreadSort]) { Page(page: $page, perPage: $perPage) { __typename threads(mediaCategoryId: $mediaCategoryId, sort: $sort) { __typename id title body(asHtml: true) viewCount replyCount likeCount createdAt user { __typename id name avatar { __typename medium } } } } }"#
    ))

  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>
  public var mediaCategoryId: GraphQLNullable<Int>
  public var sort: GraphQLNullable<[GraphQLEnum<ThreadSort>?]>

  public init(
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>,
    mediaCategoryId: GraphQLNullable<Int>,
    sort: GraphQLNullable<[GraphQLEnum<ThreadSort>?]>
  ) {
    self.page = page
    self.perPage = perPage
    self.mediaCategoryId = mediaCategoryId
    self.sort = sort
  }

  public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "mediaCategoryId": mediaCategoryId,
    "sort": sort
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
        .field("threads", [Thread?]?.self, arguments: [
          "mediaCategoryId": .variable("mediaCategoryId"),
          "sort": .variable("sort")
        ]),
      ] }

      public var threads: [Thread?]? { __data["threads"] }

      /// Page.Thread
      ///
      /// Parent Type: `Thread`
      public struct Thread: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Thread }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("title", String?.self),
          .field("body", String?.self, arguments: ["asHtml": true]),
          .field("viewCount", Int?.self),
          .field("replyCount", Int?.self),
          .field("likeCount", Int.self),
          .field("createdAt", Int.self),
          .field("user", User?.self),
        ] }

        /// The id of the thread
        public var id: Int { __data["id"] }
        /// The title of the thread
        public var title: String? { __data["title"] }
        /// The text body of the thread (Markdown)
        public var body: String? { __data["body"] }
        /// The number of times users have viewed the thread
        public var viewCount: Int? { __data["viewCount"] }
        /// The number of comments on the thread
        public var replyCount: Int? { __data["replyCount"] }
        /// The amount of likes the thread has
        public var likeCount: Int { __data["likeCount"] }
        /// The time of the thread creation
        public var createdAt: Int { __data["createdAt"] }
        /// The owner of the thread
        public var user: User? { __data["user"] }

        /// Page.Thread.User
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

          /// Page.Thread.User.Avatar
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
    }
  }
}
