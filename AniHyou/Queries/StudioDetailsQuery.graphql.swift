// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class StudioDetailsQuery: GraphQLQuery {
  public static let operationName: String = "StudioDetails"
  public static let document: DocumentType = .notPersisted(
    definition: .init(
      """
      query StudioDetails($studioId: Int) {
        Studio(id: $studioId) {
          __typename
          id
          name
          isAnimationStudio
        }
      }
      """
    ))

  public var studioId: GraphQLNullable<Int>

  public init(studioId: GraphQLNullable<Int>) {
    self.studioId = studioId
  }

  public var __variables: Variables? { ["studioId": studioId] }

  public struct Data: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { API.Objects.Query }
    public static var __selections: [Selection] { [
      .field("Studio", Studio?.self, arguments: ["id": .variable("studioId")]),
    ] }

    /// Studio query
    public var studio: Studio? { __data["Studio"] }

    /// Studio
    ///
    /// Parent Type: `Studio`
    public struct Studio: API.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { API.Objects.Studio }
      public static var __selections: [Selection] { [
        .field("id", Int.self),
        .field("name", String.self),
        .field("isAnimationStudio", Bool.self),
      ] }

      /// The id of the studio
      public var id: Int { __data["id"] }
      /// The name of the studio
      public var name: String { __data["name"] }
      /// If the studio is an animation studio or a different kind of company
      public var isAnimationStudio: Bool { __data["isAnimationStudio"] }
    }
  }
}
