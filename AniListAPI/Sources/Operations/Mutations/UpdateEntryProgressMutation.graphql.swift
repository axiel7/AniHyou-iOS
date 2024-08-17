// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UpdateEntryProgressMutation: GraphQLMutation {
  public static let operationName: String = "UpdateEntryProgress"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation UpdateEntryProgress($saveMediaListEntryId: Int, $progress: Int, $progressVolumes: Int, $status: MediaListStatus) { SaveMediaListEntry( id: $saveMediaListEntryId progress: $progress progressVolumes: $progressVolumes status: $status ) { __typename ...BasicMediaListEntry } }"#,
      fragments: [BasicMediaListEntry.self, FuzzyDateFragment.self]
    ))

  public var saveMediaListEntryId: GraphQLNullable<Int>
  public var progress: GraphQLNullable<Int>
  public var progressVolumes: GraphQLNullable<Int>
  public var status: GraphQLNullable<GraphQLEnum<MediaListStatus>>

  public init(
    saveMediaListEntryId: GraphQLNullable<Int>,
    progress: GraphQLNullable<Int>,
    progressVolumes: GraphQLNullable<Int>,
    status: GraphQLNullable<GraphQLEnum<MediaListStatus>>
  ) {
    self.saveMediaListEntryId = saveMediaListEntryId
    self.progress = progress
    self.progressVolumes = progressVolumes
    self.status = status
  }

  public var __variables: Variables? { [
    "saveMediaListEntryId": saveMediaListEntryId,
    "progress": progress,
    "progressVolumes": progressVolumes,
    "status": status
  ] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("SaveMediaListEntry", SaveMediaListEntry?.self, arguments: [
        "id": .variable("saveMediaListEntryId"),
        "progress": .variable("progress"),
        "progressVolumes": .variable("progressVolumes"),
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

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(BasicMediaListEntry.self),
      ] }

      /// The id of the list entry
      public var id: Int { __data["id"] }
      /// The id of the media
      public var mediaId: Int { __data["mediaId"] }
      /// The amount of episodes/chapters consumed by the user
      public var progress: Int? { __data["progress"] }
      /// The amount of volumes read by the user
      public var progressVolumes: Int? { __data["progressVolumes"] }
      /// The watching/reading status
      public var status: GraphQLEnum<AniListAPI.MediaListStatus>? { __data["status"] }
      /// The score of the entry
      public var score: Double? { __data["score"] }
      /// Map of advanced scores with name keys
      public var advancedScores: AniListAPI.Json? { __data["advancedScores"] }
      /// The amount of times the user has rewatched/read the media
      public var `repeat`: Int? { __data["repeat"] }
      /// If the entry should only be visible to authenticated user
      public var `private`: Bool? { __data["private"] }
      /// If the entry shown be hidden from non-custom lists
      public var hiddenFromStatusLists: Bool? { __data["hiddenFromStatusLists"] }
      /// When the entry was started by the user
      public var startedAt: StartedAt? { __data["startedAt"] }
      /// When the entry was completed by the user
      public var completedAt: CompletedAt? { __data["completedAt"] }
      /// Text notes
      public var notes: String? { __data["notes"] }
      /// Map of booleans for which custom lists the entry are in
      public var customLists: AniListAPI.Json? { __data["customLists"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var basicMediaListEntry: BasicMediaListEntry { _toFragment() }
      }

      public typealias StartedAt = BasicMediaListEntry.StartedAt

      public typealias CompletedAt = BasicMediaListEntry.CompletedAt
    }
  }
}
