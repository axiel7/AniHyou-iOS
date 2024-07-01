// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class DeleteMediaListMutation: GraphQLMutation {
  public static let operationName: String = "DeleteMediaList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation DeleteMediaList($mediaListEntryId: Int) { DeleteMediaListEntry(id: $mediaListEntryId) { __typename deleted } }"#
    ))

  public var mediaListEntryId: GraphQLNullable<Int>

  public init(mediaListEntryId: GraphQLNullable<Int>) {
    self.mediaListEntryId = mediaListEntryId
  }

  public var __variables: Variables? { ["mediaListEntryId": mediaListEntryId] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("DeleteMediaListEntry", DeleteMediaListEntry?.self, arguments: ["id": .variable("mediaListEntryId")]),
    ] }

    /// Delete a media list entry
    public var deleteMediaListEntry: DeleteMediaListEntry? { __data["DeleteMediaListEntry"] }

    /// DeleteMediaListEntry
    ///
    /// Parent Type: `Deleted`
    public struct DeleteMediaListEntry: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Deleted }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("deleted", Bool?.self),
      ] }

      /// If an item has been successfully deleted
      public var deleted: Bool? { __data["deleted"] }
    }
  }
}
