// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct UserStatsAnimeOverviewQuery: GraphQLQuery {
  public static let operationName: String = "UserStatsAnimeOverview"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query UserStatsAnimeOverview($userId: Int) { User(id: $userId) { __typename mediaListOptions { __typename scoreFormat } statistics { __typename anime { __typename count episodesWatched minutesWatched meanScore standardDeviation scores(sort: MEAN_SCORE) { __typename count minutesWatched meanScore score } lengths { __typename length count minutesWatched meanScore } formats { __typename count minutesWatched meanScore format } statuses { __typename count minutesWatched meanScore status } countries { __typename count minutesWatched meanScore country } releaseYears { __typename count minutesWatched meanScore releaseYear } startYears { __typename count minutesWatched meanScore startYear } } } } }"#
    ))

  public var userId: GraphQLNullable<Int32>

  public init(userId: GraphQLNullable<Int32>) {
    self.userId = userId
  }

  @_spi(Unsafe) public var __variables: Variables? { ["userId": userId] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("User", User?.self, arguments: ["id": .variable("userId")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      UserStatsAnimeOverviewQuery.Data.self
    ] }

    /// User query
    public var user: User? { __data["User"] }

    /// User
    ///
    /// Parent Type: `User`
    public struct User: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("mediaListOptions", MediaListOptions?.self),
        .field("statistics", Statistics?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        UserStatsAnimeOverviewQuery.Data.User.self
      ] }

      /// The user's media list options
      public var mediaListOptions: MediaListOptions? { __data["mediaListOptions"] }
      /// The users anime & manga list statistics
      public var statistics: Statistics? { __data["statistics"] }

      /// User.MediaListOptions
      ///
      /// Parent Type: `MediaListOptions`
      public struct MediaListOptions: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaListOptions }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("scoreFormat", GraphQLEnum<AniListAPI.ScoreFormat>?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          UserStatsAnimeOverviewQuery.Data.User.MediaListOptions.self
        ] }

        /// The score format the user is using for media lists
        public var scoreFormat: GraphQLEnum<AniListAPI.ScoreFormat>? { __data["scoreFormat"] }
      }

      /// User.Statistics
      ///
      /// Parent Type: `UserStatisticTypes`
      public struct Statistics: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserStatisticTypes }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("anime", Anime?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          UserStatsAnimeOverviewQuery.Data.User.Statistics.self
        ] }

        public var anime: Anime? { __data["anime"] }

        /// User.Statistics.Anime
        ///
        /// Parent Type: `UserStatistics`
        public struct Anime: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserStatistics }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("count", Int.self),
            .field("episodesWatched", Int.self),
            .field("minutesWatched", Int.self),
            .field("meanScore", Double.self),
            .field("standardDeviation", Double.self),
            .field("scores", [Score?]?.self, arguments: ["sort": "MEAN_SCORE"]),
            .field("lengths", [Length?]?.self),
            .field("formats", [Format?]?.self),
            .field("statuses", [Status?]?.self),
            .field("countries", [Country?]?.self),
            .field("releaseYears", [ReleaseYear?]?.self),
            .field("startYears", [StartYear?]?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            UserStatsAnimeOverviewQuery.Data.User.Statistics.Anime.self
          ] }

          public var count: Int { __data["count"] }
          public var episodesWatched: Int { __data["episodesWatched"] }
          public var minutesWatched: Int { __data["minutesWatched"] }
          public var meanScore: Double { __data["meanScore"] }
          public var standardDeviation: Double { __data["standardDeviation"] }
          public var scores: [Score?]? { __data["scores"] }
          public var lengths: [Length?]? { __data["lengths"] }
          public var formats: [Format?]? { __data["formats"] }
          public var statuses: [Status?]? { __data["statuses"] }
          public var countries: [Country?]? { __data["countries"] }
          public var releaseYears: [ReleaseYear?]? { __data["releaseYears"] }
          public var startYears: [StartYear?]? { __data["startYears"] }

          /// User.Statistics.Anime.Score
          ///
          /// Parent Type: `UserScoreStatistic`
          public struct Score: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserScoreStatistic }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("count", Int.self),
              .field("minutesWatched", Int.self),
              .field("meanScore", Double.self),
              .field("score", Int?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              UserStatsAnimeOverviewQuery.Data.User.Statistics.Anime.Score.self
            ] }

            public var count: Int { __data["count"] }
            public var minutesWatched: Int { __data["minutesWatched"] }
            public var meanScore: Double { __data["meanScore"] }
            public var score: Int? { __data["score"] }
          }

          /// User.Statistics.Anime.Length
          ///
          /// Parent Type: `UserLengthStatistic`
          public struct Length: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserLengthStatistic }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("length", String?.self),
              .field("count", Int.self),
              .field("minutesWatched", Int.self),
              .field("meanScore", Double.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              UserStatsAnimeOverviewQuery.Data.User.Statistics.Anime.Length.self
            ] }

            public var length: String? { __data["length"] }
            public var count: Int { __data["count"] }
            public var minutesWatched: Int { __data["minutesWatched"] }
            public var meanScore: Double { __data["meanScore"] }
          }

          /// User.Statistics.Anime.Format
          ///
          /// Parent Type: `UserFormatStatistic`
          public struct Format: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserFormatStatistic }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("count", Int.self),
              .field("minutesWatched", Int.self),
              .field("meanScore", Double.self),
              .field("format", GraphQLEnum<AniListAPI.MediaFormat>?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              UserStatsAnimeOverviewQuery.Data.User.Statistics.Anime.Format.self
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
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserStatusStatistic }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("count", Int.self),
              .field("minutesWatched", Int.self),
              .field("meanScore", Double.self),
              .field("status", GraphQLEnum<AniListAPI.MediaListStatus>?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              UserStatsAnimeOverviewQuery.Data.User.Statistics.Anime.Status.self
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
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserCountryStatistic }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("count", Int.self),
              .field("minutesWatched", Int.self),
              .field("meanScore", Double.self),
              .field("country", AniListAPI.CountryCode?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              UserStatsAnimeOverviewQuery.Data.User.Statistics.Anime.Country.self
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
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserReleaseYearStatistic }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("count", Int.self),
              .field("minutesWatched", Int.self),
              .field("meanScore", Double.self),
              .field("releaseYear", Int?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              UserStatsAnimeOverviewQuery.Data.User.Statistics.Anime.ReleaseYear.self
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
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserStartYearStatistic }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("count", Int.self),
              .field("minutesWatched", Int.self),
              .field("meanScore", Double.self),
              .field("startYear", Int?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              UserStatsAnimeOverviewQuery.Data.User.Statistics.Anime.StartYear.self
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
