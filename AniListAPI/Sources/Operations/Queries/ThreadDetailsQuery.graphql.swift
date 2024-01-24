// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ThreadDetailsQuery: GraphQLQuery {
  public static let operationName: String = "ThreadDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query ThreadDetails($threadId: Int) { Thread(id: $threadId) { __typename ...BasicThreadDetails } }"#,
      fragments: [BasicThreadDetails.self]
    ))

  public var threadId: GraphQLNullable<Int>

  public init(threadId: GraphQLNullable<Int>) {
    self.threadId = threadId
  }

  public var __variables: Variables? { ["threadId": threadId] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Thread", Thread?.self, arguments: ["id": .variable("threadId")]),
    ] }

    /// Thread query
    public var thread: Thread? { __data["Thread"] }

    /// Thread
    ///
    /// Parent Type: `Thread`
    public struct Thread: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Thread }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(BasicThreadDetails.self),
      ] }

      /// The id of the thread
      public var id: Int { __data["id"] }
      /// The title of the thread
      public var title: String? { __data["title"] }
      /// The text body of the thread (Markdown)
      public var body: String? { __data["body"] }
      /// The number of times users have viewed the thread
      public var viewCount: Int? { __data["viewCount"] }
      /// The amount of likes the thread has
      public var likeCount: Int { __data["likeCount"] }
      /// If the currently authenticated user liked the thread
      public var isLiked: Bool? { __data["isLiked"] }
      /// The number of comments on the thread
      public var replyCount: Int? { __data["replyCount"] }
      /// If the thread is locked and can receive comments
      public var isLocked: Bool? { __data["isLocked"] }
      /// The owner of the thread
      public var user: User? { __data["user"] }
      /// The time of the thread creation
      public var createdAt: Int { __data["createdAt"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var basicThreadDetails: BasicThreadDetails { _toFragment() }
      }

      public typealias User = BasicThreadDetails.User
    }
  }
}
