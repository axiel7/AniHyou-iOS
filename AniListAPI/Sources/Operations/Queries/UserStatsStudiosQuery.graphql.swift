// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct UserStatsStudiosQuery: GraphQLQuery {
  public static let operationName: String = "UserStatsStudios"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query UserStatsStudios($userId: Int, $sort: [UserStatisticsSort]) { User(id: $userId) { __typename statistics { __typename anime { __typename studios(sort: $sort) { __typename ...StudioStat } } } } }"#,
      fragments: [StudioStat.self]
    ))

  public var userId: GraphQLNullable<Int32>
  public var sort: GraphQLNullable<[GraphQLEnum<UserStatisticsSort>?]>

  public init(
    userId: GraphQLNullable<Int32>,
    sort: GraphQLNullable<[GraphQLEnum<UserStatisticsSort>?]>
  ) {
    self.userId = userId
    self.sort = sort
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "userId": userId,
    "sort": sort
  ] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("User", User?.self, arguments: ["id": .variable("userId")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      UserStatsStudiosQuery.Data.self
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
        .field("statistics", Statistics?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        UserStatsStudiosQuery.Data.User.self
      ] }

      /// The users anime & manga list statistics
      public var statistics: Statistics? { __data["statistics"] }

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
          UserStatsStudiosQuery.Data.User.Statistics.self
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
            .field("studios", [Studio?]?.self, arguments: ["sort": .variable("sort")]),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            UserStatsStudiosQuery.Data.User.Statistics.Anime.self
          ] }

          public var studios: [Studio?]? { __data["studios"] }

          /// User.Statistics.Anime.Studio
          ///
          /// Parent Type: `UserStudioStatistic`
          public struct Studio: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserStudioStatistic }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .fragment(StudioStat.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              UserStatsStudiosQuery.Data.User.Statistics.Anime.Studio.self,
              StudioStat.self
            ] }

            public var studio: Studio? { __data["studio"] }
            public var count: Int { __data["count"] }
            public var meanScore: Double { __data["meanScore"] }
            public var minutesWatched: Int { __data["minutesWatched"] }
            public var chaptersRead: Int { __data["chaptersRead"] }

            public struct Fragments: FragmentContainer {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              public var studioStat: StudioStat { _toFragment() }
            }

            public typealias Studio = StudioStat.Studio
          }
        }
      }
    }
  }
}
