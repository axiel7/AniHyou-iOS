// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UserListCollectionQuery: GraphQLQuery {
  public static let operationName: String = "UserListCollection"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query UserListCollection($userId: Int, $type: MediaType, $sort: [MediaListSort], $chunk: Int, $perChunk: Int) { MediaListCollection( userId: $userId type: $type sort: $sort chunk: $chunk perChunk: $perChunk ) { __typename lists { __typename name isCustomList entries { __typename ...CommonMediaListEntry } } hasNextChunk } }"#,
      fragments: [AiringEpisode.self, BasicMediaDetails.self, BasicMediaListEntry.self, CommonMediaListEntry.self, FuzzyDateFragment.self]
    ))

  public var userId: GraphQLNullable<Int>
  public var type: GraphQLNullable<GraphQLEnum<MediaType>>
  public var sort: GraphQLNullable<[GraphQLEnum<MediaListSort>?]>
  public var chunk: GraphQLNullable<Int>
  public var perChunk: GraphQLNullable<Int>

  public init(
    userId: GraphQLNullable<Int>,
    type: GraphQLNullable<GraphQLEnum<MediaType>>,
    sort: GraphQLNullable<[GraphQLEnum<MediaListSort>?]>,
    chunk: GraphQLNullable<Int>,
    perChunk: GraphQLNullable<Int>
  ) {
    self.userId = userId
    self.type = type
    self.sort = sort
    self.chunk = chunk
    self.perChunk = perChunk
  }

  public var __variables: Variables? { [
    "userId": userId,
    "type": type,
    "sort": sort,
    "chunk": chunk,
    "perChunk": perChunk
  ] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("MediaListCollection", MediaListCollection?.self, arguments: [
        "userId": .variable("userId"),
        "type": .variable("type"),
        "sort": .variable("sort"),
        "chunk": .variable("chunk"),
        "perChunk": .variable("perChunk")
      ]),
    ] }

    /// Media list collection query, provides list pre-grouped by status & custom lists. User ID and Media Type arguments required.
    public var mediaListCollection: MediaListCollection? { __data["MediaListCollection"] }

    /// MediaListCollection
    ///
    /// Parent Type: `MediaListCollection`
    public struct MediaListCollection: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaListCollection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("lists", [List?]?.self),
        .field("hasNextChunk", Bool?.self),
      ] }

      /// Grouped media list entries
      public var lists: [List?]? { __data["lists"] }
      /// If there is another chunk
      public var hasNextChunk: Bool? { __data["hasNextChunk"] }

      /// MediaListCollection.List
      ///
      /// Parent Type: `MediaListGroup`
      public struct List: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaListGroup }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", String?.self),
          .field("isCustomList", Bool?.self),
          .field("entries", [Entry?]?.self),
        ] }

        public var name: String? { __data["name"] }
        public var isCustomList: Bool? { __data["isCustomList"] }
        /// Media list entries
        public var entries: [Entry?]? { __data["entries"] }

        /// MediaListCollection.List.Entry
        ///
        /// Parent Type: `MediaList`
        public struct Entry: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(CommonMediaListEntry.self),
          ] }

          /// The id of the list entry
          public var id: Int { __data["id"] }
          /// The id of the media
          public var mediaId: Int { __data["mediaId"] }
          public var media: Media? { __data["media"] }
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

            public var commonMediaListEntry: CommonMediaListEntry { _toFragment() }
            public var basicMediaListEntry: BasicMediaListEntry { _toFragment() }
          }

          public typealias Media = CommonMediaListEntry.Media

          public typealias StartedAt = BasicMediaListEntry.StartedAt

          public typealias CompletedAt = BasicMediaListEntry.CompletedAt
        }
      }
    }
  }
}
