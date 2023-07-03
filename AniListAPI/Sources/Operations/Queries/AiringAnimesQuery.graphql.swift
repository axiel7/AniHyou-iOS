// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AiringAnimesQuery: GraphQLQuery {
  public static let operationName: String = "AiringAnimes"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query AiringAnimes($page: Int, $perPage: Int, $sort: [AiringSort], $airingAtGreater: Int, $airingAtLesser: Int) {
        Page(page: $page, perPage: $perPage) {
          __typename
          airingSchedules(
            sort: $sort
            airingAt_greater: $airingAtGreater
            airingAt_lesser: $airingAtLesser
          ) {
            __typename
            id
            mediaId
            media {
              __typename
              title {
                __typename
                userPreferred
              }
              coverImage {
                __typename
                large
              }
              meanScore
              mediaListEntry {
                __typename
                status
              }
            }
            episode
            airingAt
          }
          pageInfo {
            __typename
            currentPage
            hasNextPage
          }
        }
      }
      """#
    ))

  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>
  public var sort: GraphQLNullable<[GraphQLEnum<AiringSort>?]>
  public var airingAtGreater: GraphQLNullable<Int>
  public var airingAtLesser: GraphQLNullable<Int>

  public init(
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>,
    sort: GraphQLNullable<[GraphQLEnum<AiringSort>?]>,
    airingAtGreater: GraphQLNullable<Int>,
    airingAtLesser: GraphQLNullable<Int>
  ) {
    self.page = page
    self.perPage = perPage
    self.sort = sort
    self.airingAtGreater = airingAtGreater
    self.airingAtLesser = airingAtLesser
  }

  public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "sort": sort,
    "airingAtGreater": airingAtGreater,
    "airingAtLesser": airingAtLesser
  ] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Query }
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

      public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Page }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("airingSchedules", [AiringSchedule?]?.self, arguments: [
          "sort": .variable("sort"),
          "airingAt_greater": .variable("airingAtGreater"),
          "airingAt_lesser": .variable("airingAtLesser")
        ]),
        .field("pageInfo", PageInfo?.self),
      ] }

      public var airingSchedules: [AiringSchedule?]? { __data["airingSchedules"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

      /// Page.AiringSchedule
      ///
      /// Parent Type: `AiringSchedule`
      public struct AiringSchedule: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.AiringSchedule }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("mediaId", Int.self),
          .field("media", Media?.self),
          .field("episode", Int.self),
          .field("airingAt", Int.self),
        ] }

        /// The id of the airing schedule item
        public var id: Int { __data["id"] }
        /// The associate media id of the airing episode
        public var mediaId: Int { __data["mediaId"] }
        /// The associate media of the airing episode
        public var media: Media? { __data["media"] }
        /// The airing episode number
        public var episode: Int { __data["episode"] }
        /// The time the episode airs at
        public var airingAt: Int { __data["airingAt"] }

        /// Page.AiringSchedule.Media
        ///
        /// Parent Type: `Media`
        public struct Media: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Media }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("title", Title?.self),
            .field("coverImage", CoverImage?.self),
            .field("meanScore", Int?.self),
            .field("mediaListEntry", MediaListEntry?.self),
          ] }

          /// The official titles of the media in various languages
          public var title: Title? { __data["title"] }
          /// The cover images of the media
          public var coverImage: CoverImage? { __data["coverImage"] }
          /// Mean score of all the user's scores of the media
          public var meanScore: Int? { __data["meanScore"] }
          /// The authenticated user's media list entry for the media
          public var mediaListEntry: MediaListEntry? { __data["mediaListEntry"] }

          /// Page.AiringSchedule.Media.Title
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

          /// Page.AiringSchedule.Media.CoverImage
          ///
          /// Parent Type: `MediaCoverImage`
          public struct CoverImage: AniListAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaCoverImage }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("large", String?.self),
            ] }

            /// The cover image url of the media at a large size
            public var large: String? { __data["large"] }
          }

          /// Page.AiringSchedule.Media.MediaListEntry
          ///
          /// Parent Type: `MediaList`
          public struct MediaListEntry: AniListAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaList }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("status", GraphQLEnum<AniListAPI.MediaListStatus>?.self),
            ] }

            /// The watching/reading status
            public var status: GraphQLEnum<AniListAPI.MediaListStatus>? { __data["status"] }
          }
        }
      }

      /// Page.PageInfo
      ///
      /// Parent Type: `PageInfo`
      public struct PageInfo: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.PageInfo }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("currentPage", Int?.self),
          .field("hasNextPage", Bool?.self),
        ] }

        /// The current page
        public var currentPage: Int? { __data["currentPage"] }
        /// If there is another page
        public var hasNextPage: Bool? { __data["hasNextPage"] }
      }
    }
  }
}
