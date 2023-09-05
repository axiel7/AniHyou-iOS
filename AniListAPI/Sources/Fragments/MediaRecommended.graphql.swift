// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct MediaRecommended: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment MediaRecommended on Recommendation { __typename mediaRecommendation { __typename id title { __typename userPreferred } type format coverImage { __typename large } mediaListEntry { __typename status } } }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Recommendation }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("mediaRecommendation", MediaRecommendation?.self),
  ] }

  /// The recommended media
  public var mediaRecommendation: MediaRecommendation? { __data["mediaRecommendation"] }

  /// MediaRecommendation
  ///
  /// Parent Type: `Media`
  public struct MediaRecommendation: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Media }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", Int.self),
      .field("title", Title?.self),
      .field("type", GraphQLEnum<AniListAPI.MediaType>?.self),
      .field("format", GraphQLEnum<AniListAPI.MediaFormat>?.self),
      .field("coverImage", CoverImage?.self),
      .field("mediaListEntry", MediaListEntry?.self),
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

    /// MediaRecommendation.CoverImage
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

    /// MediaRecommendation.MediaListEntry
    ///
    /// Parent Type: `MediaList`
    public struct MediaListEntry: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("status", GraphQLEnum<AniListAPI.MediaListStatus>?.self),
      ] }

      /// The watching/reading status
      public var status: GraphQLEnum<AniListAPI.MediaListStatus>? { __data["status"] }
    }
  }
}
