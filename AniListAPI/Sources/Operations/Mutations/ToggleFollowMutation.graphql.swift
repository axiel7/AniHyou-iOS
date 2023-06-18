// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ToggleFollowMutation: GraphQLMutation {
  public static let operationName: String = "ToggleFollow"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      mutation ToggleFollow($userId: Int) {
        ToggleFollow(userId: $userId) {
          __typename
          isFollowing
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

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("ToggleFollow", ToggleFollow?.self, arguments: ["userId": .variable("userId")]),
    ] }

    /// Toggle the un/following of a user
    public var toggleFollow: ToggleFollow? { __data["ToggleFollow"] }

    /// ToggleFollow
    ///
    /// Parent Type: `User`
    public struct ToggleFollow: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("isFollowing", Bool?.self),
      ] }

      /// If the authenticated user if following this user
      public var isFollowing: Bool? { __data["isFollowing"] }
    }
  }
}
