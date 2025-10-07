// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct ToggleLikeMutation: GraphQLMutation {
  public static let operationName: String = "ToggleLike"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation ToggleLike($likeableId: Int, $type: LikeableType) { ToggleLikeV2(id: $likeableId, type: $type) { __typename ... on ListActivity { id isLiked } ... on TextActivity { id isLiked } ... on MessageActivity { id isLiked } ... on ActivityReply { id isLiked } ... on Thread { id isLiked } ... on ThreadComment { id isLiked } } }"#
    ))

  public var likeableId: GraphQLNullable<Int32>
  public var type: GraphQLNullable<GraphQLEnum<LikeableType>>

  public init(
    likeableId: GraphQLNullable<Int32>,
    type: GraphQLNullable<GraphQLEnum<LikeableType>>
  ) {
    self.likeableId = likeableId
    self.type = type
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "likeableId": likeableId,
    "type": type
  ] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("ToggleLikeV2", ToggleLikeV2?.self, arguments: [
        "id": .variable("likeableId"),
        "type": .variable("type")
      ]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      ToggleLikeMutation.Data.self
    ] }

    /// Add or remove a like from a likeable type.
    public var toggleLikeV2: ToggleLikeV2? { __data["ToggleLikeV2"] }

    /// ToggleLikeV2
    ///
    /// Parent Type: `LikeableUnion`
    public struct ToggleLikeV2: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Unions.LikeableUnion }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .inlineFragment(AsListActivity.self),
        .inlineFragment(AsTextActivity.self),
        .inlineFragment(AsMessageActivity.self),
        .inlineFragment(AsActivityReply.self),
        .inlineFragment(AsThread.self),
        .inlineFragment(AsThreadComment.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        ToggleLikeMutation.Data.ToggleLikeV2.self
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
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = ToggleLikeMutation.Data.ToggleLikeV2
        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ListActivity }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("id", Int.self),
          .field("isLiked", Bool?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          ToggleLikeMutation.Data.ToggleLikeV2.self,
          ToggleLikeMutation.Data.ToggleLikeV2.AsListActivity.self
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
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = ToggleLikeMutation.Data.ToggleLikeV2
        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.TextActivity }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("id", Int.self),
          .field("isLiked", Bool?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          ToggleLikeMutation.Data.ToggleLikeV2.self,
          ToggleLikeMutation.Data.ToggleLikeV2.AsTextActivity.self
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
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = ToggleLikeMutation.Data.ToggleLikeV2
        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MessageActivity }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("id", Int.self),
          .field("isLiked", Bool?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          ToggleLikeMutation.Data.ToggleLikeV2.self,
          ToggleLikeMutation.Data.ToggleLikeV2.AsMessageActivity.self
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
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = ToggleLikeMutation.Data.ToggleLikeV2
        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ActivityReply }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("id", Int.self),
          .field("isLiked", Bool?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          ToggleLikeMutation.Data.ToggleLikeV2.self,
          ToggleLikeMutation.Data.ToggleLikeV2.AsActivityReply.self
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
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = ToggleLikeMutation.Data.ToggleLikeV2
        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Thread }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("id", Int.self),
          .field("isLiked", Bool?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          ToggleLikeMutation.Data.ToggleLikeV2.self,
          ToggleLikeMutation.Data.ToggleLikeV2.AsThread.self
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
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public typealias RootEntityType = ToggleLikeMutation.Data.ToggleLikeV2
        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ThreadComment }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("id", Int.self),
          .field("isLiked", Bool?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          ToggleLikeMutation.Data.ToggleLikeV2.self,
          ToggleLikeMutation.Data.ToggleLikeV2.AsThreadComment.self
        ] }

        /// The id of the comment
        public var id: Int { __data["id"] }
        /// If the currently authenticated user liked the comment
        public var isLiked: Bool? { __data["isLiked"] }
      }
    }
  }
}
