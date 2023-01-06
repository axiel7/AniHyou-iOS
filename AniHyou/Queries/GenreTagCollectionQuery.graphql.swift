// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class GenreTagCollectionQuery: GraphQLQuery {
  public static let operationName: String = "GenreTagCollectionQuery"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query GenreTagCollectionQuery {
        GenreCollection
        MediaTagCollection {
          __typename
          id
          name
        }
      }
      """
    ))

  public init() {}

  public struct Data: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { API.Objects.Query }
    public static var __selections: [Selection] { [
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
    public struct MediaTagCollection: API.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { API.Objects.MediaTag }
      public static var __selections: [Selection] { [
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
