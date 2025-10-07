// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct NotificationsQuery: GraphQLQuery {
  public static let operationName: String = "Notifications"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Notifications($page: Int, $perPage: Int, $typeIn: [NotificationType], $resetNotificationCount: Boolean) { Page(page: $page, perPage: $perPage) { __typename notifications(resetNotificationCount: $resetNotificationCount, type_in: $typeIn) { __typename ... on AiringNotification { id contexts animeId episode media { __typename title { __typename userPreferred } coverImage { __typename medium } } type createdAt } ... on FollowingNotification { id context userId user { __typename name avatar { __typename medium } } type createdAt } ... on ActivityMessageNotification { id context activityId userId user { __typename name avatar { __typename medium } } type createdAt } ... on ActivityMentionNotification { id context activityId userId user { __typename name avatar { __typename medium } } type createdAt } ... on ActivityReplyNotification { id context activityId userId user { __typename name avatar { __typename medium } } type createdAt } ... on ActivityReplySubscribedNotification { id context activityId userId user { __typename name avatar { __typename medium } } type createdAt } ... on ActivityLikeNotification { id context activityId userId user { __typename name avatar { __typename medium } } type createdAt } ... on ActivityReplyLikeNotification { id context activityId userId user { __typename name avatar { __typename medium } } type createdAt } ... on ThreadCommentMentionNotification { id context commentId thread { __typename id } userId user { __typename name avatar { __typename medium } } type createdAt } ... on ThreadCommentReplyNotification { id context commentId thread { __typename id } userId user { __typename name avatar { __typename medium } } type createdAt } ... on ThreadCommentSubscribedNotification { id context commentId thread { __typename id } userId user { __typename name avatar { __typename medium } } type createdAt } ... on ThreadCommentLikeNotification { id context commentId thread { __typename id } userId user { __typename name avatar { __typename medium } } type createdAt } ... on ThreadLikeNotification { id context threadId userId user { __typename name avatar { __typename medium } } type createdAt } ... on RelatedMediaAdditionNotification { id context mediaId media { __typename title { __typename userPreferred } coverImage { __typename medium } } type createdAt } ... on MediaDataChangeNotification { id context mediaId media { __typename title { __typename userPreferred } coverImage { __typename medium } } type createdAt } ... on MediaMergeNotification { id context reason mediaId media { __typename title { __typename userPreferred } coverImage { __typename medium } } type createdAt } ... on MediaDeletionNotification { id context reason deletedMediaTitle type createdAt } } pageInfo { __typename currentPage hasNextPage } } }"#
    ))

  public var page: GraphQLNullable<Int32>
  public var perPage: GraphQLNullable<Int32>
  public var typeIn: GraphQLNullable<[GraphQLEnum<NotificationType>?]>
  public var resetNotificationCount: GraphQLNullable<Bool>

  public init(
    page: GraphQLNullable<Int32>,
    perPage: GraphQLNullable<Int32>,
    typeIn: GraphQLNullable<[GraphQLEnum<NotificationType>?]>,
    resetNotificationCount: GraphQLNullable<Bool>
  ) {
    self.page = page
    self.perPage = perPage
    self.typeIn = typeIn
    self.resetNotificationCount = resetNotificationCount
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "typeIn": typeIn,
    "resetNotificationCount": resetNotificationCount
  ] }

  public struct Data: AniListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("Page", Page?.self, arguments: [
        "page": .variable("page"),
        "perPage": .variable("perPage")
      ]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      NotificationsQuery.Data.self
    ] }

    public var page: Page? { __data["Page"] }

    /// Page
    ///
    /// Parent Type: `Page`
    public struct Page: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Page }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("notifications", [Notification?]?.self, arguments: [
          "resetNotificationCount": .variable("resetNotificationCount"),
          "type_in": .variable("typeIn")
        ]),
        .field("pageInfo", PageInfo?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        NotificationsQuery.Data.Page.self
      ] }

      public var notifications: [Notification?]? { __data["notifications"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

      /// Page.Notification
      ///
      /// Parent Type: `NotificationUnion`
      public struct Notification: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Unions.NotificationUnion }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .inlineFragment(AsAiringNotification.self),
          .inlineFragment(AsFollowingNotification.self),
          .inlineFragment(AsActivityMessageNotification.self),
          .inlineFragment(AsActivityMentionNotification.self),
          .inlineFragment(AsActivityReplyNotification.self),
          .inlineFragment(AsActivityReplySubscribedNotification.self),
          .inlineFragment(AsActivityLikeNotification.self),
          .inlineFragment(AsActivityReplyLikeNotification.self),
          .inlineFragment(AsThreadCommentMentionNotification.self),
          .inlineFragment(AsThreadCommentReplyNotification.self),
          .inlineFragment(AsThreadCommentSubscribedNotification.self),
          .inlineFragment(AsThreadCommentLikeNotification.self),
          .inlineFragment(AsThreadLikeNotification.self),
          .inlineFragment(AsRelatedMediaAdditionNotification.self),
          .inlineFragment(AsMediaDataChangeNotification.self),
          .inlineFragment(AsMediaMergeNotification.self),
          .inlineFragment(AsMediaDeletionNotification.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          NotificationsQuery.Data.Page.Notification.self
        ] }

        public var asAiringNotification: AsAiringNotification? { _asInlineFragment() }
        public var asFollowingNotification: AsFollowingNotification? { _asInlineFragment() }
        public var asActivityMessageNotification: AsActivityMessageNotification? { _asInlineFragment() }
        public var asActivityMentionNotification: AsActivityMentionNotification? { _asInlineFragment() }
        public var asActivityReplyNotification: AsActivityReplyNotification? { _asInlineFragment() }
        public var asActivityReplySubscribedNotification: AsActivityReplySubscribedNotification? { _asInlineFragment() }
        public var asActivityLikeNotification: AsActivityLikeNotification? { _asInlineFragment() }
        public var asActivityReplyLikeNotification: AsActivityReplyLikeNotification? { _asInlineFragment() }
        public var asThreadCommentMentionNotification: AsThreadCommentMentionNotification? { _asInlineFragment() }
        public var asThreadCommentReplyNotification: AsThreadCommentReplyNotification? { _asInlineFragment() }
        public var asThreadCommentSubscribedNotification: AsThreadCommentSubscribedNotification? { _asInlineFragment() }
        public var asThreadCommentLikeNotification: AsThreadCommentLikeNotification? { _asInlineFragment() }
        public var asThreadLikeNotification: AsThreadLikeNotification? { _asInlineFragment() }
        public var asRelatedMediaAdditionNotification: AsRelatedMediaAdditionNotification? { _asInlineFragment() }
        public var asMediaDataChangeNotification: AsMediaDataChangeNotification? { _asInlineFragment() }
        public var asMediaMergeNotification: AsMediaMergeNotification? { _asInlineFragment() }
        public var asMediaDeletionNotification: AsMediaDeletionNotification? { _asInlineFragment() }

        /// Page.Notification.AsAiringNotification
        ///
        /// Parent Type: `AiringNotification`
        public struct AsAiringNotification: AniListAPI.InlineFragment {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = NotificationsQuery.Data.Page.Notification
          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.AiringNotification }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("contexts", [String?]?.self),
            .field("animeId", Int.self),
            .field("episode", Int.self),
            .field("media", Media?.self),
            .field("type", GraphQLEnum<AniListAPI.NotificationType>?.self),
            .field("createdAt", Int?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            NotificationsQuery.Data.Page.Notification.self,
            NotificationsQuery.Data.Page.Notification.AsAiringNotification.self
          ] }

          /// The id of the Notification
          public var id: Int { __data["id"] }
          /// The notification context text
          public var contexts: [String?]? { __data["contexts"] }
          /// The id of the aired anime
          public var animeId: Int { __data["animeId"] }
          /// The episode number that just aired
          public var episode: Int { __data["episode"] }
          /// The associated media of the airing schedule
          public var media: Media? { __data["media"] }
          /// The type of notification
          public var type: GraphQLEnum<AniListAPI.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsAiringNotification.Media
          ///
          /// Parent Type: `Media`
          public struct Media: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("title", Title?.self),
              .field("coverImage", CoverImage?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              NotificationsQuery.Data.Page.Notification.AsAiringNotification.Media.self
            ] }

            /// The official titles of the media in various languages
            public var title: Title? { __data["title"] }
            /// The cover images of the media
            public var coverImage: CoverImage? { __data["coverImage"] }

            /// Page.Notification.AsAiringNotification.Media.Title
            ///
            /// Parent Type: `MediaTitle`
            public struct Title: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaTitle }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("userPreferred", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                NotificationsQuery.Data.Page.Notification.AsAiringNotification.Media.Title.self
              ] }

              /// The currently authenticated users preferred title language. Default romaji for non-authenticated
              public var userPreferred: String? { __data["userPreferred"] }
            }

            /// Page.Notification.AsAiringNotification.Media.CoverImage
            ///
            /// Parent Type: `MediaCoverImage`
            public struct CoverImage: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaCoverImage }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("medium", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                NotificationsQuery.Data.Page.Notification.AsAiringNotification.Media.CoverImage.self
              ] }

              /// The cover image url of the media at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsFollowingNotification
        ///
        /// Parent Type: `FollowingNotification`
        public struct AsFollowingNotification: AniListAPI.InlineFragment {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = NotificationsQuery.Data.Page.Notification
          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.FollowingNotification }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<AniListAPI.NotificationType>?.self),
            .field("createdAt", Int?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            NotificationsQuery.Data.Page.Notification.self,
            NotificationsQuery.Data.Page.Notification.AsFollowingNotification.self
          ] }

          /// The id of the Notification
          public var id: Int { __data["id"] }
          /// The notification context text
          public var context: String? { __data["context"] }
          /// The id of the user who followed the authenticated user
          public var userId: Int { __data["userId"] }
          /// The liked activity
          public var user: User? { __data["user"] }
          /// The type of notification
          public var type: GraphQLEnum<AniListAPI.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsFollowingNotification.User
          ///
          /// Parent Type: `User`
          public struct User: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              NotificationsQuery.Data.Page.Notification.AsFollowingNotification.User.self
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsFollowingNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserAvatar }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("medium", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                NotificationsQuery.Data.Page.Notification.AsFollowingNotification.User.Avatar.self
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsActivityMessageNotification
        ///
        /// Parent Type: `ActivityMessageNotification`
        public struct AsActivityMessageNotification: AniListAPI.InlineFragment {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = NotificationsQuery.Data.Page.Notification
          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ActivityMessageNotification }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("activityId", Int.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<AniListAPI.NotificationType>?.self),
            .field("createdAt", Int?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            NotificationsQuery.Data.Page.Notification.self,
            NotificationsQuery.Data.Page.Notification.AsActivityMessageNotification.self
          ] }

          /// The id of the Notification
          public var id: Int { __data["id"] }
          /// The notification context text
          public var context: String? { __data["context"] }
          /// The id of the activity message
          public var activityId: Int { __data["activityId"] }
          /// The if of the user who send the message
          public var userId: Int { __data["userId"] }
          /// The user who sent the message
          public var user: User? { __data["user"] }
          /// The type of notification
          public var type: GraphQLEnum<AniListAPI.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsActivityMessageNotification.User
          ///
          /// Parent Type: `User`
          public struct User: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              NotificationsQuery.Data.Page.Notification.AsActivityMessageNotification.User.self
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsActivityMessageNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserAvatar }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("medium", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                NotificationsQuery.Data.Page.Notification.AsActivityMessageNotification.User.Avatar.self
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsActivityMentionNotification
        ///
        /// Parent Type: `ActivityMentionNotification`
        public struct AsActivityMentionNotification: AniListAPI.InlineFragment {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = NotificationsQuery.Data.Page.Notification
          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ActivityMentionNotification }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("activityId", Int.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<AniListAPI.NotificationType>?.self),
            .field("createdAt", Int?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            NotificationsQuery.Data.Page.Notification.self,
            NotificationsQuery.Data.Page.Notification.AsActivityMentionNotification.self
          ] }

          /// The id of the Notification
          public var id: Int { __data["id"] }
          /// The notification context text
          public var context: String? { __data["context"] }
          /// The id of the activity where mentioned
          public var activityId: Int { __data["activityId"] }
          /// The id of the user who mentioned the authenticated user
          public var userId: Int { __data["userId"] }
          /// The user who mentioned the authenticated user
          public var user: User? { __data["user"] }
          /// The type of notification
          public var type: GraphQLEnum<AniListAPI.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsActivityMentionNotification.User
          ///
          /// Parent Type: `User`
          public struct User: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              NotificationsQuery.Data.Page.Notification.AsActivityMentionNotification.User.self
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsActivityMentionNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserAvatar }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("medium", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                NotificationsQuery.Data.Page.Notification.AsActivityMentionNotification.User.Avatar.self
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsActivityReplyNotification
        ///
        /// Parent Type: `ActivityReplyNotification`
        public struct AsActivityReplyNotification: AniListAPI.InlineFragment {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = NotificationsQuery.Data.Page.Notification
          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ActivityReplyNotification }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("activityId", Int.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<AniListAPI.NotificationType>?.self),
            .field("createdAt", Int?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            NotificationsQuery.Data.Page.Notification.self,
            NotificationsQuery.Data.Page.Notification.AsActivityReplyNotification.self
          ] }

          /// The id of the Notification
          public var id: Int { __data["id"] }
          /// The notification context text
          public var context: String? { __data["context"] }
          /// The id of the activity which was replied too
          public var activityId: Int { __data["activityId"] }
          /// The id of the user who replied to the activity
          public var userId: Int { __data["userId"] }
          /// The user who replied to the activity
          public var user: User? { __data["user"] }
          /// The type of notification
          public var type: GraphQLEnum<AniListAPI.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsActivityReplyNotification.User
          ///
          /// Parent Type: `User`
          public struct User: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              NotificationsQuery.Data.Page.Notification.AsActivityReplyNotification.User.self
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsActivityReplyNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserAvatar }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("medium", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                NotificationsQuery.Data.Page.Notification.AsActivityReplyNotification.User.Avatar.self
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsActivityReplySubscribedNotification
        ///
        /// Parent Type: `ActivityReplySubscribedNotification`
        public struct AsActivityReplySubscribedNotification: AniListAPI.InlineFragment {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = NotificationsQuery.Data.Page.Notification
          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ActivityReplySubscribedNotification }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("activityId", Int.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<AniListAPI.NotificationType>?.self),
            .field("createdAt", Int?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            NotificationsQuery.Data.Page.Notification.self,
            NotificationsQuery.Data.Page.Notification.AsActivityReplySubscribedNotification.self
          ] }

          /// The id of the Notification
          public var id: Int { __data["id"] }
          /// The notification context text
          public var context: String? { __data["context"] }
          /// The id of the activity which was replied too
          public var activityId: Int { __data["activityId"] }
          /// The id of the user who replied to the activity
          public var userId: Int { __data["userId"] }
          /// The user who replied to the activity
          public var user: User? { __data["user"] }
          /// The type of notification
          public var type: GraphQLEnum<AniListAPI.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsActivityReplySubscribedNotification.User
          ///
          /// Parent Type: `User`
          public struct User: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              NotificationsQuery.Data.Page.Notification.AsActivityReplySubscribedNotification.User.self
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsActivityReplySubscribedNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserAvatar }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("medium", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                NotificationsQuery.Data.Page.Notification.AsActivityReplySubscribedNotification.User.Avatar.self
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsActivityLikeNotification
        ///
        /// Parent Type: `ActivityLikeNotification`
        public struct AsActivityLikeNotification: AniListAPI.InlineFragment {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = NotificationsQuery.Data.Page.Notification
          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ActivityLikeNotification }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("activityId", Int.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<AniListAPI.NotificationType>?.self),
            .field("createdAt", Int?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            NotificationsQuery.Data.Page.Notification.self,
            NotificationsQuery.Data.Page.Notification.AsActivityLikeNotification.self
          ] }

          /// The id of the Notification
          public var id: Int { __data["id"] }
          /// The notification context text
          public var context: String? { __data["context"] }
          /// The id of the activity which was liked
          public var activityId: Int { __data["activityId"] }
          /// The id of the user who liked to the activity
          public var userId: Int { __data["userId"] }
          /// The user who liked the activity
          public var user: User? { __data["user"] }
          /// The type of notification
          public var type: GraphQLEnum<AniListAPI.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsActivityLikeNotification.User
          ///
          /// Parent Type: `User`
          public struct User: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              NotificationsQuery.Data.Page.Notification.AsActivityLikeNotification.User.self
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsActivityLikeNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserAvatar }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("medium", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                NotificationsQuery.Data.Page.Notification.AsActivityLikeNotification.User.Avatar.self
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsActivityReplyLikeNotification
        ///
        /// Parent Type: `ActivityReplyLikeNotification`
        public struct AsActivityReplyLikeNotification: AniListAPI.InlineFragment {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = NotificationsQuery.Data.Page.Notification
          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ActivityReplyLikeNotification }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("activityId", Int.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<AniListAPI.NotificationType>?.self),
            .field("createdAt", Int?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            NotificationsQuery.Data.Page.Notification.self,
            NotificationsQuery.Data.Page.Notification.AsActivityReplyLikeNotification.self
          ] }

          /// The id of the Notification
          public var id: Int { __data["id"] }
          /// The notification context text
          public var context: String? { __data["context"] }
          /// The id of the activity where the reply which was liked
          public var activityId: Int { __data["activityId"] }
          /// The id of the user who liked to the activity reply
          public var userId: Int { __data["userId"] }
          /// The user who liked the activity reply
          public var user: User? { __data["user"] }
          /// The type of notification
          public var type: GraphQLEnum<AniListAPI.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsActivityReplyLikeNotification.User
          ///
          /// Parent Type: `User`
          public struct User: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              NotificationsQuery.Data.Page.Notification.AsActivityReplyLikeNotification.User.self
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsActivityReplyLikeNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserAvatar }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("medium", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                NotificationsQuery.Data.Page.Notification.AsActivityReplyLikeNotification.User.Avatar.self
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsThreadCommentMentionNotification
        ///
        /// Parent Type: `ThreadCommentMentionNotification`
        public struct AsThreadCommentMentionNotification: AniListAPI.InlineFragment {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = NotificationsQuery.Data.Page.Notification
          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ThreadCommentMentionNotification }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("commentId", Int.self),
            .field("thread", Thread?.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<AniListAPI.NotificationType>?.self),
            .field("createdAt", Int?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            NotificationsQuery.Data.Page.Notification.self,
            NotificationsQuery.Data.Page.Notification.AsThreadCommentMentionNotification.self
          ] }

          /// The id of the Notification
          public var id: Int { __data["id"] }
          /// The notification context text
          public var context: String? { __data["context"] }
          /// The id of the comment where mentioned
          public var commentId: Int { __data["commentId"] }
          /// The thread that the relevant comment belongs to
          public var thread: Thread? { __data["thread"] }
          /// The id of the user who mentioned the authenticated user
          public var userId: Int { __data["userId"] }
          /// The user who mentioned the authenticated user
          public var user: User? { __data["user"] }
          /// The type of notification
          public var type: GraphQLEnum<AniListAPI.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsThreadCommentMentionNotification.Thread
          ///
          /// Parent Type: `Thread`
          public struct Thread: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Thread }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Int.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              NotificationsQuery.Data.Page.Notification.AsThreadCommentMentionNotification.Thread.self
            ] }

            /// The id of the thread
            public var id: Int { __data["id"] }
          }

          /// Page.Notification.AsThreadCommentMentionNotification.User
          ///
          /// Parent Type: `User`
          public struct User: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              NotificationsQuery.Data.Page.Notification.AsThreadCommentMentionNotification.User.self
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsThreadCommentMentionNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserAvatar }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("medium", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                NotificationsQuery.Data.Page.Notification.AsThreadCommentMentionNotification.User.Avatar.self
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsThreadCommentReplyNotification
        ///
        /// Parent Type: `ThreadCommentReplyNotification`
        public struct AsThreadCommentReplyNotification: AniListAPI.InlineFragment {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = NotificationsQuery.Data.Page.Notification
          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ThreadCommentReplyNotification }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("commentId", Int.self),
            .field("thread", Thread?.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<AniListAPI.NotificationType>?.self),
            .field("createdAt", Int?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            NotificationsQuery.Data.Page.Notification.self,
            NotificationsQuery.Data.Page.Notification.AsThreadCommentReplyNotification.self
          ] }

          /// The id of the Notification
          public var id: Int { __data["id"] }
          /// The notification context text
          public var context: String? { __data["context"] }
          /// The id of the reply comment
          public var commentId: Int { __data["commentId"] }
          /// The thread that the relevant comment belongs to
          public var thread: Thread? { __data["thread"] }
          /// The id of the user who create the comment reply
          public var userId: Int { __data["userId"] }
          /// The user who replied to the activity
          public var user: User? { __data["user"] }
          /// The type of notification
          public var type: GraphQLEnum<AniListAPI.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsThreadCommentReplyNotification.Thread
          ///
          /// Parent Type: `Thread`
          public struct Thread: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Thread }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Int.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              NotificationsQuery.Data.Page.Notification.AsThreadCommentReplyNotification.Thread.self
            ] }

            /// The id of the thread
            public var id: Int { __data["id"] }
          }

          /// Page.Notification.AsThreadCommentReplyNotification.User
          ///
          /// Parent Type: `User`
          public struct User: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              NotificationsQuery.Data.Page.Notification.AsThreadCommentReplyNotification.User.self
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsThreadCommentReplyNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserAvatar }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("medium", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                NotificationsQuery.Data.Page.Notification.AsThreadCommentReplyNotification.User.Avatar.self
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsThreadCommentSubscribedNotification
        ///
        /// Parent Type: `ThreadCommentSubscribedNotification`
        public struct AsThreadCommentSubscribedNotification: AniListAPI.InlineFragment {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = NotificationsQuery.Data.Page.Notification
          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ThreadCommentSubscribedNotification }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("commentId", Int.self),
            .field("thread", Thread?.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<AniListAPI.NotificationType>?.self),
            .field("createdAt", Int?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            NotificationsQuery.Data.Page.Notification.self,
            NotificationsQuery.Data.Page.Notification.AsThreadCommentSubscribedNotification.self
          ] }

          /// The id of the Notification
          public var id: Int { __data["id"] }
          /// The notification context text
          public var context: String? { __data["context"] }
          /// The id of the new comment in the subscribed thread
          public var commentId: Int { __data["commentId"] }
          /// The thread that the relevant comment belongs to
          public var thread: Thread? { __data["thread"] }
          /// The id of the user who commented on the thread
          public var userId: Int { __data["userId"] }
          /// The user who replied to the subscribed thread
          public var user: User? { __data["user"] }
          /// The type of notification
          public var type: GraphQLEnum<AniListAPI.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsThreadCommentSubscribedNotification.Thread
          ///
          /// Parent Type: `Thread`
          public struct Thread: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Thread }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Int.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              NotificationsQuery.Data.Page.Notification.AsThreadCommentSubscribedNotification.Thread.self
            ] }

            /// The id of the thread
            public var id: Int { __data["id"] }
          }

          /// Page.Notification.AsThreadCommentSubscribedNotification.User
          ///
          /// Parent Type: `User`
          public struct User: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              NotificationsQuery.Data.Page.Notification.AsThreadCommentSubscribedNotification.User.self
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsThreadCommentSubscribedNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserAvatar }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("medium", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                NotificationsQuery.Data.Page.Notification.AsThreadCommentSubscribedNotification.User.Avatar.self
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsThreadCommentLikeNotification
        ///
        /// Parent Type: `ThreadCommentLikeNotification`
        public struct AsThreadCommentLikeNotification: AniListAPI.InlineFragment {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = NotificationsQuery.Data.Page.Notification
          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ThreadCommentLikeNotification }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("commentId", Int.self),
            .field("thread", Thread?.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<AniListAPI.NotificationType>?.self),
            .field("createdAt", Int?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            NotificationsQuery.Data.Page.Notification.self,
            NotificationsQuery.Data.Page.Notification.AsThreadCommentLikeNotification.self
          ] }

          /// The id of the Notification
          public var id: Int { __data["id"] }
          /// The notification context text
          public var context: String? { __data["context"] }
          /// The id of the activity which was liked
          public var commentId: Int { __data["commentId"] }
          /// The thread that the relevant comment belongs to
          public var thread: Thread? { __data["thread"] }
          /// The id of the user who liked to the activity
          public var userId: Int { __data["userId"] }
          /// The user who liked the activity
          public var user: User? { __data["user"] }
          /// The type of notification
          public var type: GraphQLEnum<AniListAPI.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsThreadCommentLikeNotification.Thread
          ///
          /// Parent Type: `Thread`
          public struct Thread: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Thread }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("id", Int.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              NotificationsQuery.Data.Page.Notification.AsThreadCommentLikeNotification.Thread.self
            ] }

            /// The id of the thread
            public var id: Int { __data["id"] }
          }

          /// Page.Notification.AsThreadCommentLikeNotification.User
          ///
          /// Parent Type: `User`
          public struct User: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              NotificationsQuery.Data.Page.Notification.AsThreadCommentLikeNotification.User.self
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsThreadCommentLikeNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserAvatar }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("medium", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                NotificationsQuery.Data.Page.Notification.AsThreadCommentLikeNotification.User.Avatar.self
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsThreadLikeNotification
        ///
        /// Parent Type: `ThreadLikeNotification`
        public struct AsThreadLikeNotification: AniListAPI.InlineFragment {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = NotificationsQuery.Data.Page.Notification
          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.ThreadLikeNotification }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("threadId", Int.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<AniListAPI.NotificationType>?.self),
            .field("createdAt", Int?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            NotificationsQuery.Data.Page.Notification.self,
            NotificationsQuery.Data.Page.Notification.AsThreadLikeNotification.self
          ] }

          /// The id of the Notification
          public var id: Int { __data["id"] }
          /// The notification context text
          public var context: String? { __data["context"] }
          /// The id of the thread which was liked
          public var threadId: Int { __data["threadId"] }
          /// The id of the user who liked to the activity
          public var userId: Int { __data["userId"] }
          /// The user who liked the activity
          public var user: User? { __data["user"] }
          /// The type of notification
          public var type: GraphQLEnum<AniListAPI.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsThreadLikeNotification.User
          ///
          /// Parent Type: `User`
          public struct User: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.User }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              NotificationsQuery.Data.Page.Notification.AsThreadLikeNotification.User.self
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsThreadLikeNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserAvatar }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("medium", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                NotificationsQuery.Data.Page.Notification.AsThreadLikeNotification.User.Avatar.self
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsRelatedMediaAdditionNotification
        ///
        /// Parent Type: `RelatedMediaAdditionNotification`
        public struct AsRelatedMediaAdditionNotification: AniListAPI.InlineFragment {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = NotificationsQuery.Data.Page.Notification
          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.RelatedMediaAdditionNotification }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("mediaId", Int.self),
            .field("media", Media?.self),
            .field("type", GraphQLEnum<AniListAPI.NotificationType>?.self),
            .field("createdAt", Int?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            NotificationsQuery.Data.Page.Notification.self,
            NotificationsQuery.Data.Page.Notification.AsRelatedMediaAdditionNotification.self
          ] }

          /// The id of the Notification
          public var id: Int { __data["id"] }
          /// The notification context text
          public var context: String? { __data["context"] }
          /// The id of the new media
          public var mediaId: Int { __data["mediaId"] }
          /// The associated media of the airing schedule
          public var media: Media? { __data["media"] }
          /// The type of notification
          public var type: GraphQLEnum<AniListAPI.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsRelatedMediaAdditionNotification.Media
          ///
          /// Parent Type: `Media`
          public struct Media: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("title", Title?.self),
              .field("coverImage", CoverImage?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              NotificationsQuery.Data.Page.Notification.AsRelatedMediaAdditionNotification.Media.self
            ] }

            /// The official titles of the media in various languages
            public var title: Title? { __data["title"] }
            /// The cover images of the media
            public var coverImage: CoverImage? { __data["coverImage"] }

            /// Page.Notification.AsRelatedMediaAdditionNotification.Media.Title
            ///
            /// Parent Type: `MediaTitle`
            public struct Title: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaTitle }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("userPreferred", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                NotificationsQuery.Data.Page.Notification.AsRelatedMediaAdditionNotification.Media.Title.self
              ] }

              /// The currently authenticated users preferred title language. Default romaji for non-authenticated
              public var userPreferred: String? { __data["userPreferred"] }
            }

            /// Page.Notification.AsRelatedMediaAdditionNotification.Media.CoverImage
            ///
            /// Parent Type: `MediaCoverImage`
            public struct CoverImage: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaCoverImage }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("medium", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                NotificationsQuery.Data.Page.Notification.AsRelatedMediaAdditionNotification.Media.CoverImage.self
              ] }

              /// The cover image url of the media at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsMediaDataChangeNotification
        ///
        /// Parent Type: `MediaDataChangeNotification`
        public struct AsMediaDataChangeNotification: AniListAPI.InlineFragment {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = NotificationsQuery.Data.Page.Notification
          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaDataChangeNotification }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("mediaId", Int.self),
            .field("media", Media?.self),
            .field("type", GraphQLEnum<AniListAPI.NotificationType>?.self),
            .field("createdAt", Int?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            NotificationsQuery.Data.Page.Notification.self,
            NotificationsQuery.Data.Page.Notification.AsMediaDataChangeNotification.self
          ] }

          /// The id of the Notification
          public var id: Int { __data["id"] }
          /// The reason for the media data change
          public var context: String? { __data["context"] }
          /// The id of the media that received data changes
          public var mediaId: Int { __data["mediaId"] }
          /// The media that received data changes
          public var media: Media? { __data["media"] }
          /// The type of notification
          public var type: GraphQLEnum<AniListAPI.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsMediaDataChangeNotification.Media
          ///
          /// Parent Type: `Media`
          public struct Media: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("title", Title?.self),
              .field("coverImage", CoverImage?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              NotificationsQuery.Data.Page.Notification.AsMediaDataChangeNotification.Media.self
            ] }

            /// The official titles of the media in various languages
            public var title: Title? { __data["title"] }
            /// The cover images of the media
            public var coverImage: CoverImage? { __data["coverImage"] }

            /// Page.Notification.AsMediaDataChangeNotification.Media.Title
            ///
            /// Parent Type: `MediaTitle`
            public struct Title: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaTitle }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("userPreferred", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                NotificationsQuery.Data.Page.Notification.AsMediaDataChangeNotification.Media.Title.self
              ] }

              /// The currently authenticated users preferred title language. Default romaji for non-authenticated
              public var userPreferred: String? { __data["userPreferred"] }
            }

            /// Page.Notification.AsMediaDataChangeNotification.Media.CoverImage
            ///
            /// Parent Type: `MediaCoverImage`
            public struct CoverImage: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaCoverImage }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("medium", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                NotificationsQuery.Data.Page.Notification.AsMediaDataChangeNotification.Media.CoverImage.self
              ] }

              /// The cover image url of the media at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsMediaMergeNotification
        ///
        /// Parent Type: `MediaMergeNotification`
        public struct AsMediaMergeNotification: AniListAPI.InlineFragment {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = NotificationsQuery.Data.Page.Notification
          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaMergeNotification }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("reason", String?.self),
            .field("mediaId", Int.self),
            .field("media", Media?.self),
            .field("type", GraphQLEnum<AniListAPI.NotificationType>?.self),
            .field("createdAt", Int?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            NotificationsQuery.Data.Page.Notification.self,
            NotificationsQuery.Data.Page.Notification.AsMediaMergeNotification.self
          ] }

          /// The id of the Notification
          public var id: Int { __data["id"] }
          /// The reason for the media data change
          public var context: String? { __data["context"] }
          /// The reason for the media merge
          public var reason: String? { __data["reason"] }
          /// The id of the media that was merged into
          public var mediaId: Int { __data["mediaId"] }
          /// The media that was merged into
          public var media: Media? { __data["media"] }
          /// The type of notification
          public var type: GraphQLEnum<AniListAPI.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsMediaMergeNotification.Media
          ///
          /// Parent Type: `Media`
          public struct Media: AniListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Media }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("title", Title?.self),
              .field("coverImage", CoverImage?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              NotificationsQuery.Data.Page.Notification.AsMediaMergeNotification.Media.self
            ] }

            /// The official titles of the media in various languages
            public var title: Title? { __data["title"] }
            /// The cover images of the media
            public var coverImage: CoverImage? { __data["coverImage"] }

            /// Page.Notification.AsMediaMergeNotification.Media.Title
            ///
            /// Parent Type: `MediaTitle`
            public struct Title: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaTitle }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("userPreferred", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                NotificationsQuery.Data.Page.Notification.AsMediaMergeNotification.Media.Title.self
              ] }

              /// The currently authenticated users preferred title language. Default romaji for non-authenticated
              public var userPreferred: String? { __data["userPreferred"] }
            }

            /// Page.Notification.AsMediaMergeNotification.Media.CoverImage
            ///
            /// Parent Type: `MediaCoverImage`
            public struct CoverImage: AniListAPI.SelectionSet {
              @_spi(Unsafe) public let __data: DataDict
              @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

              @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaCoverImage }
              @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("medium", String?.self),
              ] }
              @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
                NotificationsQuery.Data.Page.Notification.AsMediaMergeNotification.Media.CoverImage.self
              ] }

              /// The cover image url of the media at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsMediaDeletionNotification
        ///
        /// Parent Type: `MediaDeletionNotification`
        public struct AsMediaDeletionNotification: AniListAPI.InlineFragment {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public typealias RootEntityType = NotificationsQuery.Data.Page.Notification
          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.MediaDeletionNotification }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("reason", String?.self),
            .field("deletedMediaTitle", String?.self),
            .field("type", GraphQLEnum<AniListAPI.NotificationType>?.self),
            .field("createdAt", Int?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            NotificationsQuery.Data.Page.Notification.self,
            NotificationsQuery.Data.Page.Notification.AsMediaDeletionNotification.self
          ] }

          /// The id of the Notification
          public var id: Int { __data["id"] }
          /// The reason for the media deletion
          public var context: String? { __data["context"] }
          /// The reason for the media deletion
          public var reason: String? { __data["reason"] }
          /// The title of the deleted media
          public var deletedMediaTitle: String? { __data["deletedMediaTitle"] }
          /// The type of notification
          public var type: GraphQLEnum<AniListAPI.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }
        }
      }

      /// Page.PageInfo
      ///
      /// Parent Type: `PageInfo`
      public struct PageInfo: AniListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.PageInfo }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("currentPage", Int?.self),
          .field("hasNextPage", Bool?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          NotificationsQuery.Data.Page.PageInfo.self
        ] }

        /// The current page
        public var currentPage: Int? { __data["currentPage"] }
        /// If there is another page
        public var hasNextPage: Bool? { __data["hasNextPage"] }
      }
    }
  }
}
