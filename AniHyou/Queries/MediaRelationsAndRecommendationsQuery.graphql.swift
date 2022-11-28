// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class MediaRelationsAndRecommendationsQuery: GraphQLQuery {
  public static let operationName: String = "MediaRelationsAndRecommendations"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
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
      """,
      fragments: [MediaRelated.self, MediaRecommended.self]
    ))

  public var mediaId: GraphQLNullable<Int>

  public init(mediaId: GraphQLNullable<Int>) {
    self.mediaId = mediaId
  }

  public var __variables: Variables? { ["mediaId": mediaId] }

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
      public struct Relations: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { API.Objects.MediaConnection }
        public static var __selections: [Selection] { [
          .field("edges", [Edge?]?.self),
        ] }

        public var edges: [Edge?]? { __data["edges"] }

        /// Media.Relations.Edge
        ///
        /// Parent Type: `MediaEdge`
        public struct Edge: API.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { API.Objects.MediaEdge }
          public static var __selections: [Selection] { [
            .fragment(MediaRelated.self),
          ] }

          /// The type of relation to the parent model
          public var relationType: GraphQLEnum<API.MediaRelation>? { __data["relationType"] }
          public var node: MediaRelated.Node? { __data["node"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public var mediaRelated: MediaRelated { _toFragment() }
          }
        }
      }

      /// Media.Recommendations
      ///
      /// Parent Type: `RecommendationConnection`
      public struct Recommendations: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { API.Objects.RecommendationConnection }
        public static var __selections: [Selection] { [
          .field("nodes", [Node?]?.self),
        ] }

        public var nodes: [Node?]? { __data["nodes"] }

        /// Media.Recommendations.Node
        ///
        /// Parent Type: `Recommendation`
        public struct Node: API.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { API.Objects.Recommendation }
          public static var __selections: [Selection] { [
            .fragment(MediaRecommended.self),
          ] }

          /// The recommended media
          public var mediaRecommendation: MediaRecommended.MediaRecommendation? { __data["mediaRecommendation"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public var mediaRecommended: MediaRecommended { _toFragment() }
          }
        }
      }
    }
  }
}
