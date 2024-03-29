// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UpdateEntryMutation: GraphQLMutation {
  public static let operationName: String = "UpdateEntry"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation UpdateEntry($mediaId: Int, $status: MediaListStatus, $score: Float, $progress: Int, $progressVolumes: Int, $startedAt: FuzzyDateInput, $completedAt: FuzzyDateInput, $repeat: Int, $private: Boolean, $hiddenFromStatusLists: Boolean, $notes: String, $advancedScores: [Float]) { SaveMediaListEntry( mediaId: $mediaId status: $status score: $score progress: $progress progressVolumes: $progressVolumes startedAt: $startedAt completedAt: $completedAt repeat: $repeat private: $private hiddenFromStatusLists: $hiddenFromStatusLists notes: $notes advancedScores: $advancedScores ) { __typename ...BasicMediaListEntry mediaId } }"#,
      fragments: [BasicMediaListEntry.self, FuzzyDateFragment.self, IdsMediaList.self, ProgressMediaListEntry.self]
    ))

  public var mediaId: GraphQLNullable<Int>
  public var status: GraphQLNullable<GraphQLEnum<MediaListStatus>>
  public var score: GraphQLNullable<Double>
  public var progress: GraphQLNullable<Int>
  public var progressVolumes: GraphQLNullable<Int>
  public var startedAt: GraphQLNullable<FuzzyDateInput>
  public var completedAt: GraphQLNullable<FuzzyDateInput>
  public var `repeat`: GraphQLNullable<Int>
  public var `private`: GraphQLNullable<Bool>
  public var hiddenFromStatusLists: GraphQLNullable<Bool>
  public var notes: GraphQLNullable<String>
  public var advancedScores: GraphQLNullable<[Double?]>

  public init(
    mediaId: GraphQLNullable<Int>,
    status: GraphQLNullable<GraphQLEnum<MediaListStatus>>,
    score: GraphQLNullable<Double>,
    progress: GraphQLNullable<Int>,
    progressVolumes: GraphQLNullable<Int>,
    startedAt: GraphQLNullable<FuzzyDateInput>,
    completedAt: GraphQLNullable<FuzzyDateInput>,
    `repeat`: GraphQLNullable<Int>,
    `private`: GraphQLNullable<Bool>,
    hiddenFromStatusLists: GraphQLNullable<Bool>,
    notes: GraphQLNullable<String>,
    advancedScores: GraphQLNullable<[Double?]>
  ) {
    self.mediaId = mediaId
    self.status = status
    self.score = score
    self.progress = progress
    self.progressVolumes = progressVolumes
    self.startedAt = startedAt
    self.completedAt = completedAt
    self.`repeat` = `repeat`
    self.`private` = `private`
    self.hiddenFromStatusLists = hiddenFromStatusLists
    self.notes = notes
    self.advancedScores = advancedScores
  }

  public var __variables: Variables? { [
    "mediaId": mediaId,
    "status": status,
    "score": score,
    "progress": progress,
    "progressVolumes": progressVolumes,
    "startedAt": startedAt,
    "completedAt": completedAt,
    "repeat": `repeat`,
    "private": `private`,
    "hiddenFromStatusLists": hiddenFromStatusLists,
    "notes": notes,
    "advancedScores": advancedScores
  ] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("SaveMediaListEntry", SaveMediaListEntry?.self, arguments: [
        "mediaId": .variable("mediaId"),
        "status": .variable("status"),
        "score": .variable("score"),
        "progress": .variable("progress"),
        "progressVolumes": .variable("progressVolumes"),
        "startedAt": .variable("startedAt"),
        "completedAt": .variable("completedAt"),
        "repeat": .variable("repeat"),
        "private": .variable("private"),
        "hiddenFromStatusLists": .variable("hiddenFromStatusLists"),
        "notes": .variable("notes"),
        "advancedScores": .variable("advancedScores")
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
        .field("mediaId", Int.self),
        .fragment(BasicMediaListEntry.self),
      ] }

      /// The id of the media
      public var mediaId: Int { __data["mediaId"] }
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
      /// The amount of episodes/chapters consumed by the user
      public var progress: Int? { __data["progress"] }
      /// The amount of volumes read by the user
      public var progressVolumes: Int? { __data["progressVolumes"] }
      /// The id of the list entry
      public var id: Int { __data["id"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var basicMediaListEntry: BasicMediaListEntry { _toFragment() }
        public var progressMediaListEntry: ProgressMediaListEntry { _toFragment() }
        public var idsMediaList: IdsMediaList { _toFragment() }
      }

      /// SaveMediaListEntry.StartedAt
      ///
      /// Parent Type: `FuzzyDate`
      public struct StartedAt: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }

        /// Numeric Day (24)
        public var day: Int? { __data["day"] }
        /// Numeric Month (3)
        public var month: Int? { __data["month"] }
        /// Numeric Year (2017)
        public var year: Int? { __data["year"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var fuzzyDateFragment: FuzzyDateFragment { _toFragment() }
        }
      }

      /// SaveMediaListEntry.CompletedAt
      ///
      /// Parent Type: `FuzzyDate`
      public struct CompletedAt: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }

        /// Numeric Day (24)
        public var day: Int? { __data["day"] }
        /// Numeric Month (3)
        public var month: Int? { __data["month"] }
        /// Numeric Year (2017)
        public var year: Int? { __data["year"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var fuzzyDateFragment: FuzzyDateFragment { _toFragment() }
        }
      }
    }
  }
}
