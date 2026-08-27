// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct SaveRecommendationMutation: GraphQLMutation {
  public static let operationName: String = "SaveRecommendation"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation SaveRecommendation($mediaId: Int, $mediaRecommendationId: Int, $rating: RecommendationRating) { SaveRecommendation( mediaId: $mediaId mediaRecommendationId: $mediaRecommendationId rating: $rating ) { __typename id rating userRating } }"#
    ))

  public var mediaId: GraphQLNullable<Int32>
  public var mediaRecommendationId: GraphQLNullable<Int32>
  public var rating: GraphQLNullable<GraphQLEnum<RecommendationRating>>

  public init(
    mediaId: GraphQLNullable<Int32>,
    mediaRecommendationId: GraphQLNullable<Int32>,
    rating: GraphQLNullable<GraphQLEnum<RecommendationRating>>
  ) {
    self.mediaId = mediaId
    self.mediaRecommendationId = mediaRecommendationId
    self.rating = rating
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "mediaId": mediaId,
    "mediaRecommendationId": mediaRecommendationId,
    "rating": rating
  ] }

  nonisolated public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("SaveRecommendation", SaveRecommendation?.self, arguments: [
        "mediaId": .variable("mediaId"),
        "mediaRecommendationId": .variable("mediaRecommendationId"),
        "rating": .variable("rating")
      ]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      SaveRecommendationMutation.Data.self
    ] }

    /// Recommendation a media
    public var saveRecommendation: SaveRecommendation? { __data["SaveRecommendation"] }

    /// SaveRecommendation
    ///
    /// Parent Type: `Recommendation`
    nonisolated public struct SaveRecommendation: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Recommendation }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("rating", Int?.self),
        .field("userRating", GraphQLEnum<AniListAPI.RecommendationRating>?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        SaveRecommendationMutation.Data.SaveRecommendation.self
      ] }

      /// The id of the recommendation
      public var id: Int { __data["id"] }
      /// Users rating of the recommendation
      public var rating: Int? { __data["rating"] }
      /// The rating of the recommendation by currently authenticated user
      public var userRating: GraphQLEnum<AniListAPI.RecommendationRating>? { __data["userRating"] }
    }
  }
}
