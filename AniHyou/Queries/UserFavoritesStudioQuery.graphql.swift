// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class UserFavoritesStudioQuery: GraphQLQuery {
  public static let operationName: String = "UserFavoritesStudio"
  public static let document: DocumentType = .notPersisted(
    definition: .init(
      """
      query UserFavoritesStudio($userId: Int, $page: Int, $perPage: Int) {
        User(id: $userId) {
          __typename
          favourites {
            __typename
            studios(page: $page, perPage: $perPage) {
              __typename
              nodes {
                __typename
                id
                name
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
      """
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

    public static var __parentType: ParentType { API.Objects.Query }
    public static var __selections: [Selection] { [
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

      public static var __parentType: ParentType { API.Objects.User }
      public static var __selections: [Selection] { [
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

        public static var __parentType: ParentType { API.Objects.Favourites }
        public static var __selections: [Selection] { [
          .field("studios", Studios?.self, arguments: [
            "page": .variable("page"),
            "perPage": .variable("perPage")
          ]),
        ] }

        /// Favourite studios
        public var studios: Studios? { __data["studios"] }

        /// User.Favourites.Studios
        ///
        /// Parent Type: `StudioConnection`
        public struct Studios: API.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { API.Objects.StudioConnection }
          public static var __selections: [Selection] { [
            .field("nodes", [Node?]?.self),
            .field("pageInfo", PageInfo?.self),
          ] }

          public var nodes: [Node?]? { __data["nodes"] }
          /// The pagination information
          public var pageInfo: PageInfo? { __data["pageInfo"] }

          /// User.Favourites.Studios.Node
          ///
          /// Parent Type: `Studio`
          public struct Node: API.SelectionSet {
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

          /// User.Favourites.Studios.PageInfo
          ///
          /// Parent Type: `PageInfo`
          public struct PageInfo: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { API.Objects.PageInfo }
            public static var __selections: [Selection] { [
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
