// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct BasicMediaDetails: AniListAPI.MutableSelectionSet, Fragment, Identifiable {
  public static var fragmentDefinition: StaticString {
    #"fragment BasicMediaDetails on Media { __typename id title { __typename userPreferred } episodes duration chapters volumes type coverImage { __typename large } isAdult }"#
  }

  @_spi(Unsafe) public var __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("title", Title?.self),
    .field("episodes", Int?.self),
    .field("duration", Int?.self),
    .field("chapters", Int?.self),
    .field("volumes", Int?.self),
    .field("type", GraphQLEnum<AniListAPI.MediaType>?.self),
    .field("coverImage", CoverImage?.self),
    .field("isAdult", Bool?.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    BasicMediaDetails.self
  ] }

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
  /// The cover images of the media
  public var coverImage: CoverImage? {
    get { __data["coverImage"] }
    set { __data["coverImage"] = newValue }
  }
  /// If the media is intended only for 18+ adult audiences
  public var isAdult: Bool? {
    get { __data["isAdult"] }
    set { __data["isAdult"] = newValue }
  }

  public init(
    id: Int,
    title: Title? = nil,
    episodes: Int? = nil,
    duration: Int? = nil,
    chapters: Int? = nil,
    volumes: Int? = nil,
    type: GraphQLEnum<AniListAPI.MediaType>? = nil,
    coverImage: CoverImage? = nil,
    isAdult: Bool? = nil
  ) {
    self.init(unsafelyWithData: [
      "__typename": AniListAPI.Objects.Media.typename,
      "id": id,
      "title": title._fieldData,
      "episodes": episodes,
      "duration": duration,
      "chapters": chapters,
      "volumes": volumes,
      "type": type,
      "coverImage": coverImage._fieldData,
      "isAdult": isAdult,
    ])
  }

  /// Title
  ///
  /// Parent Type: `MediaTitle`
  nonisolated public struct Title: AniListAPI.MutableSelectionSet {
    @_spi(Unsafe) public var __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaTitle }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("userPreferred", String?.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      BasicMediaDetails.Title.self
    ] }

    /// The currently authenticated users preferred title language. Default romaji for non-authenticated
    public var userPreferred: String? {
      get { __data["userPreferred"] }
      set { __data["userPreferred"] = newValue }
    }

    public init(
      userPreferred: String? = nil
    ) {
      self.init(unsafelyWithData: [
        "__typename": AniListAPI.Objects.MediaTitle.typename,
        "userPreferred": userPreferred,
      ])
    }
  }

  /// CoverImage
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
      BasicMediaDetails.CoverImage.self
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
}
