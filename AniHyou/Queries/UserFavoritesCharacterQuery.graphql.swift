// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class UserFavoritesCharacterQuery: GraphQLQuery {
  public static let operationName: String = "UserFavoritesCharacter"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query UserFavoritesCharacter($userId: Int, $page: Int, $perPage: Int) {
        User(id: $userId) {
          __typename
          favourites {
            __typename
            characters(page: $page, perPage: $perPage) {
              __typename
              nodes {
                __typename
                id
                name {
                  __typename
                  userPreferred
                }
                image {
                  __typename
                  large
                }
              }
              pageInfo {
                __typename
                currentPage
                hasNextPage
              }
            }
          }
        }
      }
      """#
    ))

  public var userId: GraphQLNullable<Int>
  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>

  public init(
    userId: GraphQLNullable<Int>,
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>
  ) {
    self.userId = userId
    self.page = page
    self.perPage = perPage
  }

  public var __variables: Variables? { [
    "userId": userId,
    "page": page,
    "perPage": perPage
  ] }

  public struct Data: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ApolloAPI.ParentType { API.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("User", User?.self, arguments: ["id": .variable("userId")]),
    ] }

    /// User query
    public var user: User? { __data["User"] }

    /// User
    ///
    /// Parent Type: `User`
    public struct User: API.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("favourites", Favourites?.self),
      ] }

      /// The users favourites
      public var favourites: Favourites? { __data["favourites"] }

      /// User.Favourites
      ///
      /// Parent Type: `Favourites`
      public struct Favourites: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.Favourites }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("characters", Characters?.self, arguments: [
            "page": .variable("page"),
            "perPage": .variable("perPage")
          ]),
        ] }

        /// Favourite characters
        public var characters: Characters? { __data["characters"] }

        /// User.Favourites.Characters
        ///
        /// Parent Type: `CharacterConnection`
        public struct Characters: API.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.CharacterConnection }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("nodes", [Node?]?.self),
            .field("pageInfo", PageInfo?.self),
          ] }

          public var nodes: [Node?]? { __data["nodes"] }
          /// The pagination information
          public var pageInfo: PageInfo? { __data["pageInfo"] }

          /// User.Favourites.Characters.Node
          ///
          /// Parent Type: `Character`
          public struct Node: API.SelectionSet {
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

            /// User.Favourites.Characters.Node.Name
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

            /// User.Favourites.Characters.Node.Image
            ///
            /// Parent Type: `CharacterImage`
            public struct Image: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.CharacterImage }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("large", String?.self),
              ] }

              /// The character's image of media at its largest size
              public var large: String? { __data["large"] }
            }
          }

          /// User.Favourites.Characters.PageInfo
          ///
          /// Parent Type: `PageInfo`
          public struct PageInfo: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.PageInfo }
            public static var __selections: [ApolloAPI.Selection] { [
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
  }
}
