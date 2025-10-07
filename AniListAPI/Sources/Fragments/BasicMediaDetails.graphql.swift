// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct BasicMediaDetails: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment BasicMediaDetails on Media { __typename id title { __typename userPreferred } episodes chapters volumes type coverImage { __typename large } }"#
  }

  @_spi(Unsafe) public let __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("title", Title?.self),
    .field("episodes", Int?.self),
    .field("chapters", Int?.self),
    .field("volumes", Int?.self),
    .field("type", GraphQLEnum<AniListAPI.MediaType>?.self),
    .field("coverImage", CoverImage?.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    BasicMediaDetails.self
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
    @_spi(Unsafe) public let __data: DataDict
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
    public var userPreferred: String? { __data["userPreferred"] }
  }

  /// CoverImage
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
      BasicMediaDetails.CoverImage.self
    ] }

    /// The cover image url of the media at a large size
    public var large: String? { __data["large"] }
  }
}
