// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct SearchMediaQuery: GraphQLQuery {
  public static let operationName: String = "SearchMedia"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query SearchMedia($page: Int, $perPage: Int, $search: String, $type: MediaType, $sort: [MediaSort], $genre_in: [String], $genre_not_in: [String], $tag_in: [String], $tag_not_in: [String], $format_in: [MediaFormat], $status_in: [MediaStatus], $season: MediaSeason, $startDateGreater: FuzzyDateInt, $startDateLesser: FuzzyDateInt, $onList: Boolean, $isLicensed: Boolean, $isAdult: Boolean, $country: CountryCode) { Page(page: $page, perPage: $perPage) { __typename media( search: $search type: $type sort: $sort genre_in: $genre_in genre_not_in: $genre_not_in tag_in: $tag_in tag_not_in: $tag_not_in format_in: $format_in status_in: $status_in season: $season startDate_greater: $startDateGreater startDate_lesser: $startDateLesser onList: $onList isLicensed: $isLicensed isAdult: $isAdult countryOfOrigin: $country ) { __typename ...BasicMediaDetails meanScore format mediaListEntry { __typename ...BasicMediaListEntry } startDate { __typename year } nextAiringEpisode { __typename ...AiringEpisode } } pageInfo { __typename ...CommonPage } } }"#,
      fragments: [AiringEpisode.self, BasicMediaDetails.self, BasicMediaListEntry.self, CommonPage.self, FuzzyDateFragment.self]
    ))

  public var page: GraphQLNullable<Int32>
  public var perPage: GraphQLNullable<Int32>
  public var search: GraphQLNullable<String>
  public var type: GraphQLNullable<GraphQLEnum<MediaType>>
  public var sort: GraphQLNullable<[GraphQLEnum<MediaSort>?]>
  public var genre_in: GraphQLNullable<[String?]>
  public var genre_not_in: GraphQLNullable<[String?]>
  public var tag_in: GraphQLNullable<[String?]>
  public var tag_not_in: GraphQLNullable<[String?]>
  public var format_in: GraphQLNullable<[GraphQLEnum<MediaFormat>?]>
  public var status_in: GraphQLNullable<[GraphQLEnum<MediaStatus>?]>
  public var season: GraphQLNullable<GraphQLEnum<MediaSeason>>
  public var startDateGreater: GraphQLNullable<FuzzyDateInt>
  public var startDateLesser: GraphQLNullable<FuzzyDateInt>
  public var onList: GraphQLNullable<Bool>
  public var isLicensed: GraphQLNullable<Bool>
  public var isAdult: GraphQLNullable<Bool>
  public var country: GraphQLNullable<CountryCode>

  public init(
    page: GraphQLNullable<Int32>,
    perPage: GraphQLNullable<Int32>,
    search: GraphQLNullable<String>,
    type: GraphQLNullable<GraphQLEnum<MediaType>>,
    sort: GraphQLNullable<[GraphQLEnum<MediaSort>?]>,
    genre_in: GraphQLNullable<[String?]>,
    genre_not_in: GraphQLNullable<[String?]>,
    tag_in: GraphQLNullable<[String?]>,
    tag_not_in: GraphQLNullable<[String?]>,
    format_in: GraphQLNullable<[GraphQLEnum<MediaFormat>?]>,
    status_in: GraphQLNullable<[GraphQLEnum<MediaStatus>?]>,
    season: GraphQLNullable<GraphQLEnum<MediaSeason>>,
    startDateGreater: GraphQLNullable<FuzzyDateInt>,
    startDateLesser: GraphQLNullable<FuzzyDateInt>,
    onList: GraphQLNullable<Bool>,
    isLicensed: GraphQLNullable<Bool>,
    isAdult: GraphQLNullable<Bool>,
    country: GraphQLNullable<CountryCode>
  ) {
    self.page = page
    self.perPage = perPage
    self.search = search
    self.type = type
    self.sort = sort
    self.genre_in = genre_in
    self.genre_not_in = genre_not_in
    self.tag_in = tag_in
    self.tag_not_in = tag_not_in
    self.format_in = format_in
    self.status_in = status_in
    self.season = season
    self.startDateGreater = startDateGreater
    self.startDateLesser = startDateLesser
    self.onList = onList
    self.isLicensed = isLicensed
    self.isAdult = isAdult
    self.country = country
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "search": search,
    "type": type,
    "sort": sort,
    "genre_in": genre_in,
    "genre_not_in": genre_not_in,
    "tag_in": tag_in,
    "tag_not_in": tag_not_in,
    "format_in": format_in,
    "status_in": status_in,
    "season": season,
    "startDateGreater": startDateGreater,
    "startDateLesser": startDateLesser,
    "onList": onList,
    "isLicensed": isLicensed,
    "isAdult": isAdult,
    "country": country
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
      SearchMediaQuery.Data.self
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
          "search": .variable("search"),
          "type": .variable("type"),
          "sort": .variable("sort"),
          "genre_in": .variable("genre_in"),
          "genre_not_in": .variable("genre_not_in"),
          "tag_in": .variable("tag_in"),
          "tag_not_in": .variable("tag_not_in"),
          "format_in": .variable("format_in"),
          "status_in": .variable("status_in"),
          "season": .variable("season"),
          "startDate_greater": .variable("startDateGreater"),
          "startDate_lesser": .variable("startDateLesser"),
          "onList": .variable("onList"),
          "isLicensed": .variable("isLicensed"),
          "isAdult": .variable("isAdult"),
          "countryOfOrigin": .variable("country")
        ]),
        .field("pageInfo", PageInfo?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        SearchMediaQuery.Data.Page.self
      ] }

      public var media: [Medium?]? { __data["media"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

      /// Page.Medium
      ///
      /// Parent Type: `Media`
      public struct Medium: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("meanScore", Int?.self),
          .field("format", GraphQLEnum<AniListAPI.MediaFormat>?.self),
          .field("mediaListEntry", MediaListEntry?.self),
          .field("startDate", StartDate?.self),
          .field("nextAiringEpisode", NextAiringEpisode?.self),
          .fragment(BasicMediaDetails.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          SearchMediaQuery.Data.Page.Medium.self,
          BasicMediaDetails.self
        ] }

        /// Mean score of all the user's scores of the media
        public var meanScore: Int? { __data["meanScore"] }
        /// The format the media was released in
        public var format: GraphQLEnum<AniListAPI.MediaFormat>? { __data["format"] }
        /// The authenticated user's media list entry for the media
        public var mediaListEntry: MediaListEntry? { __data["mediaListEntry"] }
        /// The first official release date of the media
        public var startDate: StartDate? { __data["startDate"] }
        /// The media's next episode airing schedule
        public var nextAiringEpisode: NextAiringEpisode? { __data["nextAiringEpisode"] }
        /// The id of the media
        public var id: Int { __data["id"] }
        /// The official titles of the media in various languages
        public var title: Title? { __data["title"] }
        /// The amount of episodes the anime has when complete
        public var episodes: Int? { __data["episodes"] }
        /// The amount of chapters the manga has when complete
        public var chapters: Int? { __data["chapters"] }
        /// The amount of volumes the manga has when complete
        public var volumes: Int? { __data["volumes"] }
        /// The type of the media; anime or manga
        public var type: GraphQLEnum<AniListAPI.MediaType>? { __data["type"] }
        /// The cover images of the media
        public var coverImage: CoverImage? { __data["coverImage"] }

        public struct Fragments: FragmentContainer {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public var basicMediaDetails: BasicMediaDetails { _toFragment() }
        }

        /// Page.Medium.MediaListEntry
        ///
        /// Parent Type: `MediaList`
        public struct MediaListEntry: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(BasicMediaListEntry.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            SearchMediaQuery.Data.Page.Medium.MediaListEntry.self,
            BasicMediaListEntry.self
          ] }

          /// The id of the list entry
          public var id: Int { __data["id"] }
          /// The id of the media
          public var mediaId: Int { __data["mediaId"] }
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

            public var basicMediaListEntry: BasicMediaListEntry { _toFragment() }
          }

          public typealias StartedAt = BasicMediaListEntry.StartedAt

          public typealias CompletedAt = BasicMediaListEntry.CompletedAt
        }

        /// Page.Medium.StartDate
        ///
        /// Parent Type: `FuzzyDate`
        public struct StartDate: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("year", Int?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            SearchMediaQuery.Data.Page.Medium.StartDate.self
          ] }

          /// Numeric Year (2017)
          public var year: Int? { __data["year"] }
        }

        /// Page.Medium.NextAiringEpisode
        ///
        /// Parent Type: `AiringSchedule`
        public struct NextAiringEpisode: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.AiringSchedule }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(AiringEpisode.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            SearchMediaQuery.Data.Page.Medium.NextAiringEpisode.self,
            AiringEpisode.self
          ] }

          /// The airing episode number
          public var episode: Int { __data["episode"] }
          /// The time the episode airs at
          public var airingAt: Int { __data["airingAt"] }

          public struct Fragments: FragmentContainer {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            public var airingEpisode: AiringEpisode { _toFragment() }
          }
        }

        public typealias Title = BasicMediaDetails.Title

        public typealias CoverImage = BasicMediaDetails.CoverImage
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
          SearchMediaQuery.Data.Page.PageInfo.self,
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
