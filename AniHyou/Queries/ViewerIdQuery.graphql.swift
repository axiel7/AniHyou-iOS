// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class ViewerIdQuery: GraphQLQuery {
  public static let operationName: String = "ViewerId"
  public static let document: DocumentType = .notPersisted(
    definition: .init(
      """
      query ViewerId {
        Viewer {
          __typename
          id
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
      .field("Viewer", Viewer?.self),
    ] }

    /// Get the currently authenticated user
    public var viewer: Viewer? { __data["Viewer"] }

    /// Viewer
    ///
    /// Parent Type: `User`
    public struct Viewer: API.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { API.Objects.User }
      public static var __selections: [Selection] { [
        .field("id", Int.self),
      ] }

      /// The id of the user
      public var id: Int { __data["id"] }
    }
  }
}
