// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct UserStatsMangaStaffQuery: GraphQLQuery {
  public static let operationName: String = "UserStatsMangaStaff"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query UserStatsMangaStaff($userId: Int, $sort: [UserStatisticsSort]) { User(id: $userId) { __typename statistics { __typename manga { __typename staff(sort: $sort) { __typename ...StaffStat } } } } }"#,
      fragments: [StaffStat.self]
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
      UserStatsMangaStaffQuery.Data.self
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
        UserStatsMangaStaffQuery.Data.User.self
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
          .field("manga", Manga?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          UserStatsMangaStaffQuery.Data.User.Statistics.self
        ] }

        public var manga: Manga? { __data["manga"] }

        /// User.Statistics.Manga
        ///
        /// Parent Type: `UserStatistics`
        public struct Manga: AniListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserStatistics }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("staff", [Staff?]?.self, arguments: ["sort": .variable("sort")]),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            UserStatsMangaStaffQuery.Data.User.Statistics.Manga.self
          ] }

          public var staff: [Staff?]? { __data["staff"] }

          /// User.Statistics.Manga.Staff
          ///
          /// Parent Type: `UserStaffStatistic`
          public struct Staff: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserStaffStatistic }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .fragment(StaffStat.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              UserStatsMangaStaffQuery.Data.User.Statistics.Manga.Staff.self,
              StaffStat.self
            ] }

            public var staff: Staff? { __data["staff"] }
            public var count: Int { __data["count"] }
            public var meanScore: Double { __data["meanScore"] }
            public var minutesWatched: Int { __data["minutesWatched"] }
            public var chaptersRead: Int { __data["chaptersRead"] }

            public struct Fragments: FragmentContainer {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              public var staffStat: StaffStat { _toFragment() }
            }

            public typealias Staff = StaffStat.Staff
          }
        }
      }
    }
  }
}
