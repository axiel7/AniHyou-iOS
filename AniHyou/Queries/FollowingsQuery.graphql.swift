// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class FollowingsQuery: GraphQLQuery {
  public static let operationName: String = "Followings"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query Followings($userId: Int!, $page: Int, $perPage: Int) {
        Page(page: $page, perPage: $perPage) {
          __typename
          following(userId: $userId) {
            __typename
            ...UserFollow
          }
          pageInfo {
            __typename
            currentPage
            hasNextPage
          }
        }
      }
      """#,
      fragments: [UserFollow.self]
    ))

  public var userId: Int
  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>

  public init(
    userId: Int,
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
        .field("following", [Following?]?.self, arguments: ["userId": .variable("userId")]),
        .field("pageInfo", PageInfo?.self),
      ] }

      public var following: [Following?]? { __data["following"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

      /// Page.Following
      ///
      /// Parent Type: `User`
      public struct Following: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.User }
        public static var __selections: [ApolloAPI.Selection] { [
          .fragment(UserFollow.self),
        ] }

        /// The id of the user
        public var id: Int { __data["id"] }
        /// The name of the user
        public var name: String { __data["name"] }
        /// The user's avatar images
        public var avatar: UserFollow.Avatar? { __data["avatar"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public var userFollow: UserFollow { _toFragment() }
        }
      }

      /// Page.PageInfo
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
