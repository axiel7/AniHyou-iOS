// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class UpdateEntryMutation: GraphQLMutation {
  public static let operationName: String = "UpdateEntry"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      mutation UpdateEntry($mediaId: Int, $status: MediaListStatus, $score: Float, $progress: Int, $progressVolumes: Int, $startedAt: FuzzyDateInput, $completedAt: FuzzyDateInput, $repeat: Int) {
        SaveMediaListEntry(
          mediaId: $mediaId
          status: $status
          score: $score
          progress: $progress
          progressVolumes: $progressVolumes
          startedAt: $startedAt
          completedAt: $completedAt
          repeat: $repeat
        ) {
          __typename
          id
          mediaId
          status
          score
          progress
          progressVolumes
          repeat
          startedAt {
            __typename
            ...FuzzyDate
          }
          completedAt {
            __typename
            ...FuzzyDate
          }
        }
      }
      """#,
      fragments: [FuzzyDate.self]
    ))

  public var mediaId: GraphQLNullable<Int>
  public var status: GraphQLNullable<GraphQLEnum<API.MediaListStatus>>
  public var score: GraphQLNullable<Double>
  public var progress: GraphQLNullable<Int>
  public var progressVolumes: GraphQLNullable<Int>
  public var startedAt: GraphQLNullable<API.FuzzyDateInput>
  public var completedAt: GraphQLNullable<API.FuzzyDateInput>
  public var `repeat`: GraphQLNullable<Int>

  public init(
    mediaId: GraphQLNullable<Int>,
    status: GraphQLNullable<GraphQLEnum<API.MediaListStatus>>,
    score: GraphQLNullable<Double>,
    progress: GraphQLNullable<Int>,
    progressVolumes: GraphQLNullable<Int>,
    startedAt: GraphQLNullable<API.FuzzyDateInput>,
    completedAt: GraphQLNullable<API.FuzzyDateInput>,
    `repeat`: GraphQLNullable<Int>
  ) {
    self.mediaId = mediaId
    self.status = status
    self.score = score
    self.progress = progress
    self.progressVolumes = progressVolumes
    self.startedAt = startedAt
    self.completedAt = completedAt
    self.`repeat` = `repeat`
  }

  public var __variables: Variables? { [
    "mediaId": mediaId,
    "status": status,
    "score": score,
    "progress": progress,
    "progressVolumes": progressVolumes,
    "startedAt": startedAt,
    "completedAt": completedAt,
    "repeat": `repeat`
  ] }

  public struct Data: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ApolloAPI.ParentType { API.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("SaveMediaListEntry", SaveMediaListEntry?.self, arguments: [
        "mediaId": .variable("mediaId"),
        "status": .variable("status"),
        "score": .variable("score"),
        "progress": .variable("progress"),
        "progressVolumes": .variable("progressVolumes"),
        "startedAt": .variable("startedAt"),
        "completedAt": .variable("completedAt"),
        "repeat": .variable("repeat")
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

      public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaList }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("id", Int.self),
        .field("mediaId", Int.self),
        .field("status", GraphQLEnum<API.MediaListStatus>?.self),
        .field("score", Double?.self),
        .field("progress", Int?.self),
        .field("progressVolumes", Int?.self),
        .field("repeat", Int?.self),
        .field("startedAt", StartedAt?.self),
        .field("completedAt", CompletedAt?.self),
      ] }

      /// The id of the list entry
      public var id: Int { __data["id"] }
      /// The id of the media
      public var mediaId: Int { __data["mediaId"] }
      /// The watching/reading status
      public var status: GraphQLEnum<API.MediaListStatus>? { __data["status"] }
      /// The score of the entry
      public var score: Double? { __data["score"] }
      /// The amount of episodes/chapters consumed by the user
      public var progress: Int? { __data["progress"] }
      /// The amount of volumes read by the user
      public var progressVolumes: Int? { __data["progressVolumes"] }
      /// The amount of times the user has rewatched/read the media
      public var `repeat`: Int? { __data["repeat"] }
      /// When the entry was started by the user
      public var startedAt: StartedAt? { __data["startedAt"] }
      /// When the entry was completed by the user
      public var completedAt: CompletedAt? { __data["completedAt"] }

      /// SaveMediaListEntry.StartedAt
      ///
      /// Parent Type: `FuzzyDate`
      public struct StartedAt: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.FuzzyDate }
        public static var __selections: [ApolloAPI.Selection] { [
          .fragment(FuzzyDate.self),
        ] }

        /// Numeric Day (24)
        public var day: Int? { __data["day"] }
        /// Numeric Month (3)
        public var month: Int? { __data["month"] }
        /// Numeric Year (2017)
        public var year: Int? { __data["year"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public var fuzzyDate: FuzzyDate { _toFragment() }
        }
      }

      /// SaveMediaListEntry.CompletedAt
      ///
      /// Parent Type: `FuzzyDate`
      public struct CompletedAt: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.FuzzyDate }
        public static var __selections: [ApolloAPI.Selection] { [
          .fragment(FuzzyDate.self),
        ] }

        /// Numeric Day (24)
        public var day: Int? { __data["day"] }
        /// Numeric Month (3)
        public var month: Int? { __data["month"] }
        /// Numeric Year (2017)
        public var year: Int? { __data["year"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public var fuzzyDate: FuzzyDate { _toFragment() }
        }
      }
    }
  }
}
