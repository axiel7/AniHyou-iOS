// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class SearchStudioQuery: GraphQLQuery {
  public static let operationName: String = "SearchStudio"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query SearchStudio($page: Int, $perPage: Int, $search: String) {
        Page(page: $page, perPage: $perPage) {
          __typename
          studios(search: $search, sort: SEARCH_MATCH) {
            __typename
            id
            name
          }
        }
      }
      """
    ))

  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>
  public var search: GraphQLNullable<String>

  public init(
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>,
    search: GraphQLNullable<String>
  ) {
    self.page = page
    self.perPage = perPage
    self.search = search
  }

  public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "search": search
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
        .field("studios", [Studio?]?.self, arguments: [
          "search": .variable("search"),
          "sort": "SEARCH_MATCH"
        ]),
      ] }

      public var studios: [Studio?]? { __data["studios"] }

      /// Page.Studio
      ///
      /// Parent Type: `Studio`
      public struct Studio: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { API.Objects.Studio }
        public static var __selections: [Selection] { [
          .field("id", Int.self),
          .field("name", String.self),
        ] }

        /// The id of the studio
        public var id: Int { __data["id"] }
        /// The name of the studio
        public var name: String { __data["name"] }
      }
    }
  }
}
