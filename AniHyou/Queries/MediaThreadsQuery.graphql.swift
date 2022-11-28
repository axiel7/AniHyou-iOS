// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class MediaThreadsQuery: GraphQLQuery {
  public static let operationName: String = "MediaThreads"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query MediaThreads($page: Int, $perPage: Int, $mediaCategoryId: Int, $sort: [ThreadSort]) {
        Page(page: $page, perPage: $perPage) {
          __typename
          threads(mediaCategoryId: $mediaCategoryId, sort: $sort) {
            __typename
            id
            title
            body(asHtml: true)
            viewCount
            replyCount
            likeCount
            createdAt
            user {
              __typename
              name
            }
          }
        }
      }
      """
    ))

  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>
  public var mediaCategoryId: GraphQLNullable<Int>
  public var sort: GraphQLNullable<[GraphQLEnum<API.ThreadSort>?]>

  public init(
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>,
    mediaCategoryId: GraphQLNullable<Int>,
    sort: GraphQLNullable<[GraphQLEnum<API.ThreadSort>?]>
  ) {
    self.page = page
    self.perPage = perPage
    self.mediaCategoryId = mediaCategoryId
    self.sort = sort
  }

  public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "mediaCategoryId": mediaCategoryId,
    "sort": sort
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
        .field("threads", [Thread?]?.self, arguments: [
          "mediaCategoryId": .variable("mediaCategoryId"),
          "sort": .variable("sort")
        ]),
      ] }

      public var threads: [Thread?]? { __data["threads"] }

      /// Page.Thread
      ///
      /// Parent Type: `Thread`
      public struct Thread: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { API.Objects.Thread }
        public static var __selections: [Selection] { [
          .field("id", Int.self),
          .field("title", String?.self),
          .field("body", String?.self, arguments: ["asHtml": true]),
          .field("viewCount", Int?.self),
          .field("replyCount", Int?.self),
          .field("likeCount", Int.self),
          .field("createdAt", Int.self),
          .field("user", User?.self),
        ] }

        /// The id of the thread
        public var id: Int { __data["id"] }
        /// The title of the thread
        public var title: String? { __data["title"] }
        /// The text body of the thread (Markdown)
        public var body: String? { __data["body"] }
        /// The number of times users have viewed the thread
        public var viewCount: Int? { __data["viewCount"] }
        /// The number of comments on the thread
        public var replyCount: Int? { __data["replyCount"] }
        /// The amount of likes the thread has
        public var likeCount: Int { __data["likeCount"] }
        /// The time of the thread creation
        public var createdAt: Int { __data["createdAt"] }
        /// The owner of the thread
        public var user: User? { __data["user"] }

        /// Page.Thread.User
        ///
        /// Parent Type: `User`
        public struct User: API.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { API.Objects.User }
          public static var __selections: [Selection] { [
            .field("name", String.self),
          ] }

          /// The name of the user
          public var name: String { __data["name"] }
        }
      }
    }
  }
}
