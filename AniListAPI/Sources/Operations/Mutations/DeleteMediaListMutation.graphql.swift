// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct DeleteMediaListMutation: GraphQLMutation {
  public static let operationName: String = "DeleteMediaList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation DeleteMediaList($mediaListEntryId: Int) { DeleteMediaListEntry(id: $mediaListEntryId) { __typename deleted } }"#
    ))

  public var mediaListEntryId: GraphQLNullable<Int32>

  public init(mediaListEntryId: GraphQLNullable<Int32>) {
    self.mediaListEntryId = mediaListEntryId
  }

  @_spi(Unsafe) public var __variables: Variables? { ["mediaListEntryId": mediaListEntryId] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("DeleteMediaListEntry", DeleteMediaListEntry?.self, arguments: ["id": .variable("mediaListEntryId")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      DeleteMediaListMutation.Data.self
    ] }

    /// Delete a media list entry
    public var deleteMediaListEntry: DeleteMediaListEntry? { __data["DeleteMediaListEntry"] }

    /// DeleteMediaListEntry
    ///
    /// Parent Type: `Deleted`
    public struct DeleteMediaListEntry: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Deleted }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("deleted", Bool?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        DeleteMediaListMutation.Data.DeleteMediaListEntry.self
      ] }

      /// If an item has been successfully deleted
      public var deleted: Bool? { __data["deleted"] }
    }
  }
}
