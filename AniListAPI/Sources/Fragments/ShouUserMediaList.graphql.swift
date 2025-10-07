// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct ShouUserMediaList: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment ShouUserMediaList on MediaList { __typename id mediaId media { __typename title { __typename userPreferred } coverImage { __typename color } type episodes chapters volumes nextAiringEpisode { __typename episode airingAt } } progress progressVolumes status }"#
  }

  @_spi(Unsafe) public let __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("mediaId", Int.self),
    .field("media", Media?.self),
    .field("progress", Int?.self),
    .field("progressVolumes", Int?.self),
    .field("status", GraphQLEnum<AniListAPI.MediaListStatus>?.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    ShouUserMediaList.self
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

  /// Media
  ///
  /// Parent Type: `Media`
  public struct Media: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("title", Title?.self),
      .field("coverImage", CoverImage?.self),
      .field("type", GraphQLEnum<AniListAPI.MediaType>?.self),
      .field("episodes", Int?.self),
      .field("chapters", Int?.self),
      .field("volumes", Int?.self),
      .field("nextAiringEpisode", NextAiringEpisode?.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      ShouUserMediaList.Media.self
    ] }

    /// The official titles of the media in various languages
    public var title: Title? { __data["title"] }
    /// The cover images of the media
    public var coverImage: CoverImage? { __data["coverImage"] }
    /// The type of the media; anime or manga
    public var type: GraphQLEnum<AniListAPI.MediaType>? { __data["type"] }
    /// The amount of episodes the anime has when complete
    public var episodes: Int? { __data["episodes"] }
    /// The amount of chapters the manga has when complete
    public var chapters: Int? { __data["chapters"] }
    /// The amount of volumes the manga has when complete
    public var volumes: Int? { __data["volumes"] }
    /// The media's next episode airing schedule
    public var nextAiringEpisode: NextAiringEpisode? { __data["nextAiringEpisode"] }

    /// Media.Title
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
        ShouUserMediaList.Media.Title.self
      ] }

      /// The currently authenticated users preferred title language. Default romaji for non-authenticated
      public var userPreferred: String? { __data["userPreferred"] }
    }

    /// Media.CoverImage
    ///
    /// Parent Type: `MediaCoverImage`
    public struct CoverImage: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaCoverImage }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("color", String?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        ShouUserMediaList.Media.CoverImage.self
      ] }

      /// Average #hex color of cover image
      public var color: String? { __data["color"] }
    }

    /// Media.NextAiringEpisode
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
        ShouUserMediaList.Media.NextAiringEpisode.self
      ] }

      /// The airing episode number
      public var episode: Int { __data["episode"] }
      /// The time the episode airs at
      public var airingAt: Int { __data["airingAt"] }
    }
  }
}
