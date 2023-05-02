// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class AnimesQuery: GraphQLQuery {
  public static let operationName: String = "Animes"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query Animes($page: Int, $perPage: Int, $sort: [MediaSort]) {
        Page(page: $page, perPage: $perPage) {
          __typename
          media(type: ANIME, sort: $sort) {
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
            meanScore
          }
        }
      }
      """#
    ))

  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>
  public var sort: GraphQLNullable<[GraphQLEnum<API.MediaSort>?]>

  public init(
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>,
    sort: GraphQLNullable<[GraphQLEnum<API.MediaSort>?]>
  ) {
    self.page = page
    self.perPage = perPage
    self.sort = sort
  }

  public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "sort": sort
  ] }

  public struct Data: API.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { API.Objects.Query }
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
    public struct Page: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Page }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("media", [Medium?]?.self, arguments: [
          "type": "ANIME",
          "sort": .variable("sort")
        ]),
      ] }

      public var media: [Medium?]? { __data["media"] }

      /// Page.Medium
      ///
      /// Parent Type: `Media`
      public struct Medium: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.Media }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("title", Title?.self),
          .field("coverImage", CoverImage?.self),
          .field("meanScore", Int?.self),
        ] }

        /// The id of the media
        public var id: Int { __data["id"] }
        /// The official titles of the media in various languages
        public var title: Title? { __data["title"] }
        /// The cover images of the media
        public var coverImage: CoverImage? { __data["coverImage"] }
        /// Mean score of all the user's scores of the media
        public var meanScore: Int? { __data["meanScore"] }

        /// Page.Medium.Title
        ///
        /// Parent Type: `MediaTitle`
        public struct Title: API.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaTitle }
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
        public struct CoverImage: API.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaCoverImage }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("large", String?.self),
          ] }

          /// The cover image url of the media at a large size
          public var large: String? { __data["large"] }
        }
      }
    }
  }
}
