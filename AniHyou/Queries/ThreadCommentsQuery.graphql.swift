// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class ThreadCommentsQuery: GraphQLQuery {
  public static let operationName: String = "ThreadComments"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query ThreadComments($page: Int, $perPage: Int, $threadId: Int) {
        Page(page: $page, perPage: $perPage) {
          __typename
          threadComments(threadId: $threadId) {
            __typename
            id
            comment(asHtml: false)
            likeCount
            createdAt
            user {
              __typename
              name
            }
          }
          pageInfo {
            __typename
            currentPage
            hasNextPage
          }
        }
      }
      """#
    ))

  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>
  public var threadId: GraphQLNullable<Int>

  public init(
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>,
    threadId: GraphQLNullable<Int>
  ) {
    self.page = page
    self.perPage = perPage
    self.threadId = threadId
  }

  public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "threadId": threadId
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
        .field("threadComments", [ThreadComment?]?.self, arguments: ["threadId": .variable("threadId")]),
        .field("pageInfo", PageInfo?.self),
      ] }

      public var threadComments: [ThreadComment?]? { __data["threadComments"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

      /// Page.ThreadComment
      ///
      /// Parent Type: `ThreadComment`
      public struct ThreadComment: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.ThreadComment }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("id", Int.self),
          .field("comment", String?.self, arguments: ["asHtml": false]),
          .field("likeCount", Int.self),
          .field("createdAt", Int.self),
          .field("user", User?.self),
        ] }

        /// The id of the comment
        public var id: Int { __data["id"] }
        /// The text content of the comment (Markdown)
        public var comment: String? { __data["comment"] }
        /// The amount of likes the comment has
        public var likeCount: Int { __data["likeCount"] }
        /// The time of the comments creation
        public var createdAt: Int { __data["createdAt"] }
        /// The user who created the comment
        public var user: User? { __data["user"] }

        /// Page.ThreadComment.User
        ///
        /// Parent Type: `User`
        public struct User: API.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.User }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("name", String.self),
          ] }

          /// The name of the user
          public var name: String { __data["name"] }
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
