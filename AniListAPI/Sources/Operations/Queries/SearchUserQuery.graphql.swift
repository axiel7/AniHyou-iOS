// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SearchUserQuery: GraphQLQuery {
  public static let operationName: String = "SearchUser"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query SearchUser($page: Int, $perPage: Int, $search: String) {
        Page(page: $page, perPage: $perPage) {
          __typename
          users(search: $search, sort: SEARCH_MATCH) {
            __typename
            id
            name
            avatar {
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
        .field("users", [User?]?.self, arguments: [
          "search": .variable("search"),
          "sort": "SEARCH_MATCH"
        ]),
      ] }

      public var users: [User?]? { __data["users"] }

      /// Page.User
      ///
      /// Parent Type: `User`
      public struct User: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.User }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("name", String.self),
          .field("avatar", Avatar?.self),
        ] }

        /// The id of the user
        public var id: Int { __data["id"] }
        /// The name of the user
        public var name: String { __data["name"] }
        /// The user's avatar images
        public var avatar: Avatar? { __data["avatar"] }

        /// Page.User.Avatar
        ///
        /// Parent Type: `UserAvatar`
        public struct Avatar: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.UserAvatar }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("medium", String?.self),
          ] }

          /// The avatar of user at medium size
          public var medium: String? { __data["medium"] }
        }
      }
    }
  }
}
