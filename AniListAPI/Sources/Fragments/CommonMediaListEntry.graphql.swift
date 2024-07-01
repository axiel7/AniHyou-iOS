// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct CommonMediaListEntry: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment CommonMediaListEntry on MediaList { __typename ...BasicMediaListEntry id mediaId media { __typename ...BasicMediaDetails coverImage { __typename large } nextAiringEpisode { __typename ...AiringEpisode } status } }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("mediaId", Int.self),
    .field("media", Media?.self),
    .fragment(BasicMediaListEntry.self),
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
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public var basicMediaListEntry: BasicMediaListEntry { _toFragment() }
  }

  /// Media
  ///
  /// Parent Type: `Media`
  public struct Media: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("coverImage", CoverImage?.self),
      .field("nextAiringEpisode", NextAiringEpisode?.self),
      .field("status", GraphQLEnum<AniListAPI.MediaStatus>?.self),
      .fragment(BasicMediaDetails.self),
    ] }

    /// The cover images of the media
    public var coverImage: CoverImage? { __data["coverImage"] }
    /// The media's next episode airing schedule
    public var nextAiringEpisode: NextAiringEpisode? { __data["nextAiringEpisode"] }
    /// The current releasing status of the media
    public var status: GraphQLEnum<AniListAPI.MediaStatus>? { __data["status"] }
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

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var basicMediaDetails: BasicMediaDetails { _toFragment() }
    }

    /// Media.CoverImage
    ///
    /// Parent Type: `MediaCoverImage`
    public struct CoverImage: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaCoverImage }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("large", String?.self),
      ] }

      /// The cover image url of the media at a large size
      public var large: String? { __data["large"] }
    }

    /// Media.NextAiringEpisode
    ///
    /// Parent Type: `AiringSchedule`
    public struct NextAiringEpisode: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.AiringSchedule }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(AiringEpisode.self),
      ] }

      /// The airing episode number
      public var episode: Int { __data["episode"] }
      /// The time the episode airs at
      public var airingAt: Int { __data["airingAt"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var airingEpisode: AiringEpisode { _toFragment() }
      }
    }

    public typealias Title = BasicMediaDetails.Title
  }

  /// StartedAt
  ///
  /// Parent Type: `FuzzyDate`
  public struct StartedAt: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }

    /// Numeric Day (24)
    public var day: Int? { __data["day"] }
    /// Numeric Month (3)
    public var month: Int? { __data["month"] }
    /// Numeric Year (2017)
    public var year: Int? { __data["year"] }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var fuzzyDateFragment: FuzzyDateFragment { _toFragment() }
    }
  }

  /// CompletedAt
  ///
  /// Parent Type: `FuzzyDate`
  public struct CompletedAt: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }

    /// Numeric Day (24)
    public var day: Int? { __data["day"] }
    /// Numeric Month (3)
    public var month: Int? { __data["month"] }
    /// Numeric Year (2017)
    public var year: Int? { __data["year"] }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var fuzzyDateFragment: FuzzyDateFragment { _toFragment() }
    }
  }
}
