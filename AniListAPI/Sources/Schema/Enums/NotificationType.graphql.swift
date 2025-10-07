// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) import ApolloAPI

/// Notification type enum
public enum NotificationType: String, EnumType {
  /// A user has sent you message
  case activityMessage = "ACTIVITY_MESSAGE"
  /// A user has replied to your activity
  case activityReply = "ACTIVITY_REPLY"
  /// A user has followed you
  case following = "FOLLOWING"
  /// A user has mentioned you in their activity
  case activityMention = "ACTIVITY_MENTION"
  /// A user has mentioned you in a forum comment
  case threadCommentMention = "THREAD_COMMENT_MENTION"
  /// A user has commented in one of your subscribed forum threads
  case threadSubscribed = "THREAD_SUBSCRIBED"
  /// A user has replied to your forum comment
  case threadCommentReply = "THREAD_COMMENT_REPLY"
  /// An anime you are currently watching has aired
  case airing = "AIRING"
  /// A user has liked your activity
  case activityLike = "ACTIVITY_LIKE"
  /// A user has liked your activity reply
  case activityReplyLike = "ACTIVITY_REPLY_LIKE"
  /// A user has liked your forum thread
  case threadLike = "THREAD_LIKE"
  /// A user has liked your forum comment
  case threadCommentLike = "THREAD_COMMENT_LIKE"
  /// A user has replied to activity you have also replied to
  case activityReplySubscribed = "ACTIVITY_REPLY_SUBSCRIBED"
  /// A new anime or manga has been added to the site where its related media is on the user's list
  case relatedMediaAddition = "RELATED_MEDIA_ADDITION"
  /// An anime or manga has had a data change that affects how a user may track it in their lists
  case mediaDataChange = "MEDIA_DATA_CHANGE"
  /// Anime or manga entries on the user's list have been merged into a single entry
  case mediaMerge = "MEDIA_MERGE"
  /// An anime or manga on the user's list has been deleted from the site
  case mediaDeletion = "MEDIA_DELETION"
}
