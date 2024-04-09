// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct BasicMediaDetails: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment BasicMediaDetails on Media { __typename id title { __typename userPreferred } episodes chapters volumes type coverImage { __typename large } }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Media }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("title", Title?.self),
    .field("episodes", Int?.self),
    .field("chapters", Int?.self),
    .field("volumes", Int?.self),
    .field("type", GraphQLEnum<AniListAPI.MediaType>?.self),
    .field("coverImage", CoverImage?.self),
  ] }

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

  /// Title
  ///
  /// Parent Type: `MediaTitle`
  public struct Title: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaTitle }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("userPreferred", String?.self),
    ] }

    /// The currently authenticated users preferred title language. Default romaji for non-authenticated
    public var userPreferred: String? { __data["userPreferred"] }
  }

  /// CoverImage
  ///
  /// Parent Type: `MediaCoverImage`
  public struct CoverImage: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaCoverImage }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("large", String?.self),
    ] }

    /// The cover image url of the media at a large size
    public var large: String? { __data["large"] }
  }
}
