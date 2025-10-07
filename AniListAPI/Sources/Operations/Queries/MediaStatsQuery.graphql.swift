// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct MediaStatsQuery: GraphQLQuery {
  public static let operationName: String = "MediaStats"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query MediaStats($mediaId: Int) { Media(id: $mediaId) { __typename stats { __typename statusDistribution { __typename status amount } scoreDistribution { __typename score amount } } rankings { __typename id rank context type season year } } }"#
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
      MediaStatsQuery.Data.self
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
        .field("stats", Stats?.self),
        .field("rankings", [Ranking?]?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        MediaStatsQuery.Data.Media.self
      ] }

      public var stats: Stats? { __data["stats"] }
      /// The ranking of the media in a particular time span and format compared to other media
      public var rankings: [Ranking?]? { __data["rankings"] }

      /// Media.Stats
      ///
      /// Parent Type: `MediaStats`
      public struct Stats: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaStats }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("statusDistribution", [StatusDistribution?]?.self),
          .field("scoreDistribution", [ScoreDistribution?]?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          MediaStatsQuery.Data.Media.Stats.self
        ] }

        public var statusDistribution: [StatusDistribution?]? { __data["statusDistribution"] }
        public var scoreDistribution: [ScoreDistribution?]? { __data["scoreDistribution"] }

        /// Media.Stats.StatusDistribution
        ///
        /// Parent Type: `StatusDistribution`
        public struct StatusDistribution: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.StatusDistribution }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("status", GraphQLEnum<AniListAPI.MediaListStatus>?.self),
            .field("amount", Int?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            MediaStatsQuery.Data.Media.Stats.StatusDistribution.self
          ] }

          /// The day the activity took place (Unix timestamp)
          public var status: GraphQLEnum<AniListAPI.MediaListStatus>? { __data["status"] }
          /// The amount of entries with this status
          public var amount: Int? { __data["amount"] }
        }

        /// Media.Stats.ScoreDistribution
        ///
        /// Parent Type: `ScoreDistribution`
        public struct ScoreDistribution: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ScoreDistribution }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("score", Int?.self),
            .field("amount", Int?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            MediaStatsQuery.Data.Media.Stats.ScoreDistribution.self
          ] }

          public var score: Int? { __data["score"] }
          /// The amount of list entries with this score
          public var amount: Int? { __data["amount"] }
        }
      }

      /// Media.Ranking
      ///
      /// Parent Type: `MediaRank`
      public struct Ranking: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaRank }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("rank", Int.self),
          .field("context", String.self),
          .field("type", GraphQLEnum<AniListAPI.MediaRankType>.self),
          .field("season", GraphQLEnum<AniListAPI.MediaSeason>?.self),
          .field("year", Int?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          MediaStatsQuery.Data.Media.Ranking.self
        ] }

        /// The id of the rank
        public var id: Int { __data["id"] }
        /// The numerical rank of the media
        public var rank: Int { __data["rank"] }
        /// String that gives context to the ranking type and time span
        public var context: String { __data["context"] }
        /// The type of ranking
        public var type: GraphQLEnum<AniListAPI.MediaRankType> { __data["type"] }
        /// The season the media is ranked within
        public var season: GraphQLEnum<AniListAPI.MediaSeason>? { __data["season"] }
        /// The year the media is ranked within
        public var year: Int? { __data["year"] }
      }
    }
  }
}
