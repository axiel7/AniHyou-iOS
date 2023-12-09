// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ActivityDetailsQuery: GraphQLQuery {
  public static let operationName: String = "ActivityDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query ActivityDetails($activityId: Int) { Activity(id: $activityId) { __typename ... on TextActivity { ...TextActivityFragment replies { __typename ...ActivityReplyFragment } } ... on ListActivity { ...ListActivityFragment replies { __typename ...ActivityReplyFragment } } ... on MessageActivity { ...MessageActivityFragment replies { __typename ...ActivityReplyFragment } } } }"#,
      fragments: [ActivityReplyFragment.self, ListActivityFragment.self, MessageActivityFragment.self, TextActivityFragment.self]
    ))

  public var activityId: GraphQLNullable<Int>

  public init(activityId: GraphQLNullable<Int>) {
    self.activityId = activityId
  }

  public var __variables: Variables? { ["activityId": activityId] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Activity", Activity?.self, arguments: ["id": .variable("activityId")]),
    ] }

    /// Activity query
    public var activity: Activity? { __data["Activity"] }

    /// Activity
    ///
    /// Parent Type: `ActivityUnion`
    public struct Activity: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AniListAPI.Unions.ActivityUnion }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .inlineFragment(AsTextActivity.self),
        .inlineFragment(AsListActivity.self),
        .inlineFragment(AsMessageActivity.self),
      ] }

      public var asTextActivity: AsTextActivity? { _asInlineFragment() }
      public var asListActivity: AsListActivity? { _asInlineFragment() }
      public var asMessageActivity: AsMessageActivity? { _asInlineFragment() }

      /// Activity.AsTextActivity
      ///
      /// Parent Type: `TextActivity`
      public struct AsTextActivity: AniListAPI.InlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = ActivityDetailsQuery.Data.Activity
        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.TextActivity }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("replies", [Reply?]?.self),
          .fragment(TextActivityFragment.self),
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
        public var user: TextActivityFragment.User? { __data["user"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var textActivityFragment: TextActivityFragment { _toFragment() }
        }

        /// Activity.AsTextActivity.Reply
        ///
        /// Parent Type: `ActivityReply`
        public struct Reply: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.ActivityReply }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(ActivityReplyFragment.self),
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
          public var user: ActivityReplyFragment.User? { __data["user"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var activityReplyFragment: ActivityReplyFragment { _toFragment() }
          }
        }
      }

      /// Activity.AsListActivity
      ///
      /// Parent Type: `ListActivity`
      public struct AsListActivity: AniListAPI.InlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = ActivityDetailsQuery.Data.Activity
        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.ListActivity }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("replies", [Reply?]?.self),
          .fragment(ListActivityFragment.self),
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
        public var user: ListActivityFragment.User? { __data["user"] }
        /// The associated media to the activity update
        public var media: ListActivityFragment.Media? { __data["media"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var listActivityFragment: ListActivityFragment { _toFragment() }
        }

        /// Activity.AsListActivity.Reply
        ///
        /// Parent Type: `ActivityReply`
        public struct Reply: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.ActivityReply }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(ActivityReplyFragment.self),
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
          public var user: ActivityReplyFragment.User? { __data["user"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var activityReplyFragment: ActivityReplyFragment { _toFragment() }
          }
        }
      }

      /// Activity.AsMessageActivity
      ///
      /// Parent Type: `MessageActivity`
      public struct AsMessageActivity: AniListAPI.InlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = ActivityDetailsQuery.Data.Activity
        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MessageActivity }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("replies", [Reply?]?.self),
          .fragment(MessageActivityFragment.self),
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
        public var messenger: MessageActivityFragment.Messenger? { __data["messenger"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var messageActivityFragment: MessageActivityFragment { _toFragment() }
        }

        /// Activity.AsMessageActivity.Reply
        ///
        /// Parent Type: `ActivityReply`
        public struct Reply: AniListAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.ActivityReply }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(ActivityReplyFragment.self),
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
          public var user: ActivityReplyFragment.User? { __data["user"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var activityReplyFragment: ActivityReplyFragment { _toFragment() }
          }
        }
      }
    }
  }
}
