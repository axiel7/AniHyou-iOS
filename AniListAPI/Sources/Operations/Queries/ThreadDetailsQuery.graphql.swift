// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct ThreadDetailsQuery: GraphQLQuery {
  public static let operationName: String = "ThreadDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query ThreadDetails($threadId: Int) { Thread(id: $threadId) { __typename ...BasicThreadDetails } }"#,
      fragments: [BasicThreadDetails.self]
    ))

  public var threadId: GraphQLNullable<Int32>

  public init(threadId: GraphQLNullable<Int32>) {
    self.threadId = threadId
  }

  @_spi(Unsafe) public var __variables: Variables? { ["threadId": threadId] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("Thread", Thread?.self, arguments: ["id": .variable("threadId")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      ThreadDetailsQuery.Data.self
    ] }

    /// Thread query
    public var thread: Thread? { __data["Thread"] }

    /// Thread
    ///
    /// Parent Type: `Thread`
    public struct Thread: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Thread }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(BasicThreadDetails.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        ThreadDetailsQuery.Data.Thread.self,
        BasicThreadDetails.self
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
      /// If the currently authenticated user is subscribed to the thread
      public var isSubscribed: Bool? { __data["isSubscribed"] }
      /// The number of comments on the thread
      public var replyCount: Int? { __data["replyCount"] }
      /// If the thread is locked and can receive comments
      public var isLocked: Bool? { __data["isLocked"] }
      /// The owner of the thread
      public var user: User? { __data["user"] }
      /// The time of the thread creation
      public var createdAt: Int { __data["createdAt"] }

      public struct Fragments: FragmentContainer {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public var basicThreadDetails: BasicThreadDetails { _toFragment() }
      }

      public typealias User = BasicThreadDetails.User
    }
  }
}
