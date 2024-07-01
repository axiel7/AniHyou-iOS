// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class RateReviewMutation: GraphQLMutation {
  public static let operationName: String = "RateReview"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation RateReview($reviewId: Int, $rating: ReviewRating) { RateReview(reviewId: $reviewId, rating: $rating) { __typename id rating ratingAmount userRating } }"#
    ))

  public var reviewId: GraphQLNullable<Int>
  public var rating: GraphQLNullable<GraphQLEnum<ReviewRating>>

  public init(
    reviewId: GraphQLNullable<Int>,
    rating: GraphQLNullable<GraphQLEnum<ReviewRating>>
  ) {
    self.reviewId = reviewId
    self.rating = rating
  }

  public var __variables: Variables? { [
    "reviewId": reviewId,
    "rating": rating
  ] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("RateReview", RateReview?.self, arguments: [
        "reviewId": .variable("reviewId"),
        "rating": .variable("rating")
      ]),
    ] }

    /// Rate a review
    public var rateReview: RateReview? { __data["RateReview"] }

    /// RateReview
    ///
    /// Parent Type: `Review`
    public struct RateReview: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Review }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("rating", Int?.self),
        .field("ratingAmount", Int?.self),
        .field("userRating", GraphQLEnum<AniListAPI.ReviewRating>?.self),
      ] }

      /// The id of the review
      public var id: Int { __data["id"] }
      /// The total user rating of the review
      public var rating: Int? { __data["rating"] }
      /// The amount of user ratings of the review
      public var ratingAmount: Int? { __data["ratingAmount"] }
      /// The rating of the review by currently authenticated user
      public var userRating: GraphQLEnum<AniListAPI.ReviewRating>? { __data["userRating"] }
    }
  }
}
