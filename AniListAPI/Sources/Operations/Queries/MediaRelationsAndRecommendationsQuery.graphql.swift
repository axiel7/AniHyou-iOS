// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct MediaRelationsAndRecommendationsQuery: GraphQLQuery {
  public static let operationName: String = "MediaRelationsAndRecommendations"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query MediaRelationsAndRecommendations($mediaId: Int) { Media(id: $mediaId) { __typename relations { __typename edges { __typename ...MediaRelated } } recommendations(page: 1, sort: RATING_DESC) { __typename nodes { __typename ...MediaRecommended } } } }"#,
      fragments: [MediaRecommended.self, MediaRelated.self]
    ))

  public var mediaId: GraphQLNullable<Int32>

  public init(mediaId: GraphQLNullable<Int32>) {
    self.mediaId = mediaId
  }

  @_spi(Unsafe) public var __variables: Variables? { ["mediaId": mediaId] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("Media", Media?.self, arguments: ["id": .variable("mediaId")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      MediaRelationsAndRecommendationsQuery.Data.self
    ] }

    /// Media query
    public var media: Media? { __data["Media"] }

    /// Media
    ///
    /// Parent Type: `Media`
    public struct Media: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("relations", Relations?.self),
        .field("recommendations", Recommendations?.self, arguments: [
          "page": 1,
          "sort": "RATING_DESC"
        ]),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        MediaRelationsAndRecommendationsQuery.Data.Media.self
      ] }

      /// Other media in the same or connecting franchise
      public var relations: Relations? { __data["relations"] }
      /// User recommendations for similar media
      public var recommendations: Recommendations? { __data["recommendations"] }

      /// Media.Relations
      ///
      /// Parent Type: `MediaConnection`
      public struct Relations: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaConnection }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge?]?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          MediaRelationsAndRecommendationsQuery.Data.Media.Relations.self
        ] }

        public var edges: [Edge?]? { __data["edges"] }

        /// Media.Relations.Edge
        ///
        /// Parent Type: `MediaEdge`
        public struct Edge: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaEdge }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(MediaRelated.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            MediaRelationsAndRecommendationsQuery.Data.Media.Relations.Edge.self,
            MediaRelated.self
          ] }

          /// The type of relation to the parent model
          public var relationType: GraphQLEnum<AniListAPI.MediaRelation>? { __data["relationType"] }
          public var node: Node? { __data["node"] }

          public struct Fragments: FragmentContainer {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            public var mediaRelated: MediaRelated { _toFragment() }
          }

          public typealias Node = MediaRelated.Node
        }
      }

      /// Media.Recommendations
      ///
      /// Parent Type: `RecommendationConnection`
      public struct Recommendations: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.RecommendationConnection }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("nodes", [Node?]?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          MediaRelationsAndRecommendationsQuery.Data.Media.Recommendations.self
        ] }

        public var nodes: [Node?]? { __data["nodes"] }

        /// Media.Recommendations.Node
        ///
        /// Parent Type: `Recommendation`
        public struct Node: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Recommendation }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(MediaRecommended.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            MediaRelationsAndRecommendationsQuery.Data.Media.Recommendations.Node.self,
            MediaRecommended.self
          ] }

          /// The recommended media
          public var mediaRecommendation: MediaRecommendation? { __data["mediaRecommendation"] }

          public struct Fragments: FragmentContainer {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            public var mediaRecommended: MediaRecommended { _toFragment() }
          }

          public typealias MediaRecommendation = MediaRecommended.MediaRecommendation
        }
      }
    }
  }
}
