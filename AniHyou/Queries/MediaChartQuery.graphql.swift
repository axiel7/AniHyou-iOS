// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI
@_exported import enum ApolloAPI.GraphQLEnum
@_exported import enum ApolloAPI.GraphQLNullable
import API

public class MediaChartQuery: GraphQLQuery {
  public static let operationName: String = "MediaChart"
  public static let document: DocumentType = .notPersisted(
    definition: .init(
      """
      query MediaChart($page: Int, $perPage: Int, $sort: [MediaSort], $type: MediaType) {
        Page(page: $page, perPage: $perPage) {
          __typename
          media(sort: $sort, type: $type) {
            __typename
            id
            title {
              __typename
              userPreferred
            }
            format
            startDate {
              __typename
              year
            }
            coverImage {
              __typename
              large
            }
          }
          pageInfo {
            __typename
            hasNextPage
            currentPage
          }
        }
      }
      """
    ))

  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>
  public var sort: GraphQLNullable<[GraphQLEnum<API.MediaSort>?]>
  public var type: GraphQLNullable<GraphQLEnum<API.MediaType>>

  public init(
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>,
    sort: GraphQLNullable<[GraphQLEnum<API.MediaSort>?]>,
    type: GraphQLNullable<GraphQLEnum<API.MediaType>>
  ) {
    self.page = page
    self.perPage = perPage
    self.sort = sort
    self.type = type
  }

  public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "sort": sort,
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
        .field("media", [Medium?]?.self, arguments: [
          "sort": .variable("sort"),
          "type": .variable("type")
        ]),
        .field("pageInfo", PageInfo?.self),
      ] }

      public var media: [Medium?]? { __data["media"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

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
          .field("startDate", StartDate?.self),
          .field("coverImage", CoverImage?.self),
        ] }

        /// The id of the media
        public var id: Int { __data["id"] }
        /// The official titles of the media in various languages
        public var title: Title? { __data["title"] }
        /// The format the media was released in
        public var format: GraphQLEnum<API.MediaFormat>? { __data["format"] }
        /// The first official release date of the media
        public var startDate: StartDate? { __data["startDate"] }
        /// The cover images of the media
        public var coverImage: CoverImage? { __data["coverImage"] }

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
          .field("currentPage", Int?.self),
        ] }

        /// If there is another page
        public var hasNextPage: Bool? { __data["hasNextPage"] }
        /// The current page
        public var currentPage: Int? { __data["currentPage"] }
      }
    }
  }
}
