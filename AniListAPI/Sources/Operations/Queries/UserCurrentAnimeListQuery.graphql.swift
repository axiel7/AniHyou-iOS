// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UserCurrentAnimeListQuery: GraphQLQuery {
  public static let operationName: String = "UserCurrentAnimeList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"""
      query UserCurrentAnimeList($userId: Int) {
        Page(page: 1, perPage: 50) {
          __typename
          mediaList(
            userId: $userId
            type: ANIME
            status: CURRENT
            sort: UPDATED_TIME_DESC
          ) {
            __typename
            mediaId
            progress
            media {
              __typename
              title {
                __typename
                userPreferred
              }
              episodes
              nextAiringEpisode {
                __typename
                episode
                timeUntilAiring
                airingAt
              }
              status
            }
          }
        }
      }
      """#
    ))

  public var userId: GraphQLNullable<Int>

  public init(userId: GraphQLNullable<Int>) {
    self.userId = userId
  }

  public var __variables: Variables? { ["userId": userId] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Page", Page?.self, arguments: [
        "page": 1,
        "perPage": 50
      ]),
    ] }

    public var page: Page? { __data["Page"] }

    /// Page
    ///
    /// Parent Type: `Page`
    public struct Page: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Page }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("mediaList", [MediaList?]?.self, arguments: [
          "userId": .variable("userId"),
          "type": "ANIME",
          "status": "CURRENT",
          "sort": "UPDATED_TIME_DESC"
        ]),
      ] }

      public var mediaList: [MediaList?]? { __data["mediaList"] }

      /// Page.MediaList
      ///
      /// Parent Type: `MediaList`
      public struct MediaList: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("mediaId", Int.self),
          .field("progress", Int?.self),
          .field("media", Media?.self),
        ] }

        /// The id of the media
        public var mediaId: Int { __data["mediaId"] }
        /// The amount of episodes/chapters consumed by the user
        public var progress: Int? { __data["progress"] }
        public var media: Media? { __data["media"] }

        /// Page.MediaList.Media
        ///
        /// Parent Type: `Media`
        public struct Media: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Media }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("title", Title?.self),
            .field("episodes", Int?.self),
            .field("nextAiringEpisode", NextAiringEpisode?.self),
            .field("status", GraphQLEnum<AniListAPI.MediaStatus>?.self),
          ] }

          /// The official titles of the media in various languages
          public var title: Title? { __data["title"] }
          /// The amount of episodes the anime has when complete
          public var episodes: Int? { __data["episodes"] }
          /// The media's next episode airing schedule
          public var nextAiringEpisode: NextAiringEpisode? { __data["nextAiringEpisode"] }
          /// The current releasing status of the media
          public var status: GraphQLEnum<AniListAPI.MediaStatus>? { __data["status"] }

          /// Page.MediaList.Media.Title
          ///
          /// Parent Type: `MediaTitle`
          public struct Title: AniListAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaTitle }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("userPreferred", String?.self),
            ] }

            /// The currently authenticated users preferred title language. Default romaji for non-authenticated
            public var userPreferred: String? { __data["userPreferred"] }
          }

          /// Page.MediaList.Media.NextAiringEpisode
          ///
          /// Parent Type: `AiringSchedule`
          public struct NextAiringEpisode: AniListAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.AiringSchedule }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("episode", Int.self),
              .field("timeUntilAiring", Int.self),
              .field("airingAt", Int.self),
            ] }

            /// The airing episode number
            public var episode: Int { __data["episode"] }
            /// Seconds until episode starts airing
            public var timeUntilAiring: Int { __data["timeUntilAiring"] }
            /// The time the episode airs at
            public var airingAt: Int { __data["airingAt"] }
          }
        }
      }
    }
  }
}
