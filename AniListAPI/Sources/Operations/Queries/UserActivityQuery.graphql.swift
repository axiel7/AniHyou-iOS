// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UserActivityQuery: GraphQLQuery {
  public static let operationName: String = "UserActivity"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query UserActivity($page: Int, $perPage: Int, $userId: Int, $sort: [ActivitySort]) { Page(page: $page, perPage: $perPage) { __typename activities(userId: $userId, sort: $sort) { __typename ... on TextActivity { id type text createdAt } ... on ListActivity { id type status progress createdAt media { __typename id title { __typename userPreferred } coverImage { __typename medium } } } } pageInfo { __typename currentPage hasNextPage } } }"#
    ))

  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>
  public var userId: GraphQLNullable<Int>
  public var sort: GraphQLNullable<[GraphQLEnum<ActivitySort>?]>

  public init(
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>,
    userId: GraphQLNullable<Int>,
    sort: GraphQLNullable<[GraphQLEnum<ActivitySort>?]>
  ) {
    self.page = page
    self.perPage = perPage
    self.userId = userId
    self.sort = sort
  }

  public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "userId": userId,
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
        .field("activities", [Activity?]?.self, arguments: [
          "userId": .variable("userId"),
          "sort": .variable("sort")
        ]),
        .field("pageInfo", PageInfo?.self),
      ] }

      public var activities: [Activity?]? { __data["activities"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

      /// Page.Activity
      ///
      /// Parent Type: `ActivityUnion`
      public struct Activity: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Unions.ActivityUnion }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .inlineFragment(AsTextActivity.self),
          .inlineFragment(AsListActivity.self),
        ] }

        public var asTextActivity: AsTextActivity? { _asInlineFragment() }
        public var asListActivity: AsListActivity? { _asInlineFragment() }

        /// Page.Activity.AsTextActivity
        ///
        /// Parent Type: `TextActivity`
        public struct AsTextActivity: AniListAPI.InlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = UserActivityQuery.Data.Page.Activity
          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.TextActivity }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("type", GraphQLEnum<AniListAPI.ActivityType>?.self),
            .field("text", String?.self),
            .field("createdAt", Int.self),
          ] }

          /// The id of the activity
          public var id: Int { __data["id"] }
          /// The type of activity
          public var type: GraphQLEnum<AniListAPI.ActivityType>? { __data["type"] }
          /// The status text (Markdown)
          public var text: String? { __data["text"] }
          /// The time the activity was created at
          public var createdAt: Int { __data["createdAt"] }
        }

        /// Page.Activity.AsListActivity
        ///
        /// Parent Type: `ListActivity`
        public struct AsListActivity: AniListAPI.InlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = UserActivityQuery.Data.Page.Activity
          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.ListActivity }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("type", GraphQLEnum<AniListAPI.ActivityType>?.self),
            .field("status", String?.self),
            .field("progress", String?.self),
            .field("createdAt", Int.self),
            .field("media", Media?.self),
          ] }

          /// The id of the activity
          public var id: Int { __data["id"] }
          /// The type of activity
          public var type: GraphQLEnum<AniListAPI.ActivityType>? { __data["type"] }
          /// The list item's textual status
          public var status: String? { __data["status"] }
          /// The list progress made
          public var progress: String? { __data["progress"] }
          /// The time the activity was created at
          public var createdAt: Int { __data["createdAt"] }
          /// The associated media to the activity update
          public var media: Media? { __data["media"] }

          /// Page.Activity.AsListActivity.Media
          ///
          /// Parent Type: `Media`
          public struct Media: AniListAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Media }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Int.self),
              .field("title", Title?.self),
              .field("coverImage", CoverImage?.self),
            ] }

            /// The id of the media
            public var id: Int { __data["id"] }
            /// The official titles of the media in various languages
            public var title: Title? { __data["title"] }
            /// The cover images of the media
            public var coverImage: CoverImage? { __data["coverImage"] }

            /// Page.Activity.AsListActivity.Media.Title
            ///
            /// Parent Type: `MediaTitle`
            public struct Title: AniListAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaTitle }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("userPreferred", String?.self),
              ] }

              /// The currently authenticated users preferred title language. Default romaji for non-authenticated
              public var userPreferred: String? { __data["userPreferred"] }
            }

            /// Page.Activity.AsListActivity.Media.CoverImage
            ///
            /// Parent Type: `MediaCoverImage`
            public struct CoverImage: AniListAPI.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaCoverImage }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("medium", String?.self),
              ] }

              /// The cover image url of the media at medium size
              public var medium: String? { __data["medium"] }
            }
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
