// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class MediaReviewsQuery: GraphQLQuery {
  public static let operationName: String = "MediaReviews"
  public static let document: DocumentType = .notPersisted(
    definition: .init(
      """
      query MediaReviews($mediaId: Int, $page: Int, $perPage: Int) {
        Media(id: $mediaId) {
          __typename
          reviews(page: $page, perPage: $perPage, sort: RATING_DESC) {
            __typename
            nodes {
              __typename
              id
              summary
              score
              user {
                __typename
                name
              }
            }
          }
        }
      }
      """
    ))

  public var mediaId: GraphQLNullable<Int>
  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>

  public init(
    mediaId: GraphQLNullable<Int>,
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>
  ) {
    self.mediaId = mediaId
    self.page = page
    self.perPage = perPage
  }

  public var __variables: Variables? { [
    "mediaId": mediaId,
    "page": page,
    "perPage": perPage
  ] }

  public struct Data: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { API.Objects.Query }
    public static var __selections: [Selection] { [
      .field("Media", Media?.self, arguments: ["id": .variable("mediaId")]),
    ] }

    /// Media query
    public var media: Media? { __data["Media"] }

    /// Media
    ///
    /// Parent Type: `Media`
    public struct Media: API.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { API.Objects.Media }
      public static var __selections: [Selection] { [
        .field("reviews", Reviews?.self, arguments: [
          "page": .variable("page"),
          "perPage": .variable("perPage"),
          "sort": "RATING_DESC"
        ]),
      ] }

      /// User reviews of the media
      public var reviews: Reviews? { __data["reviews"] }

      /// Media.Reviews
      ///
      /// Parent Type: `ReviewConnection`
      public struct Reviews: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { API.Objects.ReviewConnection }
        public static var __selections: [Selection] { [
          .field("nodes", [Node?]?.self),
        ] }

        public var nodes: [Node?]? { __data["nodes"] }

        /// Media.Reviews.Node
        ///
        /// Parent Type: `Review`
        public struct Node: API.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { API.Objects.Review }
          public static var __selections: [Selection] { [
            .field("id", Int.self),
            .field("summary", String?.self),
            .field("score", Int?.self),
            .field("user", User?.self),
          ] }

          /// The id of the review
          public var id: Int { __data["id"] }
          /// A short summary of the review
          public var summary: String? { __data["summary"] }
          /// The review score of the media
          public var score: Int? { __data["score"] }
          /// The creator of the review
          public var user: User? { __data["user"] }

          /// Media.Reviews.Node.User
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
}
