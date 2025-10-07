// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct UserCurrentAnimeListQuery: GraphQLQuery {
  public static let operationName: String = "UserCurrentAnimeList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query UserCurrentAnimeList($userId: Int, $sort: [MediaListSort]) { Page(page: 1, perPage: 50) { __typename mediaList(userId: $userId, type: ANIME, status: CURRENT, sort: $sort) { __typename id mediaId progress progressVolumes media { __typename title { __typename userPreferred } nextAiringEpisode { __typename episode timeUntilAiring airingAt } status } } } }"#
    ))

  public var userId: GraphQLNullable<Int32>
  public var sort: GraphQLNullable<[GraphQLEnum<MediaListSort>?]>

  public init(
    userId: GraphQLNullable<Int32>,
    sort: GraphQLNullable<[GraphQLEnum<MediaListSort>?]>
  ) {
    self.userId = userId
    self.sort = sort
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "userId": userId,
    "sort": sort
  ] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("Page", Page?.self, arguments: [
        "page": 1,
        "perPage": 50
      ]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      UserCurrentAnimeListQuery.Data.self
    ] }

    public var page: Page? { __data["Page"] }

    /// Page
    ///
    /// Parent Type: `Page`
    public struct Page: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Page }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("mediaList", [MediaList?]?.self, arguments: [
          "userId": .variable("userId"),
          "type": "ANIME",
          "status": "CURRENT",
          "sort": .variable("sort")
        ]),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        UserCurrentAnimeListQuery.Data.Page.self
      ] }

      public var mediaList: [MediaList?]? { __data["mediaList"] }

      /// Page.MediaList
      ///
      /// Parent Type: `MediaList`
      public struct MediaList: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("mediaId", Int.self),
          .field("progress", Int?.self),
          .field("progressVolumes", Int?.self),
          .field("media", Media?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          UserCurrentAnimeListQuery.Data.Page.MediaList.self
        ] }

        /// The id of the list entry
        public var id: Int { __data["id"] }
        /// The id of the media
        public var mediaId: Int { __data["mediaId"] }
        /// The amount of episodes/chapters consumed by the user
        public var progress: Int? { __data["progress"] }
        /// The amount of volumes read by the user
        public var progressVolumes: Int? { __data["progressVolumes"] }
        public var media: Media? { __data["media"] }

        /// Page.MediaList.Media
        ///
        /// Parent Type: `Media`
        public struct Media: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("title", Title?.self),
            .field("nextAiringEpisode", NextAiringEpisode?.self),
            .field("status", GraphQLEnum<AniListAPI.MediaStatus>?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            UserCurrentAnimeListQuery.Data.Page.MediaList.Media.self
          ] }

          /// The official titles of the media in various languages
          public var title: Title? { __data["title"] }
          /// The media's next episode airing schedule
          public var nextAiringEpisode: NextAiringEpisode? { __data["nextAiringEpisode"] }
          /// The current releasing status of the media
          public var status: GraphQLEnum<AniListAPI.MediaStatus>? { __data["status"] }

          /// Page.MediaList.Media.Title
          ///
          /// Parent Type: `MediaTitle`
          public struct Title: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaTitle }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("userPreferred", String?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              UserCurrentAnimeListQuery.Data.Page.MediaList.Media.Title.self
            ] }

            /// The currently authenticated users preferred title language. Default romaji for non-authenticated
            public var userPreferred: String? { __data["userPreferred"] }
          }

          /// Page.MediaList.Media.NextAiringEpisode
          ///
          /// Parent Type: `AiringSchedule`
          public struct NextAiringEpisode: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.AiringSchedule }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("episode", Int.self),
              .field("timeUntilAiring", Int.self),
              .field("airingAt", Int.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              UserCurrentAnimeListQuery.Data.Page.MediaList.Media.NextAiringEpisode.self
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
