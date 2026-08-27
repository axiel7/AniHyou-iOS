// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct MediaRecommendationsQuery: GraphQLQuery {
  public static let operationName: String = "MediaRecommendations"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query MediaRecommendations($onList: Boolean, $sort: [RecommendationSort], $page: Int, $perPage: Int) { Page(page: $page, perPage: $perPage) { __typename recommendations(onList: $onList, sort: $sort) { __typename ...CommonRecommendation } pageInfo { __typename ...CommonPage } } }"#,
      fragments: [BasicMediaDetails.self, BasicMediaListEntry.self, CommonPage.self, CommonRecommendation.self, FuzzyDateFragment.self]
    ))

  public var onList: GraphQLNullable<Bool>
  public var sort: GraphQLNullable<[GraphQLEnum<RecommendationSort>?]>
  public var page: GraphQLNullable<Int32>
  public var perPage: GraphQLNullable<Int32>

  public init(
    onList: GraphQLNullable<Bool>,
    sort: GraphQLNullable<[GraphQLEnum<RecommendationSort>?]>,
    page: GraphQLNullable<Int32>,
    perPage: GraphQLNullable<Int32>
  ) {
    self.onList = onList
    self.sort = sort
    self.page = page
    self.perPage = perPage
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "onList": onList,
    "sort": sort,
    "page": page,
    "perPage": perPage
  ] }

  nonisolated public struct Data: AniListAPI.SelectionSet {
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
      MediaRecommendationsQuery.Data.self
    ] }

    public var page: Page? { __data["Page"] }

    /// Page
    ///
    /// Parent Type: `Page`
    nonisolated public struct Page: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Page }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("recommendations", [Recommendation?]?.self, arguments: [
          "onList": .variable("onList"),
          "sort": .variable("sort")
        ]),
        .field("pageInfo", PageInfo?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        MediaRecommendationsQuery.Data.Page.self
      ] }

      public var recommendations: [Recommendation?]? { __data["recommendations"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

      /// Page.Recommendation
      ///
      /// Parent Type: `Recommendation`
      nonisolated public struct Recommendation: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Recommendation }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(CommonRecommendation.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          MediaRecommendationsQuery.Data.Page.Recommendation.self,
          CommonRecommendation.self
        ] }

        /// The id of the recommendation
        public var id: Int { __data["id"] }
        /// Users rating of the recommendation
        public var rating: Int? { __data["rating"] }
        /// The rating of the recommendation by currently authenticated user
        public var userRating: GraphQLEnum<AniListAPI.RecommendationRating>? { __data["userRating"] }
        /// The media the recommendation is from
        public var media: Media? { __data["media"] }
        /// The recommended media
        public var mediaRecommendation: MediaRecommendation? { __data["mediaRecommendation"] }

        public struct Fragments: FragmentContainer {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public var commonRecommendation: CommonRecommendation { _toFragment() }
        }

        public typealias Media = CommonRecommendation.Media

        public typealias MediaRecommendation = CommonRecommendation.MediaRecommendation
      }

      /// Page.PageInfo
      ///
      /// Parent Type: `PageInfo`
      nonisolated public struct PageInfo: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.PageInfo }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(CommonPage.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          MediaRecommendationsQuery.Data.Page.PageInfo.self,
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
