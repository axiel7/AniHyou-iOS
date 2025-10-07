// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct RateReviewMutation: GraphQLMutation {
  public static let operationName: String = "RateReview"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation RateReview($reviewId: Int, $rating: ReviewRating) { RateReview(reviewId: $reviewId, rating: $rating) { __typename id rating ratingAmount userRating } }"#
    ))

  public var reviewId: GraphQLNullable<Int32>
  public var rating: GraphQLNullable<GraphQLEnum<ReviewRating>>

  public init(
    reviewId: GraphQLNullable<Int32>,
    rating: GraphQLNullable<GraphQLEnum<ReviewRating>>
  ) {
    self.reviewId = reviewId
    self.rating = rating
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "reviewId": reviewId,
    "rating": rating
  ] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("RateReview", RateReview?.self, arguments: [
        "reviewId": .variable("reviewId"),
        "rating": .variable("rating")
      ]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      RateReviewMutation.Data.self
    ] }

    /// Rate a review
    public var rateReview: RateReview? { __data["RateReview"] }

    /// RateReview
    ///
    /// Parent Type: `Review`
    public struct RateReview: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Review }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("rating", Int?.self),
        .field("ratingAmount", Int?.self),
        .field("userRating", GraphQLEnum<AniListAPI.ReviewRating>?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        RateReviewMutation.Data.RateReview.self
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
