// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct CommonRecommendation: AniListAPI.MutableSelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment CommonRecommendation on Recommendation { __typename id rating userRating media { __typename ...BasicMediaDetails mediaListEntry { __typename ...BasicMediaListEntry } coverImage { __typename large } startDate { __typename year } meanScore genres status(version: 2) format } mediaRecommendation { __typename ...BasicMediaDetails mediaListEntry { __typename ...BasicMediaListEntry } coverImage { __typename large } startDate { __typename year } meanScore genres status(version: 2) format } }"#
  }

  @_spi(Unsafe) public var __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Recommendation }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("rating", Int?.self),
    .field("userRating", GraphQLEnum<AniListAPI.RecommendationRating>?.self),
    .field("media", Media?.self),
    .field("mediaRecommendation", MediaRecommendation?.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    CommonRecommendation.self
  ] }

  /// The id of the recommendation
  public var id: Int {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }
  /// Users rating of the recommendation
  public var rating: Int? {
    get { __data["rating"] }
    set { __data["rating"] = newValue }
  }
  /// The rating of the recommendation by currently authenticated user
  public var userRating: GraphQLEnum<AniListAPI.RecommendationRating>? {
    get { __data["userRating"] }
    set { __data["userRating"] = newValue }
  }
  /// The media the recommendation is from
  public var media: Media? {
    get { __data["media"] }
    set { __data["media"] = newValue }
  }
  /// The recommended media
  public var mediaRecommendation: MediaRecommendation? {
    get { __data["mediaRecommendation"] }
    set { __data["mediaRecommendation"] = newValue }
  }

  public init(
    id: Int,
    rating: Int? = nil,
    userRating: GraphQLEnum<AniListAPI.RecommendationRating>? = nil,
    media: Media? = nil,
    mediaRecommendation: MediaRecommendation? = nil
  ) {
    self.init(unsafelyWithData: [
      "__typename": AniListAPI.Objects.Recommendation.typename,
      "id": id,
      "rating": rating,
      "userRating": userRating,
      "media": media._fieldData,
      "mediaRecommendation": mediaRecommendation._fieldData,
    ])
  }

  /// Media
  ///
  /// Parent Type: `Media`
  nonisolated public struct Media: AniListAPI.MutableSelectionSet, Identifiable {
    @_spi(Unsafe) public var __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("mediaListEntry", MediaListEntry?.self),
      .field("coverImage", CoverImage?.self),
      .field("startDate", StartDate?.self),
      .field("meanScore", Int?.self),
      .field("genres", [String?]?.self),
      .field("status", GraphQLEnum<AniListAPI.MediaStatus>?.self, arguments: ["version": 2]),
      .field("format", GraphQLEnum<AniListAPI.MediaFormat>?.self),
      .fragment(BasicMediaDetails.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      CommonRecommendation.Media.self,
      BasicMediaDetails.self
    ] }

    /// The authenticated user's media list entry for the media
    public var mediaListEntry: MediaListEntry? {
      get { __data["mediaListEntry"] }
      set { __data["mediaListEntry"] = newValue }
    }
    /// The cover images of the media
    public var coverImage: CoverImage? {
      get { __data["coverImage"] }
      set { __data["coverImage"] = newValue }
    }
    /// The first official release date of the media
    public var startDate: StartDate? {
      get { __data["startDate"] }
      set { __data["startDate"] = newValue }
    }
    /// Mean score of all the user's scores of the media
    public var meanScore: Int? {
      get { __data["meanScore"] }
      set { __data["meanScore"] = newValue }
    }
    /// The genres of the media
    public var genres: [String?]? {
      get { __data["genres"] }
      set { __data["genres"] = newValue }
    }
    /// The current releasing status of the media
    public var status: GraphQLEnum<AniListAPI.MediaStatus>? {
      get { __data["status"] }
      set { __data["status"] = newValue }
    }
    /// The format the media was released in
    public var format: GraphQLEnum<AniListAPI.MediaFormat>? {
      get { __data["format"] }
      set { __data["format"] = newValue }
    }
    /// The id of the media
    public var id: Int {
      get { __data["id"] }
      set { __data["id"] = newValue }
    }
    /// The official titles of the media in various languages
    public var title: Title? {
      get { __data["title"] }
      set { __data["title"] = newValue }
    }
    /// The amount of episodes the anime has when complete
    public var episodes: Int? {
      get { __data["episodes"] }
      set { __data["episodes"] = newValue }
    }
    /// The general length of each anime episode in minutes
    public var duration: Int? {
      get { __data["duration"] }
      set { __data["duration"] = newValue }
    }
    /// The amount of chapters the manga has when complete
    public var chapters: Int? {
      get { __data["chapters"] }
      set { __data["chapters"] = newValue }
    }
    /// The amount of volumes the manga has when complete
    public var volumes: Int? {
      get { __data["volumes"] }
      set { __data["volumes"] = newValue }
    }
    /// The type of the media; anime or manga
    public var type: GraphQLEnum<AniListAPI.MediaType>? {
      get { __data["type"] }
      set { __data["type"] = newValue }
    }
    /// If the media is intended only for 18+ adult audiences
    public var isAdult: Bool? {
      get { __data["isAdult"] }
      set { __data["isAdult"] = newValue }
    }

    public struct Fragments: FragmentContainer {
      @_spi(Unsafe) public var __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      public var basicMediaDetails: BasicMediaDetails {
        get { _toFragment() }
        _modify { var f = basicMediaDetails; yield &f; __data = f.__data }
      }
    }

    public init(
      mediaListEntry: MediaListEntry? = nil,
      coverImage: CoverImage? = nil,
      startDate: StartDate? = nil,
      meanScore: Int? = nil,
      genres: [String?]? = nil,
      status: GraphQLEnum<AniListAPI.MediaStatus>? = nil,
      format: GraphQLEnum<AniListAPI.MediaFormat>? = nil,
      id: Int,
      title: Title? = nil,
      episodes: Int? = nil,
      duration: Int? = nil,
      chapters: Int? = nil,
      volumes: Int? = nil,
      type: GraphQLEnum<AniListAPI.MediaType>? = nil,
      isAdult: Bool? = nil
    ) {
      self.init(unsafelyWithData: [
        "__typename": AniListAPI.Objects.Media.typename,
        "mediaListEntry": mediaListEntry._fieldData,
        "coverImage": coverImage._fieldData,
        "startDate": startDate._fieldData,
        "meanScore": meanScore,
        "genres": genres,
        "status": status,
        "format": format,
        "id": id,
        "title": title._fieldData,
        "episodes": episodes,
        "duration": duration,
        "chapters": chapters,
        "volumes": volumes,
        "type": type,
        "isAdult": isAdult,
      ])
    }

    /// Media.MediaListEntry
    ///
    /// Parent Type: `MediaList`
    nonisolated public struct MediaListEntry: AniListAPI.MutableSelectionSet {
      @_spi(Unsafe) public var __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(BasicMediaListEntry.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        CommonRecommendation.Media.MediaListEntry.self,
        BasicMediaListEntry.self
      ] }

      /// The id of the list entry
      public var id: Int {
        get { __data["id"] }
        set { __data["id"] = newValue }
      }
      /// The id of the media
      public var mediaId: Int {
        get { __data["mediaId"] }
        set { __data["mediaId"] = newValue }
      }
      /// The amount of episodes/chapters consumed by the user
      public var progress: Int? {
        get { __data["progress"] }
        set { __data["progress"] = newValue }
      }
      /// The amount of volumes read by the user
      public var progressVolumes: Int? {
        get { __data["progressVolumes"] }
        set { __data["progressVolumes"] = newValue }
      }
      /// The watching/reading status
      public var status: GraphQLEnum<AniListAPI.MediaListStatus>? {
        get { __data["status"] }
        set { __data["status"] = newValue }
      }
      /// The score of the entry
      public var score: Double? {
        get { __data["score"] }
        set { __data["score"] = newValue }
      }
      /// Map of advanced scores with name keys
      public var advancedScores: AniListAPI.Json? {
        get { __data["advancedScores"] }
        set { __data["advancedScores"] = newValue }
      }
      /// The amount of times the user has rewatched/read the media
      public var `repeat`: Int? {
        get { __data["repeat"] }
        set { __data["repeat"] = newValue }
      }
      /// If the entry should only be visible to authenticated user
      public var `private`: Bool? {
        get { __data["private"] }
        set { __data["private"] = newValue }
      }
      /// If the entry shown be hidden from non-custom lists
      public var hiddenFromStatusLists: Bool? {
        get { __data["hiddenFromStatusLists"] }
        set { __data["hiddenFromStatusLists"] = newValue }
      }
      /// Priority of planning
      public var priority: Int? {
        get { __data["priority"] }
        set { __data["priority"] = newValue }
      }
      /// When the entry was started by the user
      public var startedAt: StartedAt? {
        get { __data["startedAt"] }
        set { __data["startedAt"] = newValue }
      }
      /// When the entry was completed by the user
      public var completedAt: CompletedAt? {
        get { __data["completedAt"] }
        set { __data["completedAt"] = newValue }
      }
      /// Text notes
      public var notes: String? {
        get { __data["notes"] }
        set { __data["notes"] = newValue }
      }
      /// Map of booleans for which custom lists the entry are in
      public var customLists: AniListAPI.Json? {
        get { __data["customLists"] }
        set { __data["customLists"] = newValue }
      }

      public struct Fragments: FragmentContainer {
        @_spi(Unsafe) public var __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public var basicMediaListEntry: BasicMediaListEntry {
          get { _toFragment() }
          _modify { var f = basicMediaListEntry; yield &f; __data = f.__data }
        }
      }

      public init(
        id: Int,
        mediaId: Int,
        progress: Int? = nil,
        progressVolumes: Int? = nil,
        status: GraphQLEnum<AniListAPI.MediaListStatus>? = nil,
        score: Double? = nil,
        advancedScores: AniListAPI.Json? = nil,
        `repeat` _repeat: Int? = nil,
        `private` _private: Bool? = nil,
        hiddenFromStatusLists: Bool? = nil,
        priority: Int? = nil,
        startedAt: StartedAt? = nil,
        completedAt: CompletedAt? = nil,
        notes: String? = nil,
        customLists: AniListAPI.Json? = nil
      ) {
        self.init(unsafelyWithData: [
          "__typename": AniListAPI.Objects.MediaList.typename,
          "id": id,
          "mediaId": mediaId,
          "progress": progress,
          "progressVolumes": progressVolumes,
          "status": status,
          "score": score,
          "advancedScores": advancedScores,
          "repeat": _repeat,
          "private": _private,
          "hiddenFromStatusLists": hiddenFromStatusLists,
          "priority": priority,
          "startedAt": startedAt._fieldData,
          "completedAt": completedAt._fieldData,
          "notes": notes,
          "customLists": customLists,
        ])
      }

      public typealias StartedAt = BasicMediaListEntry.StartedAt

      public typealias CompletedAt = BasicMediaListEntry.CompletedAt
    }

    /// Media.CoverImage
    ///
    /// Parent Type: `MediaCoverImage`
    nonisolated public struct CoverImage: AniListAPI.MutableSelectionSet {
      @_spi(Unsafe) public var __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaCoverImage }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("large", String?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        CommonRecommendation.Media.CoverImage.self
      ] }

      /// The cover image url of the media at a large size
      public var large: String? {
        get { __data["large"] }
        set { __data["large"] = newValue }
      }

      public init(
        large: String? = nil
      ) {
        self.init(unsafelyWithData: [
          "__typename": AniListAPI.Objects.MediaCoverImage.typename,
          "large": large,
        ])
      }
    }

    /// Media.StartDate
    ///
    /// Parent Type: `FuzzyDate`
    nonisolated public struct StartDate: AniListAPI.MutableSelectionSet {
      @_spi(Unsafe) public var __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("year", Int?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        CommonRecommendation.Media.StartDate.self
      ] }

      /// Numeric Year (2017)
      public var year: Int? {
        get { __data["year"] }
        set { __data["year"] = newValue }
      }

      public init(
        year: Int? = nil
      ) {
        self.init(unsafelyWithData: [
          "__typename": AniListAPI.Objects.FuzzyDate.typename,
          "year": year,
        ])
      }
    }

    public typealias Title = BasicMediaDetails.Title
  }

  /// MediaRecommendation
  ///
  /// Parent Type: `Media`
  nonisolated public struct MediaRecommendation: AniListAPI.MutableSelectionSet, Identifiable {
    @_spi(Unsafe) public var __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("mediaListEntry", MediaListEntry?.self),
      .field("coverImage", CoverImage?.self),
      .field("startDate", StartDate?.self),
      .field("meanScore", Int?.self),
      .field("genres", [String?]?.self),
      .field("status", GraphQLEnum<AniListAPI.MediaStatus>?.self, arguments: ["version": 2]),
      .field("format", GraphQLEnum<AniListAPI.MediaFormat>?.self),
      .fragment(BasicMediaDetails.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      CommonRecommendation.MediaRecommendation.self,
      BasicMediaDetails.self
    ] }

    /// The authenticated user's media list entry for the media
    public var mediaListEntry: MediaListEntry? {
      get { __data["mediaListEntry"] }
      set { __data["mediaListEntry"] = newValue }
    }
    /// The cover images of the media
    public var coverImage: CoverImage? {
      get { __data["coverImage"] }
      set { __data["coverImage"] = newValue }
    }
    /// The first official release date of the media
    public var startDate: StartDate? {
      get { __data["startDate"] }
      set { __data["startDate"] = newValue }
    }
    /// Mean score of all the user's scores of the media
    public var meanScore: Int? {
      get { __data["meanScore"] }
      set { __data["meanScore"] = newValue }
    }
    /// The genres of the media
    public var genres: [String?]? {
      get { __data["genres"] }
      set { __data["genres"] = newValue }
    }
    /// The current releasing status of the media
    public var status: GraphQLEnum<AniListAPI.MediaStatus>? {
      get { __data["status"] }
      set { __data["status"] = newValue }
    }
    /// The format the media was released in
    public var format: GraphQLEnum<AniListAPI.MediaFormat>? {
      get { __data["format"] }
      set { __data["format"] = newValue }
    }
    /// The id of the media
    public var id: Int {
      get { __data["id"] }
      set { __data["id"] = newValue }
    }
    /// The official titles of the media in various languages
    public var title: Title? {
      get { __data["title"] }
      set { __data["title"] = newValue }
    }
    /// The amount of episodes the anime has when complete
    public var episodes: Int? {
      get { __data["episodes"] }
      set { __data["episodes"] = newValue }
    }
    /// The general length of each anime episode in minutes
    public var duration: Int? {
      get { __data["duration"] }
      set { __data["duration"] = newValue }
    }
    /// The amount of chapters the manga has when complete
    public var chapters: Int? {
      get { __data["chapters"] }
      set { __data["chapters"] = newValue }
    }
    /// The amount of volumes the manga has when complete
    public var volumes: Int? {
      get { __data["volumes"] }
      set { __data["volumes"] = newValue }
    }
    /// The type of the media; anime or manga
    public var type: GraphQLEnum<AniListAPI.MediaType>? {
      get { __data["type"] }
      set { __data["type"] = newValue }
    }
    /// If the media is intended only for 18+ adult audiences
    public var isAdult: Bool? {
      get { __data["isAdult"] }
      set { __data["isAdult"] = newValue }
    }

    public struct Fragments: FragmentContainer {
      @_spi(Unsafe) public var __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      public var basicMediaDetails: BasicMediaDetails {
        get { _toFragment() }
        _modify { var f = basicMediaDetails; yield &f; __data = f.__data }
      }
    }

    public init(
      mediaListEntry: MediaListEntry? = nil,
      coverImage: CoverImage? = nil,
      startDate: StartDate? = nil,
      meanScore: Int? = nil,
      genres: [String?]? = nil,
      status: GraphQLEnum<AniListAPI.MediaStatus>? = nil,
      format: GraphQLEnum<AniListAPI.MediaFormat>? = nil,
      id: Int,
      title: Title? = nil,
      episodes: Int? = nil,
      duration: Int? = nil,
      chapters: Int? = nil,
      volumes: Int? = nil,
      type: GraphQLEnum<AniListAPI.MediaType>? = nil,
      isAdult: Bool? = nil
    ) {
      self.init(unsafelyWithData: [
        "__typename": AniListAPI.Objects.Media.typename,
        "mediaListEntry": mediaListEntry._fieldData,
        "coverImage": coverImage._fieldData,
        "startDate": startDate._fieldData,
        "meanScore": meanScore,
        "genres": genres,
        "status": status,
        "format": format,
        "id": id,
        "title": title._fieldData,
        "episodes": episodes,
        "duration": duration,
        "chapters": chapters,
        "volumes": volumes,
        "type": type,
        "isAdult": isAdult,
      ])
    }

    /// MediaRecommendation.MediaListEntry
    ///
    /// Parent Type: `MediaList`
    nonisolated public struct MediaListEntry: AniListAPI.MutableSelectionSet {
      @_spi(Unsafe) public var __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(BasicMediaListEntry.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        CommonRecommendation.MediaRecommendation.MediaListEntry.self,
        BasicMediaListEntry.self
      ] }

      /// The id of the list entry
      public var id: Int {
        get { __data["id"] }
        set { __data["id"] = newValue }
      }
      /// The id of the media
      public var mediaId: Int {
        get { __data["mediaId"] }
        set { __data["mediaId"] = newValue }
      }
      /// The amount of episodes/chapters consumed by the user
      public var progress: Int? {
        get { __data["progress"] }
        set { __data["progress"] = newValue }
      }
      /// The amount of volumes read by the user
      public var progressVolumes: Int? {
        get { __data["progressVolumes"] }
        set { __data["progressVolumes"] = newValue }
      }
      /// The watching/reading status
      public var status: GraphQLEnum<AniListAPI.MediaListStatus>? {
        get { __data["status"] }
        set { __data["status"] = newValue }
      }
      /// The score of the entry
      public var score: Double? {
        get { __data["score"] }
        set { __data["score"] = newValue }
      }
      /// Map of advanced scores with name keys
      public var advancedScores: AniListAPI.Json? {
        get { __data["advancedScores"] }
        set { __data["advancedScores"] = newValue }
      }
      /// The amount of times the user has rewatched/read the media
      public var `repeat`: Int? {
        get { __data["repeat"] }
        set { __data["repeat"] = newValue }
      }
      /// If the entry should only be visible to authenticated user
      public var `private`: Bool? {
        get { __data["private"] }
        set { __data["private"] = newValue }
      }
      /// If the entry shown be hidden from non-custom lists
      public var hiddenFromStatusLists: Bool? {
        get { __data["hiddenFromStatusLists"] }
        set { __data["hiddenFromStatusLists"] = newValue }
      }
      /// Priority of planning
      public var priority: Int? {
        get { __data["priority"] }
        set { __data["priority"] = newValue }
      }
      /// When the entry was started by the user
      public var startedAt: StartedAt? {
        get { __data["startedAt"] }
        set { __data["startedAt"] = newValue }
      }
      /// When the entry was completed by the user
      public var completedAt: CompletedAt? {
        get { __data["completedAt"] }
        set { __data["completedAt"] = newValue }
      }
      /// Text notes
      public var notes: String? {
        get { __data["notes"] }
        set { __data["notes"] = newValue }
      }
      /// Map of booleans for which custom lists the entry are in
      public var customLists: AniListAPI.Json? {
        get { __data["customLists"] }
        set { __data["customLists"] = newValue }
      }

      public struct Fragments: FragmentContainer {
        @_spi(Unsafe) public var __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public var basicMediaListEntry: BasicMediaListEntry {
          get { _toFragment() }
          _modify { var f = basicMediaListEntry; yield &f; __data = f.__data }
        }
      }

      public init(
        id: Int,
        mediaId: Int,
        progress: Int? = nil,
        progressVolumes: Int? = nil,
        status: GraphQLEnum<AniListAPI.MediaListStatus>? = nil,
        score: Double? = nil,
        advancedScores: AniListAPI.Json? = nil,
        `repeat` _repeat: Int? = nil,
        `private` _private: Bool? = nil,
        hiddenFromStatusLists: Bool? = nil,
        priority: Int? = nil,
        startedAt: StartedAt? = nil,
        completedAt: CompletedAt? = nil,
        notes: String? = nil,
        customLists: AniListAPI.Json? = nil
      ) {
        self.init(unsafelyWithData: [
          "__typename": AniListAPI.Objects.MediaList.typename,
          "id": id,
          "mediaId": mediaId,
          "progress": progress,
          "progressVolumes": progressVolumes,
          "status": status,
          "score": score,
          "advancedScores": advancedScores,
          "repeat": _repeat,
          "private": _private,
          "hiddenFromStatusLists": hiddenFromStatusLists,
          "priority": priority,
          "startedAt": startedAt._fieldData,
          "completedAt": completedAt._fieldData,
          "notes": notes,
          "customLists": customLists,
        ])
      }

      public typealias StartedAt = BasicMediaListEntry.StartedAt

      public typealias CompletedAt = BasicMediaListEntry.CompletedAt
    }

    /// MediaRecommendation.CoverImage
    ///
    /// Parent Type: `MediaCoverImage`
    nonisolated public struct CoverImage: AniListAPI.MutableSelectionSet {
      @_spi(Unsafe) public var __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaCoverImage }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("large", String?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        CommonRecommendation.MediaRecommendation.CoverImage.self
      ] }

      /// The cover image url of the media at a large size
      public var large: String? {
        get { __data["large"] }
        set { __data["large"] = newValue }
      }

      public init(
        large: String? = nil
      ) {
        self.init(unsafelyWithData: [
          "__typename": AniListAPI.Objects.MediaCoverImage.typename,
          "large": large,
        ])
      }
    }

    /// MediaRecommendation.StartDate
    ///
    /// Parent Type: `FuzzyDate`
    nonisolated public struct StartDate: AniListAPI.MutableSelectionSet {
      @_spi(Unsafe) public var __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("year", Int?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        CommonRecommendation.MediaRecommendation.StartDate.self
      ] }

      /// Numeric Year (2017)
      public var year: Int? {
        get { __data["year"] }
        set { __data["year"] = newValue }
      }

      public init(
        year: Int? = nil
      ) {
        self.init(unsafelyWithData: [
          "__typename": AniListAPI.Objects.FuzzyDate.typename,
          "year": year,
        ])
      }
    }

    public typealias Title = BasicMediaDetails.Title
  }
}
