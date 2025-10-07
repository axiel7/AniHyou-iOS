// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct UserActivityQuery: GraphQLQuery {
  public static let operationName: String = "UserActivity"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query UserActivity($page: Int, $perPage: Int, $userId: Int, $sort: [ActivitySort]) { Page(page: $page, perPage: $perPage) { __typename activities(userId: $userId, sort: $sort) { __typename ... on TextActivity { ...TextActivityFragment } ... on ListActivity { ...ListActivityFragment } ... on MessageActivity { ...MessageActivityFragment } } pageInfo { __typename ...CommonPage } } }"#,
      fragments: [CommonPage.self, ListActivityFragment.self, MessageActivityFragment.self, TextActivityFragment.self]
    ))

  public var page: GraphQLNullable<Int32>
  public var perPage: GraphQLNullable<Int32>
  public var userId: GraphQLNullable<Int32>
  public var sort: GraphQLNullable<[GraphQLEnum<ActivitySort>?]>

  public init(
    page: GraphQLNullable<Int32>,
    perPage: GraphQLNullable<Int32>,
    userId: GraphQLNullable<Int32>,
    sort: GraphQLNullable<[GraphQLEnum<ActivitySort>?]>
  ) {
    self.page = page
    self.perPage = perPage
    self.userId = userId
    self.sort = sort
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "userId": userId,
    "sort": sort
  ] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("Page", Page?.self, arguments: [
        "page": .variable("page"),
        "perPage": .variable("perPage")
      ]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      UserActivityQuery.Data.self
    ] }

    public var page: Page? { __data["Page"] }

    /// Page
    ///
    /// Parent Type: `Page`
    public struct Page: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Page }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("activities", [Activity?]?.self, arguments: [
          "userId": .variable("userId"),
          "sort": .variable("sort")
        ]),
        .field("pageInfo", PageInfo?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        UserActivityQuery.Data.Page.self
      ] }

      public var activities: [Activity?]? { __data["activities"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

      /// Page.Activity
      ///
      /// Parent Type: `ActivityUnion`
      public struct Activity: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Unions.ActivityUnion }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .inlineFragment(AsTextActivity.self),
          .inlineFragment(AsListActivity.self),
          .inlineFragment(AsMessageActivity.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          UserActivityQuery.Data.Page.Activity.self
        ] }

        public var asTextActivity: AsTextActivity? { _asInlineFragment() }
        public var asListActivity: AsListActivity? { _asInlineFragment() }
        public var asMessageActivity: AsMessageActivity? { _asInlineFragment() }

        /// Page.Activity.AsTextActivity
        ///
        /// Parent Type: `TextActivity`
        public struct AsTextActivity: AniListAPI.InlineFragment {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = UserActivityQuery.Data.Page.Activity
          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.TextActivity }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .fragment(TextActivityFragment.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            UserActivityQuery.Data.Page.Activity.self,
            UserActivityQuery.Data.Page.Activity.AsTextActivity.self,
            TextActivityFragment.self
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
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            public var textActivityFragment: TextActivityFragment { _toFragment() }
          }

          public typealias User = TextActivityFragment.User
        }

        /// Page.Activity.AsListActivity
        ///
        /// Parent Type: `ListActivity`
        public struct AsListActivity: AniListAPI.InlineFragment {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = UserActivityQuery.Data.Page.Activity
          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ListActivity }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .fragment(ListActivityFragment.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            UserActivityQuery.Data.Page.Activity.self,
            UserActivityQuery.Data.Page.Activity.AsListActivity.self,
            ListActivityFragment.self
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
          /// The type of activity
          public var type: GraphQLEnum<AniListAPI.ActivityType>? { __data["type"] }
          /// The list progress made
          public var progress: String? { __data["progress"] }
          /// The list item's textual status
          public var status: String? { __data["status"] }
          /// The user id of the activity's creator
          public var userId: Int? { __data["userId"] }
          /// The owner of the activity
          public var user: User? { __data["user"] }
          /// The associated media to the activity update
          public var media: Media? { __data["media"] }

          public struct Fragments: FragmentContainer {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            public var listActivityFragment: ListActivityFragment { _toFragment() }
          }

          public typealias User = ListActivityFragment.User

          public typealias Media = ListActivityFragment.Media
        }

        /// Page.Activity.AsMessageActivity
        ///
        /// Parent Type: `MessageActivity`
        public struct AsMessageActivity: AniListAPI.InlineFragment {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = UserActivityQuery.Data.Page.Activity
          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MessageActivity }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .fragment(MessageActivityFragment.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            UserActivityQuery.Data.Page.Activity.self,
            UserActivityQuery.Data.Page.Activity.AsMessageActivity.self,
            MessageActivityFragment.self
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
          /// If the message is private and only viewable to the sender and recipients
          public var isPrivate: Bool? { __data["isPrivate"] }
          /// If the activity is locked and can receive replies
          public var isLocked: Bool? { __data["isLocked"] }
          /// The message text (Markdown)
          public var message: String? { __data["message"] }
          /// The user id of the activity's sender
          public var messengerId: Int? { __data["messengerId"] }
          /// The user who sent the activity message
          public var messenger: Messenger? { __data["messenger"] }

          public struct Fragments: FragmentContainer {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            public var messageActivityFragment: MessageActivityFragment { _toFragment() }
          }

          public typealias Messenger = MessageActivityFragment.Messenger
        }
      }

      /// Page.PageInfo
      ///
      /// Parent Type: `PageInfo`
      public struct PageInfo: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.PageInfo }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(CommonPage.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          UserActivityQuery.Data.Page.PageInfo.self,
          CommonPage.self
        ] }

        /// The current page
        public var currentPage: Int? { __data["currentPage"] }
        /// If there is another page
        public var hasNextPage: Bool? { __data["hasNextPage"] }

        public struct Fragments: FragmentContainer {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public var commonPage: CommonPage { _toFragment() }
        }
      }
    }
  }
}
