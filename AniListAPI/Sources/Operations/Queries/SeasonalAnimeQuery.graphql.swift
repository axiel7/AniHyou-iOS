// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct SeasonalAnimeQuery: GraphQLQuery {
  public static let operationName: String = "SeasonalAnime"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query SeasonalAnime($page: Int, $perPage: Int, $season: MediaSeason, $seasonYear: Int, $sort: [MediaSort]) { Page(page: $page, perPage: $perPage) { __typename media(season: $season, seasonYear: $seasonYear, sort: $sort) { __typename id title { __typename userPreferred } coverImage { __typename large } meanScore mediaListEntry { __typename status } nextAiringEpisode { __typename episode airingAt } genres } pageInfo { __typename hasNextPage } } }"#
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
      SeasonalAnimeQuery.Data.self
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
          "sort": .variable("sort")
        ]),
        .field("pageInfo", PageInfo?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        SeasonalAnimeQuery.Data.Page.self
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
          .field("id", Int.self),
          .field("title", Title?.self),
          .field("coverImage", CoverImage?.self),
          .field("meanScore", Int?.self),
          .field("mediaListEntry", MediaListEntry?.self),
          .field("nextAiringEpisode", NextAiringEpisode?.self),
          .field("genres", [String?]?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          SeasonalAnimeQuery.Data.Page.Medium.self
        ] }

        /// The id of the media
        public var id: Int { __data["id"] }
        /// The official titles of the media in various languages
        public var title: Title? { __data["title"] }
        /// The cover images of the media
        public var coverImage: CoverImage? { __data["coverImage"] }
        /// Mean score of all the user's scores of the media
        public var meanScore: Int? { __data["meanScore"] }
        /// The authenticated user's media list entry for the media
        public var mediaListEntry: MediaListEntry? { __data["mediaListEntry"] }
        /// The media's next episode airing schedule
        public var nextAiringEpisode: NextAiringEpisode? { __data["nextAiringEpisode"] }
        /// The genres of the media
        public var genres: [String?]? { __data["genres"] }

        /// Page.Medium.Title
        ///
        /// Parent Type: `MediaTitle`
        public struct Title: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaTitle }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("userPreferred", String?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            SeasonalAnimeQuery.Data.Page.Medium.Title.self
          ] }

          /// The currently authenticated users preferred title language. Default romaji for non-authenticated
          public var userPreferred: String? { __data["userPreferred"] }
        }

        /// Page.Medium.CoverImage
        ///
        /// Parent Type: `MediaCoverImage`
        public struct CoverImage: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaCoverImage }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("large", String?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            SeasonalAnimeQuery.Data.Page.Medium.CoverImage.self
          ] }

          /// The cover image url of the media at a large size
          public var large: String? { __data["large"] }
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
            .field("status", GraphQLEnum<AniListAPI.MediaListStatus>?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            SeasonalAnimeQuery.Data.Page.Medium.MediaListEntry.self
          ] }

          /// The watching/reading status
          public var status: GraphQLEnum<AniListAPI.MediaListStatus>? { __data["status"] }
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
            .field("episode", Int.self),
            .field("airingAt", Int.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            SeasonalAnimeQuery.Data.Page.Medium.NextAiringEpisode.self
          ] }

          /// The airing episode number
          public var episode: Int { __data["episode"] }
          /// The time the episode airs at
          public var airingAt: Int { __data["airingAt"] }
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
          .field("hasNextPage", Bool?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          SeasonalAnimeQuery.Data.Page.PageInfo.self
        ] }

        /// If there is another page
        public var hasNextPage: Bool? { __data["hasNextPage"] }
      }
    }
  }
}
