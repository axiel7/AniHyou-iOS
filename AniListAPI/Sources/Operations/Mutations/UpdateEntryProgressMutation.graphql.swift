// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct UpdateEntryProgressMutation: GraphQLMutation {
  public static let operationName: String = "UpdateEntryProgress"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation UpdateEntryProgress($saveMediaListEntryId: Int, $progress: Int, $progressVolumes: Int, $status: MediaListStatus) { SaveMediaListEntry( id: $saveMediaListEntryId progress: $progress progressVolumes: $progressVolumes status: $status ) { __typename ...BasicMediaListEntry } }"#,
      fragments: [BasicMediaListEntry.self, FuzzyDateFragment.self]
    ))

  public var saveMediaListEntryId: GraphQLNullable<Int32>
  public var progress: GraphQLNullable<Int32>
  public var progressVolumes: GraphQLNullable<Int32>
  public var status: GraphQLNullable<GraphQLEnum<MediaListStatus>>

  public init(
    saveMediaListEntryId: GraphQLNullable<Int32>,
    progress: GraphQLNullable<Int32>,
    progressVolumes: GraphQLNullable<Int32>,
    status: GraphQLNullable<GraphQLEnum<MediaListStatus>>
  ) {
    self.saveMediaListEntryId = saveMediaListEntryId
    self.progress = progress
    self.progressVolumes = progressVolumes
    self.status = status
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "saveMediaListEntryId": saveMediaListEntryId,
    "progress": progress,
    "progressVolumes": progressVolumes,
    "status": status
  ] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("SaveMediaListEntry", SaveMediaListEntry?.self, arguments: [
        "id": .variable("saveMediaListEntryId"),
        "progress": .variable("progress"),
        "progressVolumes": .variable("progressVolumes"),
        "status": .variable("status")
      ]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      UpdateEntryProgressMutation.Data.self
    ] }

    /// Create or update a media list entry
    public var saveMediaListEntry: SaveMediaListEntry? { __data["SaveMediaListEntry"] }

    /// SaveMediaListEntry
    ///
    /// Parent Type: `MediaList`
    public struct SaveMediaListEntry: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(BasicMediaListEntry.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        UpdateEntryProgressMutation.Data.SaveMediaListEntry.self,
        BasicMediaListEntry.self
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
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public var basicMediaListEntry: BasicMediaListEntry { _toFragment() }
      }

      public typealias StartedAt = BasicMediaListEntry.StartedAt

      public typealias CompletedAt = BasicMediaListEntry.CompletedAt
    }
  }
}
