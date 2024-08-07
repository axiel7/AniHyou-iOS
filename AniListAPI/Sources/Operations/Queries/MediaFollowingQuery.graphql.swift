// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class MediaFollowingQuery: GraphQLQuery {
  public static let operationName: String = "MediaFollowing"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query MediaFollowing($id: Int, $page: Int, $perPage: Int) { Page(page: $page, perPage: $perPage) { __typename mediaList(mediaId: $id, isFollowing: true, sort: UPDATED_TIME_DESC) { __typename id status score progress user { __typename id name avatar { __typename medium } mediaListOptions { __typename scoreFormat } } } pageInfo { __typename currentPage hasNextPage } } }"#
    ))

  public var id: GraphQLNullable<Int>
  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>

  public init(
    id: GraphQLNullable<Int>,
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>
  ) {
    self.id = id
    self.page = page
    self.perPage = perPage
  }

  public var __variables: Variables? { [
    "id": id,
    "page": page,
    "perPage": perPage
  ] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
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

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Page }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("mediaList", [MediaList?]?.self, arguments: [
          "mediaId": .variable("id"),
          "isFollowing": true,
          "sort": "UPDATED_TIME_DESC"
        ]),
        .field("pageInfo", PageInfo?.self),
      ] }

      public var mediaList: [MediaList?]? { __data["mediaList"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

      /// Page.MediaList
      ///
      /// Parent Type: `MediaList`
      public struct MediaList: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("status", GraphQLEnum<AniListAPI.MediaListStatus>?.self),
          .field("score", Double?.self),
          .field("progress", Int?.self),
          .field("user", User?.self),
        ] }

        /// The id of the list entry
        public var id: Int { __data["id"] }
        /// The watching/reading status
        public var status: GraphQLEnum<AniListAPI.MediaListStatus>? { __data["status"] }
        /// The score of the entry
        public var score: Double? { __data["score"] }
        /// The amount of episodes/chapters consumed by the user
        public var progress: Int? { __data["progress"] }
        public var user: User? { __data["user"] }

        /// Page.MediaList.User
        ///
        /// Parent Type: `User`
        public struct User: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int.self),
            .field("name", String.self),
            .field("avatar", Avatar?.self),
            .field("mediaListOptions", MediaListOptions?.self),
          ] }

          /// The id of the user
          public var id: Int { __data["id"] }
          /// The name of the user
          public var name: String { __data["name"] }
          /// The user's avatar images
          public var avatar: Avatar? { __data["avatar"] }
          /// The user's media list options
          public var mediaListOptions: MediaListOptions? { __data["mediaListOptions"] }

          /// Page.MediaList.User.Avatar
          ///
          /// Parent Type: `UserAvatar`
          public struct Avatar: AniListAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserAvatar }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("medium", String?.self),
            ] }

            /// The avatar of user at medium size
            public var medium: String? { __data["medium"] }
          }

          /// Page.MediaList.User.MediaListOptions
          ///
          /// Parent Type: `MediaListOptions`
          public struct MediaListOptions: AniListAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaListOptions }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("scoreFormat", GraphQLEnum<AniListAPI.ScoreFormat>?.self),
            ] }

            /// The score format the user is using for media lists
            public var scoreFormat: GraphQLEnum<AniListAPI.ScoreFormat>? { __data["scoreFormat"] }
          }
        }
      }

      /// Page.PageInfo
      ///
      /// Parent Type: `PageInfo`
      public struct PageInfo: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.PageInfo }
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
