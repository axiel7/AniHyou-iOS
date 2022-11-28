// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class UserMediaListQuery: GraphQLQuery {
  public static let operationName: String = "UserMediaList"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query UserMediaList($page: Int, $perPage: Int, $userId: Int, $type: MediaType, $status: MediaListStatus, $sort: [MediaListSort]) {
        Page(page: $page, perPage: $perPage) {
          __typename
          mediaList(userId: $userId, type: $type, status: $status, sort: $sort) {
            __typename
            id
            mediaId
            status
            score
            progress
            progressVolumes
            media {
              __typename
              title {
                __typename
                userPreferred
              }
              episodes
              chapters
              volumes
              coverImage {
                __typename
                large
              }
              nextAiringEpisode {
                __typename
                episode
                timeUntilAiring
              }
              status
              type
            }
          }
          pageInfo {
            __typename
            hasNextPage
          }
        }
      }
      """
    ))

  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>
  public var userId: GraphQLNullable<Int>
  public var type: GraphQLNullable<GraphQLEnum<API.MediaType>>
  public var status: GraphQLNullable<GraphQLEnum<API.MediaListStatus>>
  public var sort: GraphQLNullable<[GraphQLEnum<API.MediaListSort>?]>

  public init(
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>,
    userId: GraphQLNullable<Int>,
    type: GraphQLNullable<GraphQLEnum<API.MediaType>>,
    status: GraphQLNullable<GraphQLEnum<API.MediaListStatus>>,
    sort: GraphQLNullable<[GraphQLEnum<API.MediaListSort>?]>
  ) {
    self.page = page
    self.perPage = perPage
    self.userId = userId
    self.type = type
    self.status = status
    self.sort = sort
  }

  public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "userId": userId,
    "type": type,
    "status": status,
    "sort": sort
  ] }

  public struct Data: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { API.Objects.Query }
    public static var __selections: [Selection] { [
      .field("Page", Page?.self, arguments: [
        "page": .variable("page"),
        "perPage": .variable("perPage")
      ]),
    ] }

    public var page: Page? { __data["Page"] }

    /// Page
    ///
    /// Parent Type: `Page`
    public struct Page: API.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { API.Objects.Page }
      public static var __selections: [Selection] { [
        .field("mediaList", [MediaList?]?.self, arguments: [
          "userId": .variable("userId"),
          "type": .variable("type"),
          "status": .variable("status"),
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
      public struct MediaList: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { API.Objects.MediaList }
        public static var __selections: [Selection] { [
          .field("id", Int.self),
          .field("mediaId", Int.self),
          .field("status", GraphQLEnum<API.MediaListStatus>?.self),
          .field("score", Double?.self),
          .field("progress", Int?.self),
          .field("progressVolumes", Int?.self),
          .field("media", Media?.self),
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
        public var media: Media? { __data["media"] }

        /// Page.MediaList.Media
        ///
        /// Parent Type: `Media`
        public struct Media: API.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { API.Objects.Media }
          public static var __selections: [Selection] { [
            .field("title", Title?.self),
            .field("episodes", Int?.self),
            .field("chapters", Int?.self),
            .field("volumes", Int?.self),
            .field("coverImage", CoverImage?.self),
            .field("nextAiringEpisode", NextAiringEpisode?.self),
            .field("status", GraphQLEnum<API.MediaStatus>?.self),
            .field("type", GraphQLEnum<API.MediaType>?.self),
          ] }

          /// The official titles of the media in various languages
          public var title: Title? { __data["title"] }
          /// The amount of episodes the anime has when complete
          public var episodes: Int? { __data["episodes"] }
          /// The amount of chapters the manga has when complete
          public var chapters: Int? { __data["chapters"] }
          /// The amount of volumes the manga has when complete
          public var volumes: Int? { __data["volumes"] }
          /// The cover images of the media
          public var coverImage: CoverImage? { __data["coverImage"] }
          /// The media's next episode airing schedule
          public var nextAiringEpisode: NextAiringEpisode? { __data["nextAiringEpisode"] }
          /// The current releasing status of the media
          public var status: GraphQLEnum<API.MediaStatus>? { __data["status"] }
          /// The type of the media; anime or manga
          public var type: GraphQLEnum<API.MediaType>? { __data["type"] }

          /// Page.MediaList.Media.Title
          ///
          /// Parent Type: `MediaTitle`
          public struct Title: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { API.Objects.MediaTitle }
            public static var __selections: [Selection] { [
              .field("userPreferred", String?.self),
            ] }

            /// The currently authenticated users preferred title language. Default romaji for non-authenticated
            public var userPreferred: String? { __data["userPreferred"] }
          }

          /// Page.MediaList.Media.CoverImage
          ///
          /// Parent Type: `MediaCoverImage`
          public struct CoverImage: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { API.Objects.MediaCoverImage }
            public static var __selections: [Selection] { [
              .field("large", String?.self),
            ] }

            /// The cover image url of the media at a large size
            public var large: String? { __data["large"] }
          }

          /// Page.MediaList.Media.NextAiringEpisode
          ///
          /// Parent Type: `AiringSchedule`
          public struct NextAiringEpisode: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { API.Objects.AiringSchedule }
            public static var __selections: [Selection] { [
              .field("episode", Int.self),
              .field("timeUntilAiring", Int.self),
            ] }

            /// The airing episode number
            public var episode: Int { __data["episode"] }
            /// Seconds until episode starts airing
            public var timeUntilAiring: Int { __data["timeUntilAiring"] }
          }
        }
      }

      /// Page.PageInfo
      ///
      /// Parent Type: `PageInfo`
      public struct PageInfo: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { API.Objects.PageInfo }
        public static var __selections: [Selection] { [
          .field("hasNextPage", Bool?.self),
        ] }

        /// If there is another page
        public var hasNextPage: Bool? { __data["hasNextPage"] }
      }
    }
  }
}
