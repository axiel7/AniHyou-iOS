// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class MediaListIdsQuery: GraphQLQuery {
  public static let operationName: String = "MediaListIds"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query MediaListIds($type: MediaType, $userId: Int, $status: MediaListStatus, $chunk: Int, $perChunk: Int) { MediaListCollection( type: $type userId: $userId status: $status chunk: $chunk perChunk: $perChunk ) { __typename lists { __typename entries { __typename mediaId } } hasNextChunk } }"#
    ))

  public var type: GraphQLNullable<GraphQLEnum<MediaType>>
  public var userId: GraphQLNullable<Int>
  public var status: GraphQLNullable<GraphQLEnum<MediaListStatus>>
  public var chunk: GraphQLNullable<Int>
  public var perChunk: GraphQLNullable<Int>

  public init(
    type: GraphQLNullable<GraphQLEnum<MediaType>>,
    userId: GraphQLNullable<Int>,
    status: GraphQLNullable<GraphQLEnum<MediaListStatus>>,
    chunk: GraphQLNullable<Int>,
    perChunk: GraphQLNullable<Int>
  ) {
    self.type = type
    self.userId = userId
    self.status = status
    self.chunk = chunk
    self.perChunk = perChunk
  }

  public var __variables: Variables? { [
    "type": type,
    "userId": userId,
    "status": status,
    "chunk": chunk,
    "perChunk": perChunk
  ] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("MediaListCollection", MediaListCollection?.self, arguments: [
        "type": .variable("type"),
        "userId": .variable("userId"),
        "status": .variable("status"),
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
          .field("entries", [Entry?]?.self),
        ] }

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
            .field("mediaId", Int.self),
          ] }

          /// The id of the media
          public var mediaId: Int { __data["mediaId"] }
        }
      }
    }
  }
}
