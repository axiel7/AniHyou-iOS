// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public class NotificationsQuery: GraphQLQuery {
  public static let operationName: String = "Notifications"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query Notifications($page: Int, $perPage: Int) {
        Page(page: $page, perPage: $perPage) {
          __typename
          notifications(resetNotificationCount: true) {
            __typename
            ... on AiringNotification {
              id
              contexts
              animeId
              episode
              media {
                __typename
                title {
                  __typename
                  userPreferred
                }
                coverImage {
                  __typename
                  medium
                }
              }
              type
              createdAt
            }
            ... on FollowingNotification {
              id
              context
              userId
              user {
                __typename
                name
                avatar {
                  __typename
                  medium
                }
              }
              type
              createdAt
            }
            ... on ActivityMessageNotification {
              id
              context
              activityId
              userId
              user {
                __typename
                name
                avatar {
                  __typename
                  medium
                }
              }
              type
              createdAt
            }
            ... on ActivityMentionNotification {
              id
              context
              activityId
              userId
              user {
                __typename
                name
                avatar {
                  __typename
                  medium
                }
              }
              type
              createdAt
            }
            ... on ActivityReplyNotification {
              id
              context
              activityId
              userId
              user {
                __typename
                name
                avatar {
                  __typename
                  medium
                }
              }
              type
              createdAt
            }
            ... on ActivityReplySubscribedNotification {
              id
              context
              activityId
              userId
              user {
                __typename
                name
                avatar {
                  __typename
                  medium
                }
              }
              type
              createdAt
            }
            ... on ActivityLikeNotification {
              id
              context
              activityId
              userId
              user {
                __typename
                name
                avatar {
                  __typename
                  medium
                }
              }
              type
              createdAt
            }
            ... on ActivityReplyLikeNotification {
              id
              context
              activityId
              userId
              user {
                __typename
                name
                avatar {
                  __typename
                  medium
                }
              }
              type
              createdAt
            }
            ... on ThreadCommentMentionNotification {
              id
              context
              commentId
              userId
              user {
                __typename
                name
                avatar {
                  __typename
                  medium
                }
              }
              type
              createdAt
            }
            ... on ThreadCommentReplyNotification {
              id
              context
              commentId
              userId
              user {
                __typename
                name
                avatar {
                  __typename
                  medium
                }
              }
              type
              createdAt
            }
            ... on ThreadCommentSubscribedNotification {
              id
              context
              commentId
              userId
              user {
                __typename
                name
                avatar {
                  __typename
                  medium
                }
              }
              type
              createdAt
            }
            ... on ThreadCommentLikeNotification {
              id
              context
              commentId
              userId
              user {
                __typename
                name
                avatar {
                  __typename
                  medium
                }
              }
              type
              createdAt
            }
            ... on ThreadLikeNotification {
              id
              context
              threadId
              userId
              user {
                __typename
                name
                avatar {
                  __typename
                  medium
                }
              }
              type
              createdAt
            }
            ... on RelatedMediaAdditionNotification {
              id
              context
              mediaId
              media {
                __typename
                title {
                  __typename
                  userPreferred
                }
                coverImage {
                  __typename
                  medium
                }
              }
              type
              createdAt
            }
            ... on MediaDataChangeNotification {
              id
              context
              mediaId
              media {
                __typename
                title {
                  __typename
                  userPreferred
                }
                coverImage {
                  __typename
                  medium
                }
              }
              type
              createdAt
            }
            ... on MediaMergeNotification {
              id
              context
              reason
              mediaId
              media {
                __typename
                title {
                  __typename
                  userPreferred
                }
                coverImage {
                  __typename
                  medium
                }
              }
              type
              createdAt
            }
            ... on MediaDeletionNotification {
              id
              context
              reason
              deletedMediaTitle
              type
              createdAt
            }
          }
          pageInfo {
            __typename
            currentPage
            hasNextPage
          }
        }
      }
      """#
    ))

  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>

  public init(
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>
  ) {
    self.page = page
    self.perPage = perPage
  }

  public var __variables: Variables? { [
    "page": page,
    "perPage": perPage
  ] }

  public struct Data: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ApolloAPI.ParentType { API.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Page", Page?.self, arguments: [
        "page": .variable("page"),
        "perPage": .variable("perPage")
      ]),
    ] }

    public var page: Page? { __data["Page"] }

    /// Page
    ///
    /// Parent Type: `Page`
    public struct Page: API.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { API.Objects.Page }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("notifications", [Notification?]?.self, arguments: ["resetNotificationCount": true]),
        .field("pageInfo", PageInfo?.self),
      ] }

      public var notifications: [Notification?]? { __data["notifications"] }
      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }

      /// Page.Notification
      ///
      /// Parent Type: `NotificationUnion`
      public struct Notification: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { API.Unions.NotificationUnion }
        public static var __selections: [ApolloAPI.Selection] { [
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
        public struct AsAiringNotification: API.InlineFragment {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.AiringNotification }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("contexts", [String?]?.self),
            .field("animeId", Int.self),
            .field("episode", Int.self),
            .field("media", Media?.self),
            .field("type", GraphQLEnum<API.NotificationType>?.self),
            .field("createdAt", Int?.self),
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
          public var type: GraphQLEnum<API.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsAiringNotification.Media
          ///
          /// Parent Type: `Media`
          public struct Media: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.Media }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("title", Title?.self),
              .field("coverImage", CoverImage?.self),
            ] }

            /// The official titles of the media in various languages
            public var title: Title? { __data["title"] }
            /// The cover images of the media
            public var coverImage: CoverImage? { __data["coverImage"] }

            /// Page.Notification.AsAiringNotification.Media.Title
            ///
            /// Parent Type: `MediaTitle`
            public struct Title: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaTitle }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("userPreferred", String?.self),
              ] }

              /// The currently authenticated users preferred title language. Default romaji for non-authenticated
              public var userPreferred: String? { __data["userPreferred"] }
            }

            /// Page.Notification.AsAiringNotification.Media.CoverImage
            ///
            /// Parent Type: `MediaCoverImage`
            public struct CoverImage: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaCoverImage }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("medium", String?.self),
              ] }

              /// The cover image url of the media at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsFollowingNotification
        ///
        /// Parent Type: `FollowingNotification`
        public struct AsFollowingNotification: API.InlineFragment {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.FollowingNotification }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<API.NotificationType>?.self),
            .field("createdAt", Int?.self),
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
          public var type: GraphQLEnum<API.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsFollowingNotification.User
          ///
          /// Parent Type: `User`
          public struct User: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.User }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsFollowingNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.UserAvatar }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("medium", String?.self),
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsActivityMessageNotification
        ///
        /// Parent Type: `ActivityMessageNotification`
        public struct AsActivityMessageNotification: API.InlineFragment {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.ActivityMessageNotification }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("activityId", Int.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<API.NotificationType>?.self),
            .field("createdAt", Int?.self),
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
          public var type: GraphQLEnum<API.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsActivityMessageNotification.User
          ///
          /// Parent Type: `User`
          public struct User: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.User }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsActivityMessageNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.UserAvatar }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("medium", String?.self),
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsActivityMentionNotification
        ///
        /// Parent Type: `ActivityMentionNotification`
        public struct AsActivityMentionNotification: API.InlineFragment {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.ActivityMentionNotification }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("activityId", Int.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<API.NotificationType>?.self),
            .field("createdAt", Int?.self),
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
          public var type: GraphQLEnum<API.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsActivityMentionNotification.User
          ///
          /// Parent Type: `User`
          public struct User: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.User }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsActivityMentionNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.UserAvatar }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("medium", String?.self),
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsActivityReplyNotification
        ///
        /// Parent Type: `ActivityReplyNotification`
        public struct AsActivityReplyNotification: API.InlineFragment {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.ActivityReplyNotification }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("activityId", Int.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<API.NotificationType>?.self),
            .field("createdAt", Int?.self),
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
          public var type: GraphQLEnum<API.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsActivityReplyNotification.User
          ///
          /// Parent Type: `User`
          public struct User: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.User }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsActivityReplyNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.UserAvatar }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("medium", String?.self),
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsActivityReplySubscribedNotification
        ///
        /// Parent Type: `ActivityReplySubscribedNotification`
        public struct AsActivityReplySubscribedNotification: API.InlineFragment {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.ActivityReplySubscribedNotification }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("activityId", Int.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<API.NotificationType>?.self),
            .field("createdAt", Int?.self),
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
          public var type: GraphQLEnum<API.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsActivityReplySubscribedNotification.User
          ///
          /// Parent Type: `User`
          public struct User: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.User }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsActivityReplySubscribedNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.UserAvatar }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("medium", String?.self),
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsActivityLikeNotification
        ///
        /// Parent Type: `ActivityLikeNotification`
        public struct AsActivityLikeNotification: API.InlineFragment {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.ActivityLikeNotification }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("activityId", Int.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<API.NotificationType>?.self),
            .field("createdAt", Int?.self),
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
          public var type: GraphQLEnum<API.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsActivityLikeNotification.User
          ///
          /// Parent Type: `User`
          public struct User: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.User }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsActivityLikeNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.UserAvatar }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("medium", String?.self),
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsActivityReplyLikeNotification
        ///
        /// Parent Type: `ActivityReplyLikeNotification`
        public struct AsActivityReplyLikeNotification: API.InlineFragment {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.ActivityReplyLikeNotification }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("activityId", Int.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<API.NotificationType>?.self),
            .field("createdAt", Int?.self),
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
          public var type: GraphQLEnum<API.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsActivityReplyLikeNotification.User
          ///
          /// Parent Type: `User`
          public struct User: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.User }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsActivityReplyLikeNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.UserAvatar }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("medium", String?.self),
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsThreadCommentMentionNotification
        ///
        /// Parent Type: `ThreadCommentMentionNotification`
        public struct AsThreadCommentMentionNotification: API.InlineFragment {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.ThreadCommentMentionNotification }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("commentId", Int.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<API.NotificationType>?.self),
            .field("createdAt", Int?.self),
          ] }

          /// The id of the Notification
          public var id: Int { __data["id"] }
          /// The notification context text
          public var context: String? { __data["context"] }
          /// The id of the comment where mentioned
          public var commentId: Int { __data["commentId"] }
          /// The id of the user who mentioned the authenticated user
          public var userId: Int { __data["userId"] }
          /// The user who mentioned the authenticated user
          public var user: User? { __data["user"] }
          /// The type of notification
          public var type: GraphQLEnum<API.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsThreadCommentMentionNotification.User
          ///
          /// Parent Type: `User`
          public struct User: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.User }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsThreadCommentMentionNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.UserAvatar }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("medium", String?.self),
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsThreadCommentReplyNotification
        ///
        /// Parent Type: `ThreadCommentReplyNotification`
        public struct AsThreadCommentReplyNotification: API.InlineFragment {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.ThreadCommentReplyNotification }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("commentId", Int.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<API.NotificationType>?.self),
            .field("createdAt", Int?.self),
          ] }

          /// The id of the Notification
          public var id: Int { __data["id"] }
          /// The notification context text
          public var context: String? { __data["context"] }
          /// The id of the reply comment
          public var commentId: Int { __data["commentId"] }
          /// The id of the user who create the comment reply
          public var userId: Int { __data["userId"] }
          /// The user who replied to the activity
          public var user: User? { __data["user"] }
          /// The type of notification
          public var type: GraphQLEnum<API.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsThreadCommentReplyNotification.User
          ///
          /// Parent Type: `User`
          public struct User: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.User }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsThreadCommentReplyNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.UserAvatar }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("medium", String?.self),
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsThreadCommentSubscribedNotification
        ///
        /// Parent Type: `ThreadCommentSubscribedNotification`
        public struct AsThreadCommentSubscribedNotification: API.InlineFragment {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.ThreadCommentSubscribedNotification }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("commentId", Int.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<API.NotificationType>?.self),
            .field("createdAt", Int?.self),
          ] }

          /// The id of the Notification
          public var id: Int { __data["id"] }
          /// The notification context text
          public var context: String? { __data["context"] }
          /// The id of the new comment in the subscribed thread
          public var commentId: Int { __data["commentId"] }
          /// The id of the user who commented on the thread
          public var userId: Int { __data["userId"] }
          /// The user who replied to the subscribed thread
          public var user: User? { __data["user"] }
          /// The type of notification
          public var type: GraphQLEnum<API.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsThreadCommentSubscribedNotification.User
          ///
          /// Parent Type: `User`
          public struct User: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.User }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsThreadCommentSubscribedNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.UserAvatar }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("medium", String?.self),
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsThreadCommentLikeNotification
        ///
        /// Parent Type: `ThreadCommentLikeNotification`
        public struct AsThreadCommentLikeNotification: API.InlineFragment {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.ThreadCommentLikeNotification }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("commentId", Int.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<API.NotificationType>?.self),
            .field("createdAt", Int?.self),
          ] }

          /// The id of the Notification
          public var id: Int { __data["id"] }
          /// The notification context text
          public var context: String? { __data["context"] }
          /// The id of the activity which was liked
          public var commentId: Int { __data["commentId"] }
          /// The id of the user who liked to the activity
          public var userId: Int { __data["userId"] }
          /// The user who liked the activity
          public var user: User? { __data["user"] }
          /// The type of notification
          public var type: GraphQLEnum<API.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsThreadCommentLikeNotification.User
          ///
          /// Parent Type: `User`
          public struct User: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.User }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsThreadCommentLikeNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.UserAvatar }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("medium", String?.self),
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsThreadLikeNotification
        ///
        /// Parent Type: `ThreadLikeNotification`
        public struct AsThreadLikeNotification: API.InlineFragment {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.ThreadLikeNotification }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("threadId", Int.self),
            .field("userId", Int.self),
            .field("user", User?.self),
            .field("type", GraphQLEnum<API.NotificationType>?.self),
            .field("createdAt", Int?.self),
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
          public var type: GraphQLEnum<API.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsThreadLikeNotification.User
          ///
          /// Parent Type: `User`
          public struct User: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.User }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("name", String.self),
              .field("avatar", Avatar?.self),
            ] }

            /// The name of the user
            public var name: String { __data["name"] }
            /// The user's avatar images
            public var avatar: Avatar? { __data["avatar"] }

            /// Page.Notification.AsThreadLikeNotification.User.Avatar
            ///
            /// Parent Type: `UserAvatar`
            public struct Avatar: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.UserAvatar }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("medium", String?.self),
              ] }

              /// The avatar of user at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsRelatedMediaAdditionNotification
        ///
        /// Parent Type: `RelatedMediaAdditionNotification`
        public struct AsRelatedMediaAdditionNotification: API.InlineFragment {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.RelatedMediaAdditionNotification }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("mediaId", Int.self),
            .field("media", Media?.self),
            .field("type", GraphQLEnum<API.NotificationType>?.self),
            .field("createdAt", Int?.self),
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
          public var type: GraphQLEnum<API.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsRelatedMediaAdditionNotification.Media
          ///
          /// Parent Type: `Media`
          public struct Media: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.Media }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("title", Title?.self),
              .field("coverImage", CoverImage?.self),
            ] }

            /// The official titles of the media in various languages
            public var title: Title? { __data["title"] }
            /// The cover images of the media
            public var coverImage: CoverImage? { __data["coverImage"] }

            /// Page.Notification.AsRelatedMediaAdditionNotification.Media.Title
            ///
            /// Parent Type: `MediaTitle`
            public struct Title: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaTitle }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("userPreferred", String?.self),
              ] }

              /// The currently authenticated users preferred title language. Default romaji for non-authenticated
              public var userPreferred: String? { __data["userPreferred"] }
            }

            /// Page.Notification.AsRelatedMediaAdditionNotification.Media.CoverImage
            ///
            /// Parent Type: `MediaCoverImage`
            public struct CoverImage: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaCoverImage }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("medium", String?.self),
              ] }

              /// The cover image url of the media at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsMediaDataChangeNotification
        ///
        /// Parent Type: `MediaDataChangeNotification`
        public struct AsMediaDataChangeNotification: API.InlineFragment {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaDataChangeNotification }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("mediaId", Int.self),
            .field("media", Media?.self),
            .field("type", GraphQLEnum<API.NotificationType>?.self),
            .field("createdAt", Int?.self),
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
          public var type: GraphQLEnum<API.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsMediaDataChangeNotification.Media
          ///
          /// Parent Type: `Media`
          public struct Media: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.Media }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("title", Title?.self),
              .field("coverImage", CoverImage?.self),
            ] }

            /// The official titles of the media in various languages
            public var title: Title? { __data["title"] }
            /// The cover images of the media
            public var coverImage: CoverImage? { __data["coverImage"] }

            /// Page.Notification.AsMediaDataChangeNotification.Media.Title
            ///
            /// Parent Type: `MediaTitle`
            public struct Title: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaTitle }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("userPreferred", String?.self),
              ] }

              /// The currently authenticated users preferred title language. Default romaji for non-authenticated
              public var userPreferred: String? { __data["userPreferred"] }
            }

            /// Page.Notification.AsMediaDataChangeNotification.Media.CoverImage
            ///
            /// Parent Type: `MediaCoverImage`
            public struct CoverImage: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaCoverImage }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("medium", String?.self),
              ] }

              /// The cover image url of the media at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsMediaMergeNotification
        ///
        /// Parent Type: `MediaMergeNotification`
        public struct AsMediaMergeNotification: API.InlineFragment {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaMergeNotification }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("reason", String?.self),
            .field("mediaId", Int.self),
            .field("media", Media?.self),
            .field("type", GraphQLEnum<API.NotificationType>?.self),
            .field("createdAt", Int?.self),
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
          public var type: GraphQLEnum<API.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }

          /// Page.Notification.AsMediaMergeNotification.Media
          ///
          /// Parent Type: `Media`
          public struct Media: API.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { API.Objects.Media }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("title", Title?.self),
              .field("coverImage", CoverImage?.self),
            ] }

            /// The official titles of the media in various languages
            public var title: Title? { __data["title"] }
            /// The cover images of the media
            public var coverImage: CoverImage? { __data["coverImage"] }

            /// Page.Notification.AsMediaMergeNotification.Media.Title
            ///
            /// Parent Type: `MediaTitle`
            public struct Title: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaTitle }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("userPreferred", String?.self),
              ] }

              /// The currently authenticated users preferred title language. Default romaji for non-authenticated
              public var userPreferred: String? { __data["userPreferred"] }
            }

            /// Page.Notification.AsMediaMergeNotification.Media.CoverImage
            ///
            /// Parent Type: `MediaCoverImage`
            public struct CoverImage: API.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaCoverImage }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("medium", String?.self),
              ] }

              /// The cover image url of the media at medium size
              public var medium: String? { __data["medium"] }
            }
          }
        }

        /// Page.Notification.AsMediaDeletionNotification
        ///
        /// Parent Type: `MediaDeletionNotification`
        public struct AsMediaDeletionNotification: API.InlineFragment {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaDeletionNotification }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", Int.self),
            .field("context", String?.self),
            .field("reason", String?.self),
            .field("deletedMediaTitle", String?.self),
            .field("type", GraphQLEnum<API.NotificationType>?.self),
            .field("createdAt", Int?.self),
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
          public var type: GraphQLEnum<API.NotificationType>? { __data["type"] }
          /// The time the notification was created at
          public var createdAt: Int? { __data["createdAt"] }
        }
      }

      /// Page.PageInfo
      ///
      /// Parent Type: `PageInfo`
      public struct PageInfo: API.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { API.Objects.PageInfo }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("currentPage", Int?.self),
          .field("hasNextPage", Bool?.self),
        ] }

        /// The current page
        public var currentPage: Int? { __data["currentPage"] }
        /// If there is another page
        public var hasNextPage: Bool? { __data["hasNextPage"] }
      }
    }
  }
}
