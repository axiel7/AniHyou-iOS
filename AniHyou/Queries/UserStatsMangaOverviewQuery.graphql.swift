// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class UserStatsMangaOverviewQuery: GraphQLQuery {
  public static let operationName: String = "UserStatsMangaOverview"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query UserStatsMangaOverview($userId: Int) {
        User(id: $userId) {
          __typename
          statistics {
            __typename
            manga {
              __typename
              count
              chaptersRead
              volumesRead
              meanScore
              standardDeviation
              scores(sort: MEAN_SCORE) {
                __typename
                count
                chaptersRead
                meanScore
              }
              formats {
                __typename
                count
                chaptersRead
                meanScore
                format
              }
              statuses {
                __typename
                count
                chaptersRead
                meanScore
                status
              }
              countries {
                __typename
                count
                chaptersRead
                meanScore
                country
              }
              releaseYears {
                __typename
                count
                chaptersRead
                meanScore
                releaseYear
              }
              startYears {
                __typename
                count
                chaptersRead
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

  public struct Data: API.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { API.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("User", User?.self, arguments: ["id": .variable("userId")]),
    ] }

    /// User query
    public var user: User? { __data["User"] }

    /// User
    ///
    /// Parent Type: `User`
    public struct User: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("statistics", Statistics?.self),
      ] }

      /// The users anime & manga list statistics
      public var statistics: Statistics? { __data["statistics"] }

      /// User.Statistics
      ///
      /// Parent Type: `UserStatisticTypes`
      public struct Statistics: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.UserStatisticTypes }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("manga", Manga?.self),
        ] }

        public var manga: Manga? { __data["manga"] }

        /// User.Statistics.Manga
        ///
        /// Parent Type: `UserStatistics`
        public struct Manga: API.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.UserStatistics }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("count", Int.self),
            .field("chaptersRead", Int.self),
            .field("volumesRead", Int.self),
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
          public var chaptersRead: Int { __data["chaptersRead"] }
          public var volumesRead: Int { __data["volumesRead"] }
          public var meanScore: Double { __data["meanScore"] }
          public var standardDeviation: Double { __data["standardDeviation"] }
          public var scores: [Score?]? { __data["scores"] }
          public var formats: [Format?]? { __data["formats"] }
          public var statuses: [Status?]? { __data["statuses"] }
          public var countries: [Country?]? { __data["countries"] }
          public var releaseYears: [ReleaseYear?]? { __data["releaseYears"] }
          public var startYears: [StartYear?]? { __data["startYears"] }

          /// User.Statistics.Manga.Score
          ///
          /// Parent Type: `UserScoreStatistic`
          public struct Score: API.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.UserScoreStatistic }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("count", Int.self),
              .field("chaptersRead", Int.self),
              .field("meanScore", Double.self),
            ] }

            public var count: Int { __data["count"] }
            public var chaptersRead: Int { __data["chaptersRead"] }
            public var meanScore: Double { __data["meanScore"] }
          }

          /// User.Statistics.Manga.Format
          ///
          /// Parent Type: `UserFormatStatistic`
          public struct Format: API.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.UserFormatStatistic }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("count", Int.self),
              .field("chaptersRead", Int.self),
              .field("meanScore", Double.self),
              .field("format", GraphQLEnum<API.MediaFormat>?.self),
            ] }

            public var count: Int { __data["count"] }
            public var chaptersRead: Int { __data["chaptersRead"] }
            public var meanScore: Double { __data["meanScore"] }
            public var format: GraphQLEnum<API.MediaFormat>? { __data["format"] }
          }

          /// User.Statistics.Manga.Status
          ///
          /// Parent Type: `UserStatusStatistic`
          public struct Status: API.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.UserStatusStatistic }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("count", Int.self),
              .field("chaptersRead", Int.self),
              .field("meanScore", Double.self),
              .field("status", GraphQLEnum<API.MediaListStatus>?.self),
            ] }

            public var count: Int { __data["count"] }
            public var chaptersRead: Int { __data["chaptersRead"] }
            public var meanScore: Double { __data["meanScore"] }
            public var status: GraphQLEnum<API.MediaListStatus>? { __data["status"] }
          }

          /// User.Statistics.Manga.Country
          ///
          /// Parent Type: `UserCountryStatistic`
          public struct Country: API.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.UserCountryStatistic }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("count", Int.self),
              .field("chaptersRead", Int.self),
              .field("meanScore", Double.self),
              .field("country", API.CountryCode?.self),
            ] }

            public var count: Int { __data["count"] }
            public var chaptersRead: Int { __data["chaptersRead"] }
            public var meanScore: Double { __data["meanScore"] }
            public var country: API.CountryCode? { __data["country"] }
          }

          /// User.Statistics.Manga.ReleaseYear
          ///
          /// Parent Type: `UserReleaseYearStatistic`
          public struct ReleaseYear: API.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.UserReleaseYearStatistic }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("count", Int.self),
              .field("chaptersRead", Int.self),
              .field("meanScore", Double.self),
              .field("releaseYear", Int?.self),
            ] }

            public var count: Int { __data["count"] }
            public var chaptersRead: Int { __data["chaptersRead"] }
            public var meanScore: Double { __data["meanScore"] }
            public var releaseYear: Int? { __data["releaseYear"] }
          }

          /// User.Statistics.Manga.StartYear
          ///
          /// Parent Type: `UserStartYearStatistic`
          public struct StartYear: API.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.UserStartYearStatistic }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("count", Int.self),
              .field("chaptersRead", Int.self),
              .field("meanScore", Double.self),
              .field("startYear", Int?.self),
            ] }

            public var count: Int { __data["count"] }
            public var chaptersRead: Int { __data["chaptersRead"] }
            public var meanScore: Double { __data["meanScore"] }
            public var startYear: Int? { __data["startYear"] }
          }
        }
      }
    }
  }
}
