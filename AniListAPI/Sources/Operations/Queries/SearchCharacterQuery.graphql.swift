// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SearchCharacterQuery: GraphQLQuery {
  public static let operationName: String = "SearchCharacter"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query SearchCharacter($page: Int, $perPage: Int, $search: String) { Page(page: $page, perPage: $perPage) { __typename characters(search: $search, sort: SEARCH_MATCH) { __typename id name { __typename userPreferred } image { __typename medium } } pageInfo { __typename hasNextPage } } }"#
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
        .field("characters", [Character?]?.self, arguments: [
          "search": .variable("search"),
          "sort": "SEARCH_MATCH"
        ]),
        .field("pageInfo", PageInfo?.self),
      ] }

      public var characters: [Character?]? { __data["characters"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

      /// Page.Character
      ///
      /// Parent Type: `Character`
      public struct Character: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Character }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
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
        public struct Name: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.CharacterName }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("userPreferred", String?.self),
          ] }

          /// The currently authenticated users preferred name language. Default romaji for non-authenticated
          public var userPreferred: String? { __data["userPreferred"] }
        }

        /// Page.Character.Image
        ///
        /// Parent Type: `CharacterImage`
        public struct Image: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.CharacterImage }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("medium", String?.self),
          ] }

          /// The character's image of media at medium size
          public var medium: String? { __data["medium"] }
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
          .field("hasNextPage", Bool?.self),
        ] }

        /// If there is another page
        public var hasNextPage: Bool? { __data["hasNextPage"] }
      }
    }
  }
}
