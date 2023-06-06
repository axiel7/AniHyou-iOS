// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SearchMediaQuery: GraphQLQuery {
  public static let operationName: String = "SearchMedia"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query SearchMedia($page: Int, $perPage: Int, $search: String, $type: MediaType, $sort: [MediaSort], $genre_in: [String], $tag_in: [String]) {
        Page(page: $page, perPage: $perPage) {
          __typename
          pageInfo {
            __typename
            hasNextPage
          }
          media(
            search: $search
            type: $type
            sort: $sort
            genre_in: $genre_in
            tag_in: $tag_in
          ) {
            __typename
            id
            title {
              __typename
              userPreferred
            }
            format
            coverImage {
              __typename
              large
            }
            startDate {
              __typename
              year
            }
          }
        }
      }
      """#
    ))

  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>
  public var search: GraphQLNullable<String>
  public var type: GraphQLNullable<GraphQLEnum<MediaType>>
  public var sort: GraphQLNullable<[GraphQLEnum<MediaSort>?]>
  public var genre_in: GraphQLNullable<[String?]>
  public var tag_in: GraphQLNullable<[String?]>

  public init(
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>,
    search: GraphQLNullable<String>,
    type: GraphQLNullable<GraphQLEnum<MediaType>>,
    sort: GraphQLNullable<[GraphQLEnum<MediaSort>?]>,
    genre_in: GraphQLNullable<[String?]>,
    tag_in: GraphQLNullable<[String?]>
  ) {
    self.page = page
    self.perPage = perPage
    self.search = search
    self.type = type
    self.sort = sort
    self.genre_in = genre_in
    self.tag_in = tag_in
  }

  public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "search": search,
    "type": type,
    "sort": sort,
    "genre_in": genre_in,
    "tag_in": tag_in
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
        .field("pageInfo", PageInfo?.self),
        .field("media", [Medium?]?.self, arguments: [
          "search": .variable("search"),
          "type": .variable("type"),
          "sort": .variable("sort"),
          "genre_in": .variable("genre_in"),
          "tag_in": .variable("tag_in")
        ]),
      ] }

      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }
      public var media: [Medium?]? { __data["media"] }

      /// Page.PageInfo
      ///
      /// Parent Type: `PageInfo`
      public struct PageInfo: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.PageInfo }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("hasNextPage", Bool?.self),
        ] }

        /// If there is another page
        public var hasNextPage: Bool? { __data["hasNextPage"] }
      }

      /// Page.Medium
      ///
      /// Parent Type: `Media`
      public struct Medium: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Media }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("title", Title?.self),
          .field("format", GraphQLEnum<AniListAPI.MediaFormat>?.self),
          .field("coverImage", CoverImage?.self),
          .field("startDate", StartDate?.self),
        ] }

        /// The id of the media
        public var id: Int { __data["id"] }
        /// The official titles of the media in various languages
        public var title: Title? { __data["title"] }
        /// The format the media was released in
        public var format: GraphQLEnum<AniListAPI.MediaFormat>? { __data["format"] }
        /// The cover images of the media
        public var coverImage: CoverImage? { __data["coverImage"] }
        /// The first official release date of the media
        public var startDate: StartDate? { __data["startDate"] }

        /// Page.Medium.Title
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

        /// Page.Medium.CoverImage
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

        /// Page.Medium.StartDate
        ///
        /// Parent Type: `FuzzyDate`
        public struct StartDate: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.FuzzyDate }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("year", Int?.self),
          ] }

          /// Numeric Year (2017)
          public var year: Int? { __data["year"] }
        }
      }
    }
  }
}
