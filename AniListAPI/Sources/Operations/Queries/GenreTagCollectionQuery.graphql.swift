// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GenreTagCollectionQuery: GraphQLQuery {
  public static let operationName: String = "GenreTagCollectionQuery"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GenreTagCollectionQuery { GenreCollection MediaTagCollection { __typename id name } }"#
    ))

  public init() {}

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("GenreCollection", [String?]?.self),
      .field("MediaTagCollection", [MediaTagCollection?]?.self),
    ] }

    /// Collection of all the possible media genres
    public var genreCollection: [String?]? { __data["GenreCollection"] }
    /// Collection of all the possible media tags
    public var mediaTagCollection: [MediaTagCollection?]? { __data["MediaTagCollection"] }

    /// MediaTagCollection
    ///
    /// Parent Type: `MediaTag`
    public struct MediaTagCollection: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaTag }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("name", String.self),
      ] }

      /// The id of the tag
      public var id: Int { __data["id"] }
      /// The name of the tag
      public var name: String { __data["name"] }
    }
  }
}
