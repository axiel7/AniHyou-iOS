// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class SearchCharacterQuery: GraphQLQuery {
  public static let operationName: String = "SearchCharacter"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query SearchCharacter($page: Int, $perPage: Int, $search: String) {
        Page(page: $page, perPage: $perPage) {
          __typename
          characters(search: $search, sort: SEARCH_MATCH) {
            __typename
            id
            name {
              __typename
              userPreferred
            }
            image {
              __typename
              medium
            }
          }
        }
      }
      """#
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
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Page }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("characters", [Character?]?.self, arguments: [
          "search": .variable("search"),
          "sort": "SEARCH_MATCH"
        ]),
      ] }

      public var characters: [Character?]? { __data["characters"] }

      /// Page.Character
      ///
      /// Parent Type: `Character`
      public struct Character: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.Character }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("id", Int.self),
          .field("name", Name?.self),
          .field("image", Image?.self),
        ] }

        /// The id of the character
        public var id: Int { __data["id"] }
        /// The names of the character
        public var name: Name? { __data["name"] }
        /// Character images
        public var image: Image? { __data["image"] }

        /// Page.Character.Name
        ///
        /// Parent Type: `CharacterName`
        public struct Name: API.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.CharacterName }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("userPreferred", String?.self),
          ] }

          /// The currently authenticated users preferred name language. Default romaji for non-authenticated
          public var userPreferred: String? { __data["userPreferred"] }
        }

        /// Page.Character.Image
        ///
        /// Parent Type: `CharacterImage`
        public struct Image: API.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.CharacterImage }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("medium", String?.self),
          ] }

          /// The character's image of media at medium size
          public var medium: String? { __data["medium"] }
        }
      }
    }
  }
}
