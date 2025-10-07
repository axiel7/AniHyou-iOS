// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct NotificationCountQuery: GraphQLQuery {
  public static let operationName: String = "NotificationCount"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query NotificationCount { Viewer { __typename unreadNotificationCount } }"#
    ))

  public init() {}

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("Viewer", Viewer?.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      NotificationCountQuery.Data.self
    ] }

    /// Get the currently authenticated user
    public var viewer: Viewer? { __data["Viewer"] }

    /// Viewer
    ///
    /// Parent Type: `User`
    public struct Viewer: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("unreadNotificationCount", Int?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        NotificationCountQuery.Data.Viewer.self
      ] }

      /// The number of unread notifications the user has
      public var unreadNotificationCount: Int? { __data["unreadNotificationCount"] }
    }
  }
}
