// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UpdateEntryProgressMutation: GraphQLMutation {
  public static let operationName: String = "UpdateEntryProgress"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"""
      mutation UpdateEntryProgress($saveMediaListEntryId: Int, $progress: Int, $status: MediaListStatus) {
        SaveMediaListEntry(
          id: $saveMediaListEntryId
          progress: $progress
          status: $status
        ) {
          __typename
          id
          mediaId
          progress
          status
        }
      }
      """#
    ))

  public var saveMediaListEntryId: GraphQLNullable<Int>
  public var progress: GraphQLNullable<Int>
  public var status: GraphQLNullable<GraphQLEnum<MediaListStatus>>

  public init(
    saveMediaListEntryId: GraphQLNullable<Int>,
    progress: GraphQLNullable<Int>,
    status: GraphQLNullable<GraphQLEnum<MediaListStatus>>
  ) {
    self.saveMediaListEntryId = saveMediaListEntryId
    self.progress = progress
    self.status = status
  }

  public var __variables: Variables? { [
    "saveMediaListEntryId": saveMediaListEntryId,
    "progress": progress,
    "status": status
  ] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("SaveMediaListEntry", SaveMediaListEntry?.self, arguments: [
        "id": .variable("saveMediaListEntryId"),
        "progress": .variable("progress"),
        "status": .variable("status")
      ]),
    ] }

    /// Create or update a media list entry
    public var saveMediaListEntry: SaveMediaListEntry? { __data["SaveMediaListEntry"] }

    /// SaveMediaListEntry
    ///
    /// Parent Type: `MediaList`
    public struct SaveMediaListEntry: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("mediaId", Int.self),
        .field("progress", Int?.self),
        .field("status", GraphQLEnum<AniListAPI.MediaListStatus>?.self),
      ] }

      /// The id of the list entry
      public var id: Int { __data["id"] }
      /// The id of the media
      public var mediaId: Int { __data["mediaId"] }
      /// The amount of episodes/chapters consumed by the user
      public var progress: Int? { __data["progress"] }
      /// The watching/reading status
      public var status: GraphQLEnum<AniListAPI.MediaListStatus>? { __data["status"] }
    }
  }
}
