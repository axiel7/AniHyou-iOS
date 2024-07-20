// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SubscribeThreadMutation: GraphQLMutation {
  public static let operationName: String = "SubscribeThread"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation SubscribeThread($threadId: Int, $subscribe: Boolean) { ToggleThreadSubscription(threadId: $threadId, subscribe: $subscribe) { __typename id isSubscribed } }"#
    ))

  public var threadId: GraphQLNullable<Int>
  public var subscribe: GraphQLNullable<Bool>

  public init(
    threadId: GraphQLNullable<Int>,
    subscribe: GraphQLNullable<Bool>
  ) {
    self.threadId = threadId
    self.subscribe = subscribe
  }

  public var __variables: Variables? { [
    "threadId": threadId,
    "subscribe": subscribe
  ] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("ToggleThreadSubscription", ToggleThreadSubscription?.self, arguments: [
        "threadId": .variable("threadId"),
        "subscribe": .variable("subscribe")
      ]),
    ] }

    /// Toggle the subscription of a forum thread
    public var toggleThreadSubscription: ToggleThreadSubscription? { __data["ToggleThreadSubscription"] }

    /// ToggleThreadSubscription
    ///
    /// Parent Type: `Thread`
    public struct ToggleThreadSubscription: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Thread }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("isSubscribed", Bool?.self),
      ] }

      /// The id of the thread
      public var id: Int { __data["id"] }
      /// If the currently authenticated user is subscribed to the thread
      public var isSubscribed: Bool? { __data["isSubscribed"] }
    }
  }
}