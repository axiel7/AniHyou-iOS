// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class UpdateEntryProgressMutation: GraphQLMutation {
  public static let operationName: String = "UpdateEntryProgress"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      mutation UpdateEntryProgress($saveMediaListEntryId: Int, $progress: Int) {
        SaveMediaListEntry(id: $saveMediaListEntryId, progress: $progress) {
          __typename
          id
          mediaId
          progress
        }
      }
      """
    ))

  public var saveMediaListEntryId: GraphQLNullable<Int>
  public var progress: GraphQLNullable<Int>

  public init(
    saveMediaListEntryId: GraphQLNullable<Int>,
    progress: GraphQLNullable<Int>
  ) {
    self.saveMediaListEntryId = saveMediaListEntryId
    self.progress = progress
  }

  public var __variables: Variables? { [
    "saveMediaListEntryId": saveMediaListEntryId,
    "progress": progress
  ] }

  public struct Data: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { API.Objects.Mutation }
    public static var __selections: [Selection] { [
      .field("SaveMediaListEntry", SaveMediaListEntry?.self, arguments: [
        "id": .variable("saveMediaListEntryId"),
        "progress": .variable("progress")
      ]),
    ] }

    /// Create or update a media list entry
    public var saveMediaListEntry: SaveMediaListEntry? { __data["SaveMediaListEntry"] }

    /// SaveMediaListEntry
    ///
    /// Parent Type: `MediaList`
    public struct SaveMediaListEntry: API.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { API.Objects.MediaList }
      public static var __selections: [Selection] { [
        .field("id", Int.self),
        .field("mediaId", Int.self),
        .field("progress", Int?.self),
      ] }

      /// The id of the list entry
      public var id: Int { __data["id"] }
      /// The id of the media
      public var mediaId: Int { __data["mediaId"] }
      /// The amount of episodes/chapters consumed by the user
      public var progress: Int? { __data["progress"] }
    }
  }
}
