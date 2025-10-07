// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct MediaReviewsQuery: GraphQLQuery {
  public static let operationName: String = "MediaReviews"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query MediaReviews($mediaId: Int, $page: Int, $perPage: Int) { Media(id: $mediaId) { __typename reviews(page: $page, perPage: $perPage, sort: RATING_DESC) { __typename nodes { __typename id summary score user { __typename name } } pageInfo { __typename hasNextPage } } } }"#
    ))

  public var mediaId: GraphQLNullable<Int32>
  public var page: GraphQLNullable<Int32>
  public var perPage: GraphQLNullable<Int32>

  public init(
    mediaId: GraphQLNullable<Int32>,
    page: GraphQLNullable<Int32>,
    perPage: GraphQLNullable<Int32>
  ) {
    self.mediaId = mediaId
    self.page = page
    self.perPage = perPage
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "mediaId": mediaId,
    "page": page,
    "perPage": perPage
  ] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("Media", Media?.self, arguments: ["id": .variable("mediaId")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      MediaReviewsQuery.Data.self
    ] }

    /// Media query
    public var media: Media? { __data["Media"] }

    /// Media
    ///
    /// Parent Type: `Media`
    public struct Media: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("reviews", Reviews?.self, arguments: [
          "page": .variable("page"),
          "perPage": .variable("perPage"),
          "sort": "RATING_DESC"
        ]),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        MediaReviewsQuery.Data.Media.self
      ] }

      /// User reviews of the media
      public var reviews: Reviews? { __data["reviews"] }

      /// Media.Reviews
      ///
      /// Parent Type: `ReviewConnection`
      public struct Reviews: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ReviewConnection }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("nodes", [Node?]?.self),
          .field("pageInfo", PageInfo?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          MediaReviewsQuery.Data.Media.Reviews.self
        ] }

        public var nodes: [Node?]? { __data["nodes"] }
        /// The pagination information
        public var pageInfo: PageInfo? { __data["pageInfo"] }

        /// Media.Reviews.Node
        ///
        /// Parent Type: `Review`
        public struct Node: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Review }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int.self),
            .field("summary", String?.self),
            .field("score", Int?.self),
            .field("user", User?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            MediaReviewsQuery.Data.Media.Reviews.Node.self
          ] }

          /// The id of the review
          public var id: Int { __data["id"] }
          /// A short summary of the review
          public var summary: String? { __data["summary"] }
          /// The review score of the media
          public var score: Int? { __data["score"] }
          /// The creator of the review
          public var user: User? { __data["user"] }

          /// Media.Reviews.Node.User
          ///
          /// Parent Type: `User`
          public struct User: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              MediaReviewsQuery.Data.Media.Reviews.Node.User.self
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
          }
        }

        /// Media.Reviews.PageInfo
        ///
        /// Parent Type: `PageInfo`
        public struct PageInfo: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.PageInfo }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("hasNextPage", Bool?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            MediaReviewsQuery.Data.Media.Reviews.PageInfo.self
          ] }

          /// If there is another page
          public var hasNextPage: Bool? { __data["hasNextPage"] }
        }
      }
    }
  }
}
