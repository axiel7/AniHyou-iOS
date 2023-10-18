// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ActivityRepliesQuery: GraphQLQuery {
  public static let operationName: String = "ActivityReplies"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query ActivityReplies($activityId: Int) { Activity(id: $activityId) { __typename ... on TextActivity { replies { __typename ...ActivityReplyFragment } } ... on ListActivity { replies { __typename ...ActivityReplyFragment } } ... on MessageActivity { replies { __typename ...ActivityReplyFragment } } } }"#,
      fragments: [ActivityReplyFragment.self]
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

        public typealias RootEntityType = ActivityRepliesQuery.Data.Activity
        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.TextActivity }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("replies", [Reply?]?.self),
        ] }

        /// The written replies to the activity
        public var replies: [Reply?]? { __data["replies"] }

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

        public typealias RootEntityType = ActivityRepliesQuery.Data.Activity
        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.ListActivity }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("replies", [Reply?]?.self),
        ] }

        /// The written replies to the activity
        public var replies: [Reply?]? { __data["replies"] }

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

        public typealias RootEntityType = ActivityRepliesQuery.Data.Activity
        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MessageActivity }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("replies", [Reply?]?.self),
        ] }

        /// The written replies to the activity
        public var replies: [Reply?]? { __data["replies"] }

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
