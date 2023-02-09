// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public extension Unions {
  /// Notification union type
  static let NotificationUnion = Union(
    name: "NotificationUnion",
    possibleTypes: [
      Objects.AiringNotification.self,
      Objects.FollowingNotification.self,
      Objects.ActivityMessageNotification.self,
      Objects.ActivityMentionNotification.self,
      Objects.ActivityReplyNotification.self,
      Objects.ActivityReplySubscribedNotification.self,
      Objects.ActivityLikeNotification.self,
      Objects.ActivityReplyLikeNotification.self,
      Objects.ThreadCommentMentionNotification.self,
      Objects.ThreadCommentReplyNotification.self,
      Objects.ThreadCommentSubscribedNotification.self,
      Objects.ThreadCommentLikeNotification.self,
      Objects.ThreadLikeNotification.self,
      Objects.RelatedMediaAdditionNotification.self,
      Objects.MediaDataChangeNotification.self,
      Objects.MediaMergeNotification.self,
      Objects.MediaDeletionNotification.self
    ]
  )
}