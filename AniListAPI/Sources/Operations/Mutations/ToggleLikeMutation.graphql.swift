// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ToggleLikeMutation: GraphQLMutation {
  public static let operationName: String = "ToggleLike"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation ToggleLike($likeableId: Int, $type: LikeableType) { ToggleLikeV2(id: $likeableId, type: $type) { __typename ... on ListActivity { id isLiked } ... on TextActivity { id isLiked } ... on MessageActivity { id isLiked } ... on ActivityReply { id isLiked } ... on Thread { id isLiked } ... on ThreadComment { id isLiked } } }"#
    ))

  public var likeableId: GraphQLNullable<Int>
  public var type: GraphQLNullable<GraphQLEnum<LikeableType>>

  public init(
    likeableId: GraphQLNullable<Int>,
    type: GraphQLNullable<GraphQLEnum<LikeableType>>
  ) {
    self.likeableId = likeableId
    self.type = type
  }

  public var __variables: Variables? { [
    "likeableId": likeableId,
    "type": type
  ] }

  public struct Data: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("ToggleLikeV2", ToggleLikeV2?.self, arguments: [
        "id": .variable("likeableId"),
        "type": .variable("type")
      ]),
    ] }

    /// Add or remove a like from a likeable type.
    public var toggleLikeV2: ToggleLikeV2? { __data["ToggleLikeV2"] }

    /// ToggleLikeV2
    ///
    /// Parent Type: `LikeableUnion`
    public struct ToggleLikeV2: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AniListAPI.Unions.LikeableUnion }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .inlineFragment(AsListActivity.self),
        .inlineFragment(AsTextActivity.self),
        .inlineFragment(AsMessageActivity.self),
        .inlineFragment(AsActivityReply.self),
        .inlineFragment(AsThread.self),
        .inlineFragment(AsThreadComment.self),
      ] }

      public var asListActivity: AsListActivity? { _asInlineFragment() }
      public var asTextActivity: AsTextActivity? { _asInlineFragment() }
      public var asMessageActivity: AsMessageActivity? { _asInlineFragment() }
      public var asActivityReply: AsActivityReply? { _asInlineFragment() }
      public var asThread: AsThread? { _asInlineFragment() }
      public var asThreadComment: AsThreadComment? { _asInlineFragment() }

      /// ToggleLikeV2.AsListActivity
      ///
      /// Parent Type: `ListActivity`
      public struct AsListActivity: AniListAPI.InlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = ToggleLikeMutation.Data.ToggleLikeV2
        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.ListActivity }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("id", Int.self),
          .field("isLiked", Bool?.self),
        ] }

        /// The id of the activity
        public var id: Int { __data["id"] }
        /// If the currently authenticated user liked the activity
        public var isLiked: Bool? { __data["isLiked"] }
      }

      /// ToggleLikeV2.AsTextActivity
      ///
      /// Parent Type: `TextActivity`
      public struct AsTextActivity: AniListAPI.InlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = ToggleLikeMutation.Data.ToggleLikeV2
        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.TextActivity }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("id", Int.self),
          .field("isLiked", Bool?.self),
        ] }

        /// The id of the activity
        public var id: Int { __data["id"] }
        /// If the currently authenticated user liked the activity
        public var isLiked: Bool? { __data["isLiked"] }
      }

      /// ToggleLikeV2.AsMessageActivity
      ///
      /// Parent Type: `MessageActivity`
      public struct AsMessageActivity: AniListAPI.InlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = ToggleLikeMutation.Data.ToggleLikeV2
        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.MessageActivity }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("id", Int.self),
          .field("isLiked", Bool?.self),
        ] }

        /// The id of the activity
        public var id: Int { __data["id"] }
        /// If the currently authenticated user liked the activity
        public var isLiked: Bool? { __data["isLiked"] }
      }

      /// ToggleLikeV2.AsActivityReply
      ///
      /// Parent Type: `ActivityReply`
      public struct AsActivityReply: AniListAPI.InlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = ToggleLikeMutation.Data.ToggleLikeV2
        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.ActivityReply }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("id", Int.self),
          .field("isLiked", Bool?.self),
        ] }

        /// The id of the reply
        public var id: Int { __data["id"] }
        /// If the currently authenticated user liked the reply
        public var isLiked: Bool? { __data["isLiked"] }
      }

      /// ToggleLikeV2.AsThread
      ///
      /// Parent Type: `Thread`
      public struct AsThread: AniListAPI.InlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = ToggleLikeMutation.Data.ToggleLikeV2
        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Thread }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("id", Int.self),
          .field("isLiked", Bool?.self),
        ] }

        /// The id of the thread
        public var id: Int { __data["id"] }
        /// If the currently authenticated user liked the thread
        public var isLiked: Bool? { __data["isLiked"] }
      }

      /// ToggleLikeV2.AsThreadComment
      ///
      /// Parent Type: `ThreadComment`
      public struct AsThreadComment: AniListAPI.InlineFragment {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = ToggleLikeMutation.Data.ToggleLikeV2
        public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.ThreadComment }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("id", Int.self),
          .field("isLiked", Bool?.self),
        ] }

        /// The id of the comment
        public var id: Int { __data["id"] }
        /// If the currently authenticated user liked the comment
        public var isLiked: Bool? { __data["isLiked"] }
      }
    }
  }
}
