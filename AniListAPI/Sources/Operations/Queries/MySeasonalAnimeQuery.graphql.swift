// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct MySeasonalAnimeQuery: GraphQLQuery {
  public static let operationName: String = "MySeasonalAnime"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query MySeasonalAnime($page: Int, $perPage: Int, $season: MediaSeason, $seasonYear: Int, $sort: [MediaSort]) { Page(page: $page, perPage: $perPage) { __typename media(season: $season, seasonYear: $seasonYear, sort: $sort, onList: true) { __typename id mediaListEntry { __typename ...CommonMediaListEntry } } pageInfo { __typename ...CommonPage } } }"#,
      fragments: [AiringEpisode.self, BasicMediaDetails.self, BasicMediaListEntry.self, CommonMediaListEntry.self, CommonPage.self, FuzzyDateFragment.self]
    ))

  public var page: GraphQLNullable<Int32>
  public var perPage: GraphQLNullable<Int32>
  public var season: GraphQLNullable<GraphQLEnum<MediaSeason>>
  public var seasonYear: GraphQLNullable<Int32>
  public var sort: GraphQLNullable<[GraphQLEnum<MediaSort>?]>

  public init(
    page: GraphQLNullable<Int32>,
    perPage: GraphQLNullable<Int32>,
    season: GraphQLNullable<GraphQLEnum<MediaSeason>>,
    seasonYear: GraphQLNullable<Int32>,
    sort: GraphQLNullable<[GraphQLEnum<MediaSort>?]>
  ) {
    self.page = page
    self.perPage = perPage
    self.season = season
    self.seasonYear = seasonYear
    self.sort = sort
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "season": season,
    "seasonYear": seasonYear,
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
      MySeasonalAnimeQuery.Data.self
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
        .field("media", [Medium?]?.self, arguments: [
          "season": .variable("season"),
          "seasonYear": .variable("seasonYear"),
          "sort": .variable("sort"),
          "onList": true
        ]),
        .field("pageInfo", PageInfo?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        MySeasonalAnimeQuery.Data.Page.self
      ] }

      public var media: [Medium?]? { __data["media"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

      /// Page.Medium
      ///
      /// Parent Type: `Media`
      public struct Medium: AniListAPI.SelectionSet, Identifiable {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("mediaListEntry", MediaListEntry?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          MySeasonalAnimeQuery.Data.Page.Medium.self
        ] }

        /// The id of the media
        public var id: Int { __data["id"] }
        /// The authenticated user's media list entry for the media
        public var mediaListEntry: MediaListEntry? { __data["mediaListEntry"] }

        /// Page.Medium.MediaListEntry
        ///
        /// Parent Type: `MediaList`
        public struct MediaListEntry: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(CommonMediaListEntry.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            MySeasonalAnimeQuery.Data.Page.Medium.MediaListEntry.self,
            CommonMediaListEntry.self,
            BasicMediaListEntry.self
          ] }

          /// The id of the list entry
          public var id: Int { __data["id"] }
          /// The id of the media
          public var mediaId: Int { __data["mediaId"] }
          public var media: Media? { __data["media"] }
          /// The amount of episodes/chapters consumed by the user
          public var progress: Int? { __data["progress"] }
          /// The amount of volumes read by the user
          public var progressVolumes: Int? { __data["progressVolumes"] }
          /// The watching/reading status
          public var status: GraphQLEnum<AniListAPI.MediaListStatus>? { __data["status"] }
          /// The score of the entry
          public var score: Double? { __data["score"] }
          /// Map of advanced scores with name keys
          public var advancedScores: AniListAPI.Json? { __data["advancedScores"] }
          /// The amount of times the user has rewatched/read the media
          public var `repeat`: Int? { __data["repeat"] }
          /// If the entry should only be visible to authenticated user
          public var `private`: Bool? { __data["private"] }
          /// If the entry shown be hidden from non-custom lists
          public var hiddenFromStatusLists: Bool? { __data["hiddenFromStatusLists"] }
          /// When the entry was started by the user
          public var startedAt: StartedAt? { __data["startedAt"] }
          /// When the entry was completed by the user
          public var completedAt: CompletedAt? { __data["completedAt"] }
          /// Text notes
          public var notes: String? { __data["notes"] }
          /// Map of booleans for which custom lists the entry are in
          public var customLists: AniListAPI.Json? { __data["customLists"] }

          public struct Fragments: FragmentContainer {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            public var commonMediaListEntry: CommonMediaListEntry { _toFragment() }
            public var basicMediaListEntry: BasicMediaListEntry { _toFragment() }
          }

          public typealias Media = CommonMediaListEntry.Media

          public typealias StartedAt = BasicMediaListEntry.StartedAt

          public typealias CompletedAt = BasicMediaListEntry.CompletedAt
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
          MySeasonalAnimeQuery.Data.Page.PageInfo.self,
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
