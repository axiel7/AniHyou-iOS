// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct StudioMedia: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment StudioMedia on Media { __typename id coverImage { __typename large } title { __typename userPreferred } type mediaListEntry { __typename status } }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("coverImage", CoverImage?.self),
    .field("title", Title?.self),
    .field("type", GraphQLEnum<AniListAPI.MediaType>?.self),
    .field("mediaListEntry", MediaListEntry?.self),
  ] }

  /// The id of the media
  public var id: Int { __data["id"] }
  /// The cover images of the media
  public var coverImage: CoverImage? { __data["coverImage"] }
  /// The official titles of the media in various languages
  public var title: Title? { __data["title"] }
  /// The type of the media; anime or manga
  public var type: GraphQLEnum<AniListAPI.MediaType>? { __data["type"] }
  /// The authenticated user's media list entry for the media
  public var mediaListEntry: MediaListEntry? { __data["mediaListEntry"] }

  /// CoverImage
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

  /// Title
  ///
  /// Parent Type: `MediaTitle`
  public struct Title: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaTitle }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("userPreferred", String?.self),
    ] }

    /// The currently authenticated users preferred title language. Default romaji for non-authenticated
    public var userPreferred: String? { __data["userPreferred"] }
  }

  /// MediaListEntry
  ///
  /// Parent Type: `MediaList`
  public struct MediaListEntry: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("status", GraphQLEnum<AniListAPI.MediaListStatus>?.self),
    ] }

    /// The watching/reading status
    public var status: GraphQLEnum<AniListAPI.MediaListStatus>? { __data["status"] }
  }
}
