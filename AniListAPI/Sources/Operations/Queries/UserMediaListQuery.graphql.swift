// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UserMediaListQuery: GraphQLQuery {
  public static let operationName: String = "UserMediaList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query UserMediaList($page: Int, $perPage: Int, $userId: Int, $type: MediaType, $statusIn: [MediaListStatus], $sort: [MediaListSort]) { Page(page: $page, perPage: $perPage) { __typename mediaList(userId: $userId, type: $type, status_in: $statusIn, sort: $sort) { __typename ...CommonMediaListEntry } pageInfo { __typename hasNextPage } } }"#,
      fragments: [AiringEpisode.self, BasicMediaDetails.self, BasicMediaListEntry.self, CommonMediaListEntry.self, FuzzyDateFragment.self]
    ))

  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>
  public var userId: GraphQLNullable<Int>
  public var type: GraphQLNullable<GraphQLEnum<MediaType>>
  public var statusIn: GraphQLNullable<[GraphQLEnum<MediaListStatus>?]>
  public var sort: GraphQLNullable<[GraphQLEnum<MediaListSort>?]>

  public init(
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>,
    userId: GraphQLNullable<Int>,
    type: GraphQLNullable<GraphQLEnum<MediaType>>,
    statusIn: GraphQLNullable<[GraphQLEnum<MediaListStatus>?]>,
    sort: GraphQLNullable<[GraphQLEnum<MediaListSort>?]>
  ) {
    self.page = page
    self.perPage = perPage
    self.userId = userId
    self.type = type
    self.statusIn = statusIn
    self.sort = sort
  }

  public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "userId": userId,
    "type": type,
    "statusIn": statusIn,
    "sort": sort
  ] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Page", Page?.self, arguments: [
        "page": .variable("page"),
        "perPage": .variable("perPage")
      ]),
    ] }

    public var page: Page? { __data["Page"] }

    /// Page
    ///
    /// Parent Type: `Page`
    public struct Page: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Page }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("mediaList", [MediaList?]?.self, arguments: [
          "userId": .variable("userId"),
          "type": .variable("type"),
          "status_in": .variable("statusIn"),
          "sort": .variable("sort")
        ]),
        .field("pageInfo", PageInfo?.self),
      ] }

      public var mediaList: [MediaList?]? { __data["mediaList"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

      /// Page.MediaList
      ///
      /// Parent Type: `MediaList`
      public struct MediaList: AniListAPI.SelectionSet {
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

      /// Page.PageInfo
      ///
      /// Parent Type: `PageInfo`
      public struct PageInfo: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.PageInfo }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("hasNextPage", Bool?.self),
        ] }

        /// If there is another page
        public var hasNextPage: Bool? { __data["hasNextPage"] }
      }
    }
  }
}
