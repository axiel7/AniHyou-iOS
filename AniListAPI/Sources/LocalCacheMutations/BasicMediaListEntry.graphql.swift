// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct BasicMediaListEntry: AniListAPI.MutableSelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment BasicMediaListEntry on MediaList {
      __typename
      id
      mediaId
      status
      score
      progress
      progressVolumes
      repeat
      private
      startedAt {
        __typename
        ...FuzzyDateFragment
      }
      completedAt {
        __typename
        ...FuzzyDateFragment
      }
      notes
    }
    """ }

  public var __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("mediaId", Int.self),
    .field("status", GraphQLEnum<AniListAPI.MediaListStatus>?.self),
    .field("score", Double?.self),
    .field("progress", Int?.self),
    .field("progressVolumes", Int?.self),
    .field("repeat", Int?.self),
    .field("private", Bool?.self),
    .field("startedAt", StartedAt?.self),
    .field("completedAt", CompletedAt?.self),
    .field("notes", String?.self),
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

  public init(
    id: Int,
    mediaId: Int,
    status: GraphQLEnum<AniListAPI.MediaListStatus>? = nil,
    score: Double? = nil,
    progress: Int? = nil,
    progressVolumes: Int? = nil,
    `repeat`: Int? = nil,
    `private`: Bool? = nil,
    startedAt: StartedAt? = nil,
    completedAt: CompletedAt? = nil,
    notes: String? = nil
  ) {
    self.init(_dataDict: DataDict(
      data: [
        "__typename": AniListAPI.Objects.MediaList.typename,
        "id": id,
        "mediaId": mediaId,
        "status": status,
        "score": score,
        "progress": progress,
        "progressVolumes": progressVolumes,
        "repeat": `repeat`,
        "private": `private`,
        "startedAt": startedAt._fieldData,
        "completedAt": completedAt._fieldData,
        "notes": notes,
      ],
      fulfilledFragments: [
        ObjectIdentifier(BasicMediaListEntry.self)
      ]
    ))
  }

  /// StartedAt
  ///
  /// Parent Type: `FuzzyDate`
  public struct StartedAt: AniListAPI.MutableSelectionSet {
    public var __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .fragment(FuzzyDateFragment.self),
    ] }

    /// Numeric Day (24)
    public var day: Int? {
      get { __data["day"] }
      set { __data["day"] = newValue }
    }
    /// Numeric Month (3)
    public var month: Int? {
      get { __data["month"] }
      set { __data["month"] = newValue }
    }
    /// Numeric Year (2017)
    public var year: Int? {
      get { __data["year"] }
      set { __data["year"] = newValue }
    }

    public struct Fragments: FragmentContainer {
      public var __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var fuzzyDateFragment: FuzzyDateFragment {
        get { _toFragment() }
        _modify { var f = fuzzyDateFragment; yield &f; __data = f.__data }
        @available(*, unavailable, message: "mutate properties of the fragment instead.")
        set { preconditionFailure() }
      }
    }

    public init(
      day: Int? = nil,
      month: Int? = nil,
      year: Int? = nil
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": AniListAPI.Objects.FuzzyDate.typename,
          "day": day,
          "month": month,
          "year": year,
        ],
        fulfilledFragments: [
          ObjectIdentifier(BasicMediaListEntry.StartedAt.self),
          ObjectIdentifier(FuzzyDateFragment.self)
        ]
      ))
    }
  }

  /// CompletedAt
  ///
  /// Parent Type: `FuzzyDate`
  public struct CompletedAt: AniListAPI.MutableSelectionSet {
    public var __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .fragment(FuzzyDateFragment.self),
    ] }

    /// Numeric Day (24)
    public var day: Int? {
      get { __data["day"] }
      set { __data["day"] = newValue }
    }
    /// Numeric Month (3)
    public var month: Int? {
      get { __data["month"] }
      set { __data["month"] = newValue }
    }
    /// Numeric Year (2017)
    public var year: Int? {
      get { __data["year"] }
      set { __data["year"] = newValue }
    }

    public struct Fragments: FragmentContainer {
      public var __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var fuzzyDateFragment: FuzzyDateFragment {
        get { _toFragment() }
        _modify { var f = fuzzyDateFragment; yield &f; __data = f.__data }
        @available(*, unavailable, message: "mutate properties of the fragment instead.")
        set { preconditionFailure() }
      }
    }

    public init(
      day: Int? = nil,
      month: Int? = nil,
      year: Int? = nil
    ) {
      self.init(_dataDict: DataDict(
        data: [
          "__typename": AniListAPI.Objects.FuzzyDate.typename,
          "day": day,
          "month": month,
          "year": year,
        ],
        fulfilledFragments: [
          ObjectIdentifier(BasicMediaListEntry.CompletedAt.self),
          ObjectIdentifier(FuzzyDateFragment.self)
        ]
      ))
    }
  }
}
