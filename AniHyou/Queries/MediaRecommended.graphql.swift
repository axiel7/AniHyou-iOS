// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public struct MediaRecommended: API.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment MediaRecommended on Recommendation {
      __typename
      mediaRecommendation {
        __typename
        id
        title {
          __typename
          userPreferred
        }
        format
        coverImage {
          __typename
          large
        }
      }
    }
    """ }

  public let __data: DataDict
  public init(data: DataDict) { __data = data }

  public static var __parentType: ApolloAPI.ParentType { API.Objects.Recommendation }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("mediaRecommendation", MediaRecommendation?.self),
  ] }

  /// The recommended media
  public var mediaRecommendation: MediaRecommendation? { __data["mediaRecommendation"] }

  /// MediaRecommendation
  ///
  /// Parent Type: `Media`
  public struct MediaRecommendation: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ApolloAPI.ParentType { API.Objects.Media }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("id", Int.self),
      .field("title", Title?.self),
      .field("format", GraphQLEnum<API.MediaFormat>?.self),
      .field("coverImage", CoverImage?.self),
    ] }

    /// The id of the media
    public var id: Int { __data["id"] }
    /// The official titles of the media in various languages
    public var title: Title? { __data["title"] }
    /// The format the media was released in
    public var format: GraphQLEnum<API.MediaFormat>? { __data["format"] }
    /// The cover images of the media
    public var coverImage: CoverImage? { __data["coverImage"] }

    /// MediaRecommendation.Title
    ///
    /// Parent Type: `MediaTitle`
    public struct Title: API.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaTitle }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("userPreferred", String?.self),
      ] }

      /// The currently authenticated users preferred title language. Default romaji for non-authenticated
      public var userPreferred: String? { __data["userPreferred"] }
    }

    /// MediaRecommendation.CoverImage
    ///
    /// Parent Type: `MediaCoverImage`
    public struct CoverImage: API.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaCoverImage }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("large", String?.self),
      ] }

      /// The cover image url of the media at a large size
      public var large: String? { __data["large"] }
    }
  }
}
