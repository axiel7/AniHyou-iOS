// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class SearchMediaQuery: GraphQLQuery {
  public static let operationName: String = "SearchMedia"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query SearchMedia($page: Int, $perPage: Int, $search: String, $type: MediaType) {
        Page(page: $page, perPage: $perPage) {
          __typename
          pageInfo {
            __typename
            hasNextPage
          }
          media(search: $search, type: $type, sort: SEARCH_MATCH) {
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
      """
    ))

  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>
  public var search: GraphQLNullable<String>
  public var type: GraphQLNullable<GraphQLEnum<API.MediaType>>

  public init(
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>,
    search: GraphQLNullable<String>,
    type: GraphQLNullable<GraphQLEnum<API.MediaType>>
  ) {
    self.page = page
    self.perPage = perPage
    self.search = search
    self.type = type
  }

  public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "search": search,
    "type": type
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
        .field("pageInfo", PageInfo?.self),
        .field("media", [Medium?]?.self, arguments: [
          "search": .variable("search"),
          "type": .variable("type"),
          "sort": "SEARCH_MATCH"
        ]),
      ] }

      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }
      public var media: [Medium?]? { __data["media"] }

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

      /// Page.Medium
      ///
      /// Parent Type: `Media`
      public struct Medium: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { API.Objects.Media }
        public static var __selections: [Selection] { [
          .field("id", Int.self),
          .field("title", Title?.self),
          .field("format", GraphQLEnum<API.MediaFormat>?.self),
          .field("coverImage", CoverImage?.self),
          .field("startDate", StartDate?.self),
        ] }

        /// The id of the media
        public var id: Int { __data["id"] }
        /// The official titles of the media in various languages
        public var title: Title? { __data["title"] }
        /// The format the media was released in
        public var format: GraphQLEnum<API.MediaFormat>? { __data["format"] }
        /// The cover images of the media
        public var coverImage: CoverImage? { __data["coverImage"] }
        /// The first official release date of the media
        public var startDate: StartDate? { __data["startDate"] }

        /// Page.Medium.Title
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

        /// Page.Medium.CoverImage
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

        /// Page.Medium.StartDate
        ///
        /// Parent Type: `FuzzyDate`
        public struct StartDate: API.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { API.Objects.FuzzyDate }
          public static var __selections: [Selection] { [
            .field("year", Int?.self),
          ] }

          /// Numeric Year (2017)
          public var year: Int? { __data["year"] }
        }
      }
    }
  }
}
