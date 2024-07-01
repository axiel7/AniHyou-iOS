// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class NotificationCountQuery: GraphQLQuery {
  public static let operationName: String = "NotificationCount"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query NotificationCount { Viewer { __typename unreadNotificationCount } }"#
    ))

  public init() {}

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Viewer", Viewer?.self),
    ] }

    /// Get the currently authenticated user
    public var viewer: Viewer? { __data["Viewer"] }

    /// Viewer
    ///
    /// Parent Type: `User`
    public struct Viewer: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("unreadNotificationCount", Int?.self),
      ] }

      /// The number of unread notifications the user has
      public var unreadNotificationCount: Int? { __data["unreadNotificationCount"] }
    }
  }
}
