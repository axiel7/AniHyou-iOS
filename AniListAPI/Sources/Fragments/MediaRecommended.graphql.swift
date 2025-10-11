// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct MediaRecommended: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment MediaRecommended on Recommendation { __typename mediaRecommendation { __typename id title { __typename userPreferred } type format coverImage { __typename large } mediaListEntry { __typename status } } }"#
  }

  @_spi(Unsafe) public let __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Recommendation }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("mediaRecommendation", MediaRecommendation?.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    MediaRecommended.self
  ] }

  /// The recommended media
  public var mediaRecommendation: MediaRecommendation? { __data["mediaRecommendation"] }

  /// MediaRecommendation
  ///
  /// Parent Type: `Media`
  public struct MediaRecommendation: AniListAPI.SelectionSet, Identifiable {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", Int.self),
      .field("title", Title?.self),
      .field("type", GraphQLEnum<AniListAPI.MediaType>?.self),
      .field("format", GraphQLEnum<AniListAPI.MediaFormat>?.self),
      .field("coverImage", CoverImage?.self),
      .field("mediaListEntry", MediaListEntry?.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      MediaRecommended.MediaRecommendation.self
    ] }

    /// The id of the media
    public var id: Int { __data["id"] }
    /// The official titles of the media in various languages
    public var title: Title? { __data["title"] }
    /// The type of the media; anime or manga
    public var type: GraphQLEnum<AniListAPI.MediaType>? { __data["type"] }
    /// The format the media was released in
    public var format: GraphQLEnum<AniListAPI.MediaFormat>? { __data["format"] }
    /// The cover images of the media
    public var coverImage: CoverImage? { __data["coverImage"] }
    /// The authenticated user's media list entry for the media
    public var mediaListEntry: MediaListEntry? { __data["mediaListEntry"] }

    /// MediaRecommendation.Title
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
        MediaRecommended.MediaRecommendation.Title.self
      ] }

      /// The currently authenticated users preferred title language. Default romaji for non-authenticated
      public var userPreferred: String? { __data["userPreferred"] }
    }

    /// MediaRecommendation.CoverImage
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
        MediaRecommended.MediaRecommendation.CoverImage.self
      ] }

      /// The cover image url of the media at a large size
      public var large: String? { __data["large"] }
    }

    /// MediaRecommendation.MediaListEntry
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
        MediaRecommended.MediaRecommendation.MediaListEntry.self
      ] }

      /// The watching/reading status
      public var status: GraphQLEnum<AniListAPI.MediaListStatus>? { __data["status"] }
    }
  }
}
