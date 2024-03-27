// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UserStatsAnimeGenresQuery: GraphQLQuery {
  public static let operationName: String = "UserStatsAnimeGenres"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query UserStatsAnimeGenres($userId: Int, $sort: [UserStatisticsSort]) { User(id: $userId) { __typename statistics { __typename anime { __typename genres(sort: $sort) { __typename ...GenreStat } } } } }"#,
      fragments: [GenreStat.self]
    ))

  public var userId: GraphQLNullable<Int>
  public var sort: GraphQLNullable<[GraphQLEnum<UserStatisticsSort>?]>

  public init(
    userId: GraphQLNullable<Int>,
    sort: GraphQLNullable<[GraphQLEnum<UserStatisticsSort>?]>
  ) {
    self.userId = userId
    self.sort = sort
  }

  public var __variables: Variables? { [
    "userId": userId,
    "sort": sort
  ] }

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
            .field("genres", [Genre?]?.self, arguments: ["sort": .variable("sort")]),
          ] }

          public var genres: [Genre?]? { __data["genres"] }

          /// User.Statistics.Anime.Genre
          ///
          /// Parent Type: `UserGenreStatistic`
          public struct Genre: AniListAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.UserGenreStatistic }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .fragment(GenreStat.self),
            ] }

            public var genre: String? { __data["genre"] }
            public var count: Int { __data["count"] }
            public var meanScore: Double { __data["meanScore"] }
            public var minutesWatched: Int { __data["minutesWatched"] }
            public var chaptersRead: Int { __data["chaptersRead"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var genreStat: GenreStat { _toFragment() }
            }
          }
        }
      }
    }
  }
}
