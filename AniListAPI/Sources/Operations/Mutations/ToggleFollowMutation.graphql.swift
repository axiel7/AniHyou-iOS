// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct ToggleFollowMutation: GraphQLMutation {
  public static let operationName: String = "ToggleFollow"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation ToggleFollow($userId: Int) { ToggleFollow(userId: $userId) { __typename isFollowing } }"#
    ))

  public var userId: GraphQLNullable<Int32>

  public init(userId: GraphQLNullable<Int32>) {
    self.userId = userId
  }

  @_spi(Unsafe) public var __variables: Variables? { ["userId": userId] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("ToggleFollow", ToggleFollow?.self, arguments: ["userId": .variable("userId")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      ToggleFollowMutation.Data.self
    ] }

    /// Toggle the un/following of a user
    public var toggleFollow: ToggleFollow? { __data["ToggleFollow"] }

    /// ToggleFollow
    ///
    /// Parent Type: `User`
    public struct ToggleFollow: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("isFollowing", Bool?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        ToggleFollowMutation.Data.ToggleFollow.self
      ] }

      /// If the authenticated user if following this user
      public var isFollowing: Bool? { __data["isFollowing"] }
    }
  }
}
