// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

nonisolated public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == AniListAPI.SchemaMetadata {}

nonisolated public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == AniListAPI.SchemaMetadata {}

nonisolated public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == AniListAPI.SchemaMetadata {}

nonisolated public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == AniListAPI.SchemaMetadata {}

nonisolated public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  private static let objectTypeMap: [String: ApolloAPI.Object] = [
    "ActivityLikeNotification": AniListAPI.Objects.ActivityLikeNotification,
    "ActivityMentionNotification": AniListAPI.Objects.ActivityMentionNotification,
    "ActivityMessageNotification": AniListAPI.Objects.ActivityMessageNotification,
    "ActivityReply": AniListAPI.Objects.ActivityReply,
    "ActivityReplyLikeNotification": AniListAPI.Objects.ActivityReplyLikeNotification,
    "ActivityReplyNotification": AniListAPI.Objects.ActivityReplyNotification,
    "ActivityReplySubscribedNotification": AniListAPI.Objects.ActivityReplySubscribedNotification,
    "AiringNotification": AniListAPI.Objects.AiringNotification,
    "AiringSchedule": AniListAPI.Objects.AiringSchedule,
    "Character": AniListAPI.Objects.Character,
    "CharacterConnection": AniListAPI.Objects.CharacterConnection,
    "CharacterEdge": AniListAPI.Objects.CharacterEdge,
    "CharacterImage": AniListAPI.Objects.CharacterImage,
    "CharacterName": AniListAPI.Objects.CharacterName,
    "CharacterSubmissionUpdateNotification": AniListAPI.Objects.CharacterSubmissionUpdateNotification,
    "Deleted": AniListAPI.Objects.Deleted,
    "Favourites": AniListAPI.Objects.Favourites,
    "FollowingNotification": AniListAPI.Objects.FollowingNotification,
    "FuzzyDate": AniListAPI.Objects.FuzzyDate,
    "ListActivity": AniListAPI.Objects.ListActivity,
    "Media": AniListAPI.Objects.Media,
    "MediaConnection": AniListAPI.Objects.MediaConnection,
    "MediaCoverImage": AniListAPI.Objects.MediaCoverImage,
    "MediaDataChangeNotification": AniListAPI.Objects.MediaDataChangeNotification,
    "MediaDeletionNotification": AniListAPI.Objects.MediaDeletionNotification,
    "MediaEdge": AniListAPI.Objects.MediaEdge,
    "MediaExternalLink": AniListAPI.Objects.MediaExternalLink,
    "MediaList": AniListAPI.Objects.MediaList,
    "MediaListCollection": AniListAPI.Objects.MediaListCollection,
    "MediaListGroup": AniListAPI.Objects.MediaListGroup,
    "MediaListOptions": AniListAPI.Objects.MediaListOptions,
    "MediaListTypeOptions": AniListAPI.Objects.MediaListTypeOptions,
    "MediaMergeNotification": AniListAPI.Objects.MediaMergeNotification,
    "MediaRank": AniListAPI.Objects.MediaRank,
    "MediaStats": AniListAPI.Objects.MediaStats,
    "MediaStreamingEpisode": AniListAPI.Objects.MediaStreamingEpisode,
    "MediaSubmissionUpdateNotification": AniListAPI.Objects.MediaSubmissionUpdateNotification,
    "MediaTag": AniListAPI.Objects.MediaTag,
    "MediaTitle": AniListAPI.Objects.MediaTitle,
    "MediaTrailer": AniListAPI.Objects.MediaTrailer,
    "MessageActivity": AniListAPI.Objects.MessageActivity,
    "Mutation": AniListAPI.Objects.Mutation,
    "Page": AniListAPI.Objects.Page,
    "PageInfo": AniListAPI.Objects.PageInfo,
    "Query": AniListAPI.Objects.Query,
    "Recommendation": AniListAPI.Objects.Recommendation,
    "RecommendationConnection": AniListAPI.Objects.RecommendationConnection,
    "RelatedMediaAdditionNotification": AniListAPI.Objects.RelatedMediaAdditionNotification,
    "Review": AniListAPI.Objects.Review,
    "ReviewConnection": AniListAPI.Objects.ReviewConnection,
    "ScoreDistribution": AniListAPI.Objects.ScoreDistribution,
    "Staff": AniListAPI.Objects.Staff,
    "StaffConnection": AniListAPI.Objects.StaffConnection,
    "StaffEdge": AniListAPI.Objects.StaffEdge,
    "StaffImage": AniListAPI.Objects.StaffImage,
    "StaffName": AniListAPI.Objects.StaffName,
    "StaffSubmissionUpdateNotification": AniListAPI.Objects.StaffSubmissionUpdateNotification,
    "StatusDistribution": AniListAPI.Objects.StatusDistribution,
    "Studio": AniListAPI.Objects.Studio,
    "StudioConnection": AniListAPI.Objects.StudioConnection,
    "TextActivity": AniListAPI.Objects.TextActivity,
    "Thread": AniListAPI.Objects.Thread,
    "ThreadComment": AniListAPI.Objects.ThreadComment,
    "ThreadCommentLikeNotification": AniListAPI.Objects.ThreadCommentLikeNotification,
    "ThreadCommentMentionNotification": AniListAPI.Objects.ThreadCommentMentionNotification,
    "ThreadCommentReplyNotification": AniListAPI.Objects.ThreadCommentReplyNotification,
    "ThreadCommentSubscribedNotification": AniListAPI.Objects.ThreadCommentSubscribedNotification,
    "ThreadLikeNotification": AniListAPI.Objects.ThreadLikeNotification,
    "User": AniListAPI.Objects.User,
    "UserAvatar": AniListAPI.Objects.UserAvatar,
    "UserCountryStatistic": AniListAPI.Objects.UserCountryStatistic,
    "UserFormatStatistic": AniListAPI.Objects.UserFormatStatistic,
    "UserGenreStatistic": AniListAPI.Objects.UserGenreStatistic,
    "UserLengthStatistic": AniListAPI.Objects.UserLengthStatistic,
    "UserOptions": AniListAPI.Objects.UserOptions,
    "UserReleaseYearStatistic": AniListAPI.Objects.UserReleaseYearStatistic,
    "UserScoreStatistic": AniListAPI.Objects.UserScoreStatistic,
    "UserStaffStatistic": AniListAPI.Objects.UserStaffStatistic,
    "UserStartYearStatistic": AniListAPI.Objects.UserStartYearStatistic,
    "UserStatisticTypes": AniListAPI.Objects.UserStatisticTypes,
    "UserStatistics": AniListAPI.Objects.UserStatistics,
    "UserStatusStatistic": AniListAPI.Objects.UserStatusStatistic,
    "UserStudioStatistic": AniListAPI.Objects.UserStudioStatistic,
    "UserTagStatistic": AniListAPI.Objects.UserTagStatistic,
    "UserVoiceActorStatistic": AniListAPI.Objects.UserVoiceActorStatistic
  ]

  @_spi(Execution) public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    objectTypeMap[typename]
  }
}

nonisolated public enum Objects {}
nonisolated public enum Interfaces {}
nonisolated public enum Unions {}
