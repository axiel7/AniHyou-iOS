// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ActivityFeedQuery: GraphQLQuery {
  public static let operationName: String = "ActivityFeed"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query ActivityFeed($page: Int, $perPage: Int, $isFollowing: Boolean, $typeIn: [ActivityType]) { Page(page: $page, perPage: $perPage) { __typename activities(isFollowing: $isFollowing, sort: [ID_DESC], type_in: $typeIn) { __typename ... on TextActivity { ...TextActivityFragment } ... on ListActivity { ...ListActivityFragment user { __typename name avatar { __typename medium } } } } pageInfo { __typename currentPage hasNextPage } } }"#,
      fragments: [ListActivityFragment.self, TextActivityFragment.self]
    ))

  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>
  public var isFollowing: GraphQLNullable<Bool>
  public var typeIn: GraphQLNullable<[GraphQLEnum<ActivityType>?]>

  public init(
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>,
    isFollowing: GraphQLNullable<Bool>,
    typeIn: GraphQLNullable<[GraphQLEnum<ActivityType>?]>
  ) {
    self.page = page
    self.perPage = perPage
    self.isFollowing = isFollowing
    self.typeIn = typeIn
  }

  public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "isFollowing": isFollowing,
    "typeIn": typeIn
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
        .field("activities", [Activity?]?.self, arguments: [
          "isFollowing": .variable("isFollowing"),
          "sort": ["ID_DESC"],
          "type_in": .variable("typeIn")
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

        public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Unions.ActivityUnion }
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

          public typealias RootEntityType = ActivityFeedQuery.Data.Page.Activity
          public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.TextActivity }
          public static var __selections: [ApolloAPI.Selection] { [
            .fragment(TextActivityFragment.self),
          ] }

          /// The id of the activity
          public var id: Int { __data["id"] }
          /// The time the activity was created at
          public var createdAt: Int { __data["createdAt"] }
          /// If the currently authenticated user liked the activity
          public var isLiked: Bool? { __data["isLiked"] }
          /// The amount of likes the activity has
          public var likeCount: Int { __data["likeCount"] }
          /// The number of activity replies
          public var replyCount: Int { __data["replyCount"] }
          /// If the activity is locked and can receive replies
          public var isLocked: Bool? { __data["isLocked"] }
          /// The status text (Markdown)
          public var text: String? { __data["text"] }
          /// The user id of the activity's creator
          public var userId: Int? { __data["userId"] }
          /// The user who created the activity
          public var user: User? { __data["user"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var textActivityFragment: TextActivityFragment { _toFragment() }
          }

          public typealias User = TextActivityFragment.User
        }

        /// Page.Activity.AsListActivity
        ///
        /// Parent Type: `ListActivity`
        public struct AsListActivity: AniListAPI.InlineFragment {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = ActivityFeedQuery.Data.Page.Activity
          public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ListActivity }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("user", User?.self),
            .fragment(ListActivityFragment.self),
          ] }

          /// The owner of the activity
          public var user: User? { __data["user"] }
          /// The id of the activity
          public var id: Int { __data["id"] }
          /// The time the activity was created at
          public var createdAt: Int { __data["createdAt"] }
          /// If the currently authenticated user liked the activity
          public var isLiked: Bool? { __data["isLiked"] }
          /// The amount of likes the activity has
          public var likeCount: Int { __data["likeCount"] }
          /// The number of activity replies
          public var replyCount: Int { __data["replyCount"] }
          /// If the activity is locked and can receive replies
          public var isLocked: Bool? { __data["isLocked"] }
          /// The type of activity
          public var type: GraphQLEnum<AniListAPI.ActivityType>? { __data["type"] }
          /// The list progress made
          public var progress: String? { __data["progress"] }
          /// The list item's textual status
          public var status: String? { __data["status"] }
          /// The user id of the activity's creator
          public var userId: Int? { __data["userId"] }
          /// The associated media to the activity update
          public var media: Media? { __data["media"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var listActivityFragment: ListActivityFragment { _toFragment() }
          }

          /// Page.Activity.AsListActivity.User
          ///
          /// Parent Type: `User`
          public struct User: AniListAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Activity.AsListActivity.User.Avatar
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
          }

          public typealias Media = ListActivityFragment.Media
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