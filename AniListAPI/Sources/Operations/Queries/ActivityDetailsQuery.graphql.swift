// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct ActivityDetailsQuery: GraphQLQuery {
  public static let operationName: String = "ActivityDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query ActivityDetails($activityId: Int) { Activity(id: $activityId) { __typename ... on TextActivity { ...TextActivityFragment replies { __typename ...ActivityReplyFragment } } ... on ListActivity { ...ListActivityFragment replies { __typename ...ActivityReplyFragment } } ... on MessageActivity { ...MessageActivityFragment replies { __typename ...ActivityReplyFragment } } } }"#,
      fragments: [ActivityReplyFragment.self, ListActivityFragment.self, MessageActivityFragment.self, TextActivityFragment.self]
    ))

  public var activityId: GraphQLNullable<Int32>

  public init(activityId: GraphQLNullable<Int32>) {
    self.activityId = activityId
  }

  @_spi(Unsafe) public var __variables: Variables? { ["activityId": activityId] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("Activity", Activity?.self, arguments: ["id": .variable("activityId")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      ActivityDetailsQuery.Data.self
    ] }

    /// Activity query
    public var activity: Activity? { __data["Activity"] }

    /// Activity
    ///
    /// Parent Type: `ActivityUnion`
    public struct Activity: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Unions.ActivityUnion }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .inlineFragment(AsTextActivity.self),
        .inlineFragment(AsListActivity.self),
        .inlineFragment(AsMessageActivity.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        ActivityDetailsQuery.Data.Activity.self
      ] }

      public var asTextActivity: AsTextActivity? { _asInlineFragment() }
      public var asListActivity: AsListActivity? { _asInlineFragment() }
      public var asMessageActivity: AsMessageActivity? { _asInlineFragment() }

      /// Activity.AsTextActivity
      ///
      /// Parent Type: `TextActivity`
      public struct AsTextActivity: AniListAPI.InlineFragment, Identifiable {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = ActivityDetailsQuery.Data.Activity
        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.TextActivity }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("replies", [Reply?]?.self),
          .fragment(TextActivityFragment.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          ActivityDetailsQuery.Data.Activity.self,
          ActivityDetailsQuery.Data.Activity.AsTextActivity.self,
          TextActivityFragment.self
        ] }

        /// The written replies to the activity
        public var replies: [Reply?]? { __data["replies"] }
        /// The id of the activity
        public var id: Int { __data["id"] }
        /// The time the activity was created at
        public var createdAt: Int { __data["createdAt"] }
        /// If the currently authenticated user liked the activity
        public var isLiked: Bool? { __data["isLiked"] }
        /// The amount of likes the activity has
        public var likeCount: Int { __data["likeCount"] }
        /// The number of activity replies
        public var replyCount: Int { __data["replyCount"] }
        /// If the activity is locked and can receive replies
        public var isLocked: Bool? { __data["isLocked"] }
        /// The status text (Markdown)
        public var text: String? { __data["text"] }
        /// The user id of the activity's creator
        public var userId: Int? { __data["userId"] }
        /// The user who created the activity
        public var user: User? { __data["user"] }

        public struct Fragments: FragmentContainer {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public var textActivityFragment: TextActivityFragment { _toFragment() }
        }

        /// Activity.AsTextActivity.Reply
        ///
        /// Parent Type: `ActivityReply`
        public struct Reply: AniListAPI.SelectionSet, Identifiable {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ActivityReply }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(ActivityReplyFragment.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            ActivityDetailsQuery.Data.Activity.AsTextActivity.Reply.self,
            ActivityReplyFragment.self
          ] }

          /// The id of the reply
          public var id: Int { __data["id"] }
          /// The time the reply was created at
          public var createdAt: Int { __data["createdAt"] }
          /// If the currently authenticated user liked the reply
          public var isLiked: Bool? { __data["isLiked"] }
          /// The amount of likes the reply has
          public var likeCount: Int { __data["likeCount"] }
          /// The reply text
          public var text: String? { __data["text"] }
          /// The id of the replies creator
          public var userId: Int? { __data["userId"] }
          /// The user who created reply
          public var user: User? { __data["user"] }

          public struct Fragments: FragmentContainer {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            public var activityReplyFragment: ActivityReplyFragment { _toFragment() }
          }

          public typealias User = ActivityReplyFragment.User
        }

        public typealias User = TextActivityFragment.User
      }

      /// Activity.AsListActivity
      ///
      /// Parent Type: `ListActivity`
      public struct AsListActivity: AniListAPI.InlineFragment, Identifiable {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = ActivityDetailsQuery.Data.Activity
        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ListActivity }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("replies", [Reply?]?.self),
          .fragment(ListActivityFragment.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          ActivityDetailsQuery.Data.Activity.self,
          ActivityDetailsQuery.Data.Activity.AsListActivity.self,
          ListActivityFragment.self
        ] }

        /// The written replies to the activity
        public var replies: [Reply?]? { __data["replies"] }
        /// The id of the activity
        public var id: Int { __data["id"] }
        /// The time the activity was created at
        public var createdAt: Int { __data["createdAt"] }
        /// If the currently authenticated user liked the activity
        public var isLiked: Bool? { __data["isLiked"] }
        /// The amount of likes the activity has
        public var likeCount: Int { __data["likeCount"] }
        /// The number of activity replies
        public var replyCount: Int { __data["replyCount"] }
        /// If the activity is locked and can receive replies
        public var isLocked: Bool? { __data["isLocked"] }
        /// The type of activity
        public var type: GraphQLEnum<AniListAPI.ActivityType>? { __data["type"] }
        /// The list progress made
        public var progress: String? { __data["progress"] }
        /// The list item's textual status
        public var status: String? { __data["status"] }
        /// The user id of the activity's creator
        public var userId: Int? { __data["userId"] }
        /// The owner of the activity
        public var user: User? { __data["user"] }
        /// The associated media to the activity update
        public var media: Media? { __data["media"] }

        public struct Fragments: FragmentContainer {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public var listActivityFragment: ListActivityFragment { _toFragment() }
        }

        /// Activity.AsListActivity.Reply
        ///
        /// Parent Type: `ActivityReply`
        public struct Reply: AniListAPI.SelectionSet, Identifiable {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ActivityReply }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(ActivityReplyFragment.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            ActivityDetailsQuery.Data.Activity.AsListActivity.Reply.self,
            ActivityReplyFragment.self
          ] }

          /// The id of the reply
          public var id: Int { __data["id"] }
          /// The time the reply was created at
          public var createdAt: Int { __data["createdAt"] }
          /// If the currently authenticated user liked the reply
          public var isLiked: Bool? { __data["isLiked"] }
          /// The amount of likes the reply has
          public var likeCount: Int { __data["likeCount"] }
          /// The reply text
          public var text: String? { __data["text"] }
          /// The id of the replies creator
          public var userId: Int? { __data["userId"] }
          /// The user who created reply
          public var user: User? { __data["user"] }

          public struct Fragments: FragmentContainer {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            public var activityReplyFragment: ActivityReplyFragment { _toFragment() }
          }

          public typealias User = ActivityReplyFragment.User
        }

        public typealias User = ListActivityFragment.User

        public typealias Media = ListActivityFragment.Media
      }

      /// Activity.AsMessageActivity
      ///
      /// Parent Type: `MessageActivity`
      public struct AsMessageActivity: AniListAPI.InlineFragment, Identifiable {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = ActivityDetailsQuery.Data.Activity
        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MessageActivity }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("replies", [Reply?]?.self),
          .fragment(MessageActivityFragment.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          ActivityDetailsQuery.Data.Activity.self,
          ActivityDetailsQuery.Data.Activity.AsMessageActivity.self,
          MessageActivityFragment.self
        ] }

        /// The written replies to the activity
        public var replies: [Reply?]? { __data["replies"] }
        /// The id of the activity
        public var id: Int { __data["id"] }
        /// The time the activity was created at
        public var createdAt: Int { __data["createdAt"] }
        /// If the currently authenticated user liked the activity
        public var isLiked: Bool? { __data["isLiked"] }
        /// The amount of likes the activity has
        public var likeCount: Int { __data["likeCount"] }
        /// The number of activity replies
        public var replyCount: Int { __data["replyCount"] }
        /// If the message is private and only viewable to the sender and recipients
        public var isPrivate: Bool? { __data["isPrivate"] }
        /// If the activity is locked and can receive replies
        public var isLocked: Bool? { __data["isLocked"] }
        /// The message text (Markdown)
        public var message: String? { __data["message"] }
        /// The user id of the activity's sender
        public var messengerId: Int? { __data["messengerId"] }
        /// The user who sent the activity message
        public var messenger: Messenger? { __data["messenger"] }

        public struct Fragments: FragmentContainer {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public var messageActivityFragment: MessageActivityFragment { _toFragment() }
        }

        /// Activity.AsMessageActivity.Reply
        ///
        /// Parent Type: `ActivityReply`
        public struct Reply: AniListAPI.SelectionSet, Identifiable {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ActivityReply }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(ActivityReplyFragment.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            ActivityDetailsQuery.Data.Activity.AsMessageActivity.Reply.self,
            ActivityReplyFragment.self
          ] }

          /// The id of the reply
          public var id: Int { __data["id"] }
          /// The time the reply was created at
          public var createdAt: Int { __data["createdAt"] }
          /// If the currently authenticated user liked the reply
          public var isLiked: Bool? { __data["isLiked"] }
          /// The amount of likes the reply has
          public var likeCount: Int { __data["likeCount"] }
          /// The reply text
          public var text: String? { __data["text"] }
          /// The id of the replies creator
          public var userId: Int? { __data["userId"] }
          /// The user who created reply
          public var user: User? { __data["user"] }

          public struct Fragments: FragmentContainer {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            public var activityReplyFragment: ActivityReplyFragment { _toFragment() }
          }

          public typealias User = ActivityReplyFragment.User
        }

        public typealias Messenger = MessageActivityFragment.Messenger
      }
    }
  }
}
