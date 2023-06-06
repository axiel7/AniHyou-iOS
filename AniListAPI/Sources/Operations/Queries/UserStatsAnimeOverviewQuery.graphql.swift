// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UserStatsAnimeOverviewQuery: GraphQLQuery {
  public static let operationName: String = "UserStatsAnimeOverview"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query UserStatsAnimeOverview($userId: Int) {
        User(id: $userId) {
          __typename
          statistics {
            __typename
            anime {
              __typename
              count
              episodesWatched
              minutesWatched
              meanScore
              standardDeviation
              scores(sort: MEAN_SCORE) {
                __typename
                count
                minutesWatched
                meanScore
              }
              formats {
                __typename
                count
                minutesWatched
                meanScore
                format
              }
              statuses {
                __typename
                count
                minutesWatched
                meanScore
                status
              }
              countries {
                __typename
                count
                minutesWatched
                meanScore
                country
              }
              releaseYears {
                __typename
                count
                minutesWatched
                meanScore
                releaseYear
              }
              startYears {
                __typename
                count
                minutesWatched
                meanScore
                startYear
              }
            }
          }
        }
      }
      """#
    ))

  public var userId: GraphQLNullable<Int>

  public init(userId: GraphQLNullable<Int>) {
    self.userId = userId
  }

  public var __variables: Variables? { ["userId": userId] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("User", User?.self, arguments: ["id": .variable("userId")]),
    ] }

    /// User query
    public var user: User? { __data["User"] }

    /// User
    ///
    /// Parent Type: `User`
    public struct User: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("statistics", Statistics?.self),
      ] }

      /// The users anime & manga list statistics
      public var statistics: Statistics? { __data["statistics"] }

      /// User.Statistics
      ///
      /// Parent Type: `UserStatisticTypes`
      public struct Statistics: AniListAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.UserStatisticTypes }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("anime", Anime?.self),
        ] }

        public var anime: Anime? { __data["anime"] }

        /// User.Statistics.Anime
        ///
        /// Parent Type: `UserStatistics`
        public struct Anime: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.UserStatistics }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("count", Int.self),
            .field("episodesWatched", Int.self),
            .field("minutesWatched", Int.self),
            .field("meanScore", Double.self),
            .field("standardDeviation", Double.self),
            .field("scores", [Score?]?.self, arguments: ["sort": "MEAN_SCORE"]),
            .field("formats", [Format?]?.self),
            .field("statuses", [Status?]?.self),
            .field("countries", [Country?]?.self),
            .field("releaseYears", [ReleaseYear?]?.self),
            .field("startYears", [StartYear?]?.self),
          ] }

          public var count: Int { __data["count"] }
          public var episodesWatched: Int { __data["episodesWatched"] }
          public var minutesWatched: Int { __data["minutesWatched"] }
          public var meanScore: Double { __data["meanScore"] }
          public var standardDeviation: Double { __data["standardDeviation"] }
          public var scores: [Score?]? { __data["scores"] }
          public var formats: [Format?]? { __data["formats"] }
          public var statuses: [Status?]? { __data["statuses"] }
          public var countries: [Country?]? { __data["countries"] }
          public var releaseYears: [ReleaseYear?]? { __data["releaseYears"] }
          public var startYears: [StartYear?]? { __data["startYears"] }

          /// User.Statistics.Anime.Score
          ///
          /// Parent Type: `UserScoreStatistic`
          public struct Score: AniListAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.UserScoreStatistic }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("count", Int.self),
              .field("minutesWatched", Int.self),
              .field("meanScore", Double.self),
            ] }

            public var count: Int { __data["count"] }
            public var minutesWatched: Int { __data["minutesWatched"] }
            public var meanScore: Double { __data["meanScore"] }
          }

          /// User.Statistics.Anime.Format
          ///
          /// Parent Type: `UserFormatStatistic`
          public struct Format: AniListAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.UserFormatStatistic }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("count", Int.self),
              .field("minutesWatched", Int.self),
              .field("meanScore", Double.self),
              .field("format", GraphQLEnum<AniListAPI.MediaFormat>?.self),
            ] }

            public var count: Int { __data["count"] }
            public var minutesWatched: Int { __data["minutesWatched"] }
            public var meanScore: Double { __data["meanScore"] }
            public var format: GraphQLEnum<AniListAPI.MediaFormat>? { __data["format"] }
          }

          /// User.Statistics.Anime.Status
          ///
          /// Parent Type: `UserStatusStatistic`
          public struct Status: AniListAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.UserStatusStatistic }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("count", Int.self),
              .field("minutesWatched", Int.self),
              .field("meanScore", Double.self),
              .field("status", GraphQLEnum<AniListAPI.MediaListStatus>?.self),
            ] }

            public var count: Int { __data["count"] }
            public var minutesWatched: Int { __data["minutesWatched"] }
            public var meanScore: Double { __data["meanScore"] }
            public var status: GraphQLEnum<AniListAPI.MediaListStatus>? { __data["status"] }
          }

          /// User.Statistics.Anime.Country
          ///
          /// Parent Type: `UserCountryStatistic`
          public struct Country: AniListAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.UserCountryStatistic }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("count", Int.self),
              .field("minutesWatched", Int.self),
              .field("meanScore", Double.self),
              .field("country", AniListAPI.CountryCode?.self),
            ] }

            public var count: Int { __data["count"] }
            public var minutesWatched: Int { __data["minutesWatched"] }
            public var meanScore: Double { __data["meanScore"] }
            public var country: AniListAPI.CountryCode? { __data["country"] }
          }

          /// User.Statistics.Anime.ReleaseYear
          ///
          /// Parent Type: `UserReleaseYearStatistic`
          public struct ReleaseYear: AniListAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.UserReleaseYearStatistic }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("count", Int.self),
              .field("minutesWatched", Int.self),
              .field("meanScore", Double.self),
              .field("releaseYear", Int?.self),
            ] }

            public var count: Int { __data["count"] }
            public var minutesWatched: Int { __data["minutesWatched"] }
            public var meanScore: Double { __data["meanScore"] }
            public var releaseYear: Int? { __data["releaseYear"] }
          }

          /// User.Statistics.Anime.StartYear
          ///
          /// Parent Type: `UserStartYearStatistic`
          public struct StartYear: AniListAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.UserStartYearStatistic }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("count", Int.self),
              .field("minutesWatched", Int.self),
              .field("meanScore", Double.self),
              .field("startYear", Int?.self),
            ] }

            public var count: Int { __data["count"] }
            public var minutesWatched: Int { __data["minutesWatched"] }
            public var meanScore: Double { __data["meanScore"] }
            public var startYear: Int? { __data["startYear"] }
          }
        }
      }
    }
  }
}
