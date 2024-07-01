// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ReviewDetailsQuery: GraphQLQuery {
  public static let operationName: String = "ReviewDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query ReviewDetails($reviewId: Int) { Review(id: $reviewId) { __typename ...CommonReviewDetails } }"#,
      fragments: [CommonReviewDetails.self]
    ))

  public var reviewId: GraphQLNullable<Int>

  public init(reviewId: GraphQLNullable<Int>) {
    self.reviewId = reviewId
  }

  public var __variables: Variables? { ["reviewId": reviewId] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Review", Review?.self, arguments: ["id": .variable("reviewId")]),
    ] }

    /// Review query
    public var review: Review? { __data["Review"] }

    /// Review
    ///
    /// Parent Type: `Review`
    public struct Review: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Review }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(CommonReviewDetails.self),
      ] }

      /// The id of the review
      public var id: Int { __data["id"] }
      /// A short summary of the review
      public var summary: String? { __data["summary"] }
      /// The main review body text
      public var body: String? { __data["body"] }
      /// The review score of the media
      public var score: Int? { __data["score"] }
      /// The total user rating of the review
      public var rating: Int? { __data["rating"] }
      /// The amount of user ratings of the review
      public var ratingAmount: Int? { __data["ratingAmount"] }
      /// The rating of the review by currently authenticated user
      public var userRating: GraphQLEnum<AniListAPI.ReviewRating>? { __data["userRating"] }
      /// The creator of the review
      public var user: User? { __data["user"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var commonReviewDetails: CommonReviewDetails { _toFragment() }
      }

      public typealias User = CommonReviewDetails.User
    }
  }
}
