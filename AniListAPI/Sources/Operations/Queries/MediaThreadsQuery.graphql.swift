// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct MediaThreadsQuery: GraphQLQuery {
  public static let operationName: String = "MediaThreads"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query MediaThreads($page: Int, $perPage: Int, $mediaCategoryId: Int, $sort: [ThreadSort]) { Page(page: $page, perPage: $perPage) { __typename threads(mediaCategoryId: $mediaCategoryId, sort: $sort) { __typename ...BasicThreadDetails } pageInfo { __typename ...CommonPage } } }"#,
      fragments: [BasicThreadDetails.self, CommonPage.self]
    ))

  public var page: GraphQLNullable<Int32>
  public var perPage: GraphQLNullable<Int32>
  public var mediaCategoryId: GraphQLNullable<Int32>
  public var sort: GraphQLNullable<[GraphQLEnum<ThreadSort>?]>

  public init(
    page: GraphQLNullable<Int32>,
    perPage: GraphQLNullable<Int32>,
    mediaCategoryId: GraphQLNullable<Int32>,
    sort: GraphQLNullable<[GraphQLEnum<ThreadSort>?]>
  ) {
    self.page = page
    self.perPage = perPage
    self.mediaCategoryId = mediaCategoryId
    self.sort = sort
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "mediaCategoryId": mediaCategoryId,
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
      MediaThreadsQuery.Data.self
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
        .field("threads", [Thread?]?.self, arguments: [
          "mediaCategoryId": .variable("mediaCategoryId"),
          "sort": .variable("sort")
        ]),
        .field("pageInfo", PageInfo?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        MediaThreadsQuery.Data.Page.self
      ] }

      public var threads: [Thread?]? { __data["threads"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

      /// Page.Thread
      ///
      /// Parent Type: `Thread`
      public struct Thread: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Thread }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(BasicThreadDetails.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          MediaThreadsQuery.Data.Page.Thread.self,
          BasicThreadDetails.self
        ] }

        /// The id of the thread
        public var id: Int { __data["id"] }
        /// The title of the thread
        public var title: String? { __data["title"] }
        /// The text body of the thread (Markdown)
        public var body: String? { __data["body"] }
        /// The number of times users have viewed the thread
        public var viewCount: Int? { __data["viewCount"] }
        /// The amount of likes the thread has
        public var likeCount: Int { __data["likeCount"] }
        /// If the currently authenticated user liked the thread
        public var isLiked: Bool? { __data["isLiked"] }
        /// If the currently authenticated user is subscribed to the thread
        public var isSubscribed: Bool? { __data["isSubscribed"] }
        /// The number of comments on the thread
        public var replyCount: Int? { __data["replyCount"] }
        /// If the thread is locked and can receive comments
        public var isLocked: Bool? { __data["isLocked"] }
        /// The owner of the thread
        public var user: User? { __data["user"] }
        /// The time of the thread creation
        public var createdAt: Int { __data["createdAt"] }

        public struct Fragments: FragmentContainer {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public var basicThreadDetails: BasicThreadDetails { _toFragment() }
        }

        public typealias User = BasicThreadDetails.User
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
          MediaThreadsQuery.Data.Page.PageInfo.self,
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
