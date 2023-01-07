// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class AiringAnimesQuery: GraphQLQuery {
  public static let operationName: String = "AiringAnimes"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query AiringAnimes($page: Int, $perPage: Int, $sort: [AiringSort], $airingAtGreater: Int, $airingAtLesser: Int) {
        Page(page: $page, perPage: $perPage) {
          __typename
          airingSchedules(
            sort: $sort
            airingAt_greater: $airingAtGreater
            airingAt_lesser: $airingAtLesser
          ) {
            __typename
            media {
              __typename
              id
              title {
                __typename
                userPreferred
              }
              coverImage {
                __typename
                large
              }
            }
            timeUntilAiring
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
  public var sort: GraphQLNullable<[GraphQLEnum<API.AiringSort>?]>
  public var airingAtGreater: GraphQLNullable<Int>
  public var airingAtLesser: GraphQLNullable<Int>

  public init(
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>,
    sort: GraphQLNullable<[GraphQLEnum<API.AiringSort>?]>,
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
      public struct AiringSchedule: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { API.Objects.AiringSchedule }
        public static var __selections: [Selection] { [
          .field("media", Media?.self),
          .field("timeUntilAiring", Int.self),
        ] }

        /// The associate media of the airing episode
        public var media: Media? { __data["media"] }
        /// Seconds until episode starts airing
        public var timeUntilAiring: Int { __data["timeUntilAiring"] }

        /// Page.AiringSchedule.Media
        ///
        /// Parent Type: `Media`
        public struct Media: API.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { API.Objects.Media }
          public static var __selections: [Selection] { [
            .field("id", Int.self),
            .field("title", Title?.self),
            .field("coverImage", CoverImage?.self),
          ] }

          /// The id of the media
          public var id: Int { __data["id"] }
          /// The official titles of the media in various languages
          public var title: Title? { __data["title"] }
          /// The cover images of the media
          public var coverImage: CoverImage? { __data["coverImage"] }

          /// Page.AiringSchedule.Media.Title
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

          /// Page.AiringSchedule.Media.CoverImage
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
