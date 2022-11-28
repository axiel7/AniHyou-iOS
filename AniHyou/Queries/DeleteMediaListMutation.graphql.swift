// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class DeleteMediaListMutation: GraphQLMutation {
  public static let operationName: String = "DeleteMediaList"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      mutation DeleteMediaList($mediaListEntryId: Int) {
        DeleteMediaListEntry(id: $mediaListEntryId) {
          __typename
          deleted
        }
      }
      """
    ))

  public var mediaListEntryId: GraphQLNullable<Int>

  public init(mediaListEntryId: GraphQLNullable<Int>) {
    self.mediaListEntryId = mediaListEntryId
  }

  public var __variables: Variables? { ["mediaListEntryId": mediaListEntryId] }

  public struct Data: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { API.Objects.Mutation }
    public static var __selections: [Selection] { [
      .field("DeleteMediaListEntry", DeleteMediaListEntry?.self, arguments: ["id": .variable("mediaListEntryId")]),
    ] }

    /// Delete a media list entry
    public var deleteMediaListEntry: DeleteMediaListEntry? { __data["DeleteMediaListEntry"] }

    /// DeleteMediaListEntry
    ///
    /// Parent Type: `Deleted`
    public struct DeleteMediaListEntry: API.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { API.Objects.Deleted }
      public static var __selections: [Selection] { [
        .field("deleted", Bool?.self),
      ] }

      /// If an item has been successfully deleted
      public var deleted: Bool? { __data["deleted"] }
    }
  }
}
