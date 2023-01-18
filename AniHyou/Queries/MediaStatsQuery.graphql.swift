// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class MediaStatsQuery: GraphQLQuery {
  public static let operationName: String = "MediaStats"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query MediaStats($mediaId: Int) {
        Media(id: $mediaId) {
          __typename
          stats {
            __typename
            statusDistribution {
              __typename
              status
              amount
            }
            scoreDistribution {
              __typename
              score
              amount
            }
          }
          rankings {
            __typename
            id
            rank
            context
            type
            season
            year
          }
        }
      }
      """#
    ))

  public var mediaId: GraphQLNullable<Int>

  public init(mediaId: GraphQLNullable<Int>) {
    self.mediaId = mediaId
  }

  public var __variables: Variables? { ["mediaId": mediaId] }

  public struct Data: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ApolloAPI.ParentType { API.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
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

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Media }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("stats", Stats?.self),
        .field("rankings", [Ranking?]?.self),
      ] }

      public var stats: Stats? { __data["stats"] }
      /// The ranking of the media in a particular time span and format compared to other media
      public var rankings: [Ranking?]? { __data["rankings"] }

      /// Media.Stats
      ///
      /// Parent Type: `MediaStats`
      public struct Stats: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaStats }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("statusDistribution", [StatusDistribution?]?.self),
          .field("scoreDistribution", [ScoreDistribution?]?.self),
        ] }

        public var statusDistribution: [StatusDistribution?]? { __data["statusDistribution"] }
        public var scoreDistribution: [ScoreDistribution?]? { __data["scoreDistribution"] }

        /// Media.Stats.StatusDistribution
        ///
        /// Parent Type: `StatusDistribution`
        public struct StatusDistribution: API.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.StatusDistribution }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("status", GraphQLEnum<API.MediaListStatus>?.self),
            .field("amount", Int?.self),
          ] }

          /// The day the activity took place (Unix timestamp)
          public var status: GraphQLEnum<API.MediaListStatus>? { __data["status"] }
          /// The amount of entries with this status
          public var amount: Int? { __data["amount"] }
        }

        /// Media.Stats.ScoreDistribution
        ///
        /// Parent Type: `ScoreDistribution`
        public struct ScoreDistribution: API.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.ScoreDistribution }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("score", Int?.self),
            .field("amount", Int?.self),
          ] }

          public var score: Int? { __data["score"] }
          /// The amount of list entries with this score
          public var amount: Int? { __data["amount"] }
        }
      }

      /// Media.Ranking
      ///
      /// Parent Type: `MediaRank`
      public struct Ranking: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaRank }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("id", Int.self),
          .field("rank", Int.self),
          .field("context", String.self),
          .field("type", GraphQLEnum<API.MediaRankType>.self),
          .field("season", GraphQLEnum<API.MediaSeason>?.self),
          .field("year", Int?.self),
        ] }

        /// The id of the rank
        public var id: Int { __data["id"] }
        /// The numerical rank of the media
        public var rank: Int { __data["rank"] }
        /// String that gives context to the ranking type and time span
        public var context: String { __data["context"] }
        /// The type of ranking
        public var type: GraphQLEnum<API.MediaRankType> { __data["type"] }
        /// The season the media is ranked within
        public var season: GraphQLEnum<API.MediaSeason>? { __data["season"] }
        /// The year the media is ranked within
        public var year: Int? { __data["year"] }
      }
    }
  }
}
