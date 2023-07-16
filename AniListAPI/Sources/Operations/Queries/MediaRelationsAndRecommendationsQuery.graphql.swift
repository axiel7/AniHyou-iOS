// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class MediaRelationsAndRecommendationsQuery: GraphQLQuery {
  public static let operationName: String = "MediaRelationsAndRecommendations"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"""
      query MediaRelationsAndRecommendations($mediaId: Int) {
        Media(id: $mediaId) {
          __typename
          relations {
            __typename
            edges {
              __typename
              ...MediaRelated
            }
          }
          recommendations(page: 1, sort: RATING_DESC) {
            __typename
            nodes {
              __typename
              ...MediaRecommended
            }
          }
        }
      }
      """#,
      fragments: [MediaRelated.self, MediaRecommended.self]
    ))

  public var mediaId: GraphQLNullable<Int>

  public init(mediaId: GraphQLNullable<Int>) {
    self.mediaId = mediaId
  }

  public var __variables: Variables? { ["mediaId": mediaId] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Media", Media?.self, arguments: ["id": .variable("mediaId")]),
    ] }

    /// Media query
    public var media: Media? { __data["Media"] }

    /// Media
    ///
    /// Parent Type: `Media`
    public struct Media: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Media }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("relations", Relations?.self),
        .field("recommendations", Recommendations?.self, arguments: [
          "page": 1,
          "sort": "RATING_DESC"
        ]),
      ] }

      /// Other media in the same or connecting franchise
      public var relations: Relations? { __data["relations"] }
      /// User recommendations for similar media
      public var recommendations: Recommendations? { __data["recommendations"] }

      /// Media.Relations
      ///
      /// Parent Type: `MediaConnection`
      public struct Relations: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("edges", [Edge?]?.self),
        ] }

        public var edges: [Edge?]? { __data["edges"] }

        /// Media.Relations.Edge
        ///
        /// Parent Type: `MediaEdge`
        public struct Edge: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MediaEdge }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(MediaRelated.self),
          ] }

          /// The type of relation to the parent model
          public var relationType: GraphQLEnum<AniListAPI.MediaRelation>? { __data["relationType"] }
          public var node: MediaRelated.Node? { __data["node"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var mediaRelated: MediaRelated { _toFragment() }
          }
        }
      }

      /// Media.Recommendations
      ///
      /// Parent Type: `RecommendationConnection`
      public struct Recommendations: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.RecommendationConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("nodes", [Node?]?.self),
        ] }

        public var nodes: [Node?]? { __data["nodes"] }

        /// Media.Recommendations.Node
        ///
        /// Parent Type: `Recommendation`
        public struct Node: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Recommendation }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(MediaRecommended.self),
          ] }

          /// The recommended media
          public var mediaRecommendation: MediaRecommended.MediaRecommendation? { __data["mediaRecommendation"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var mediaRecommended: MediaRecommended { _toFragment() }
          }
        }
      }
    }
  }
}
