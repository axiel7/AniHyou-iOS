// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == AniListAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == AniListAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == AniListAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == AniListAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  @_spi(Execution) public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "ActivityLikeNotification": return AniListAPI.Objects.ActivityLikeNotification
    case "ActivityMentionNotification": return AniListAPI.Objects.ActivityMentionNotification
    case "ActivityMessageNotification": return AniListAPI.Objects.ActivityMessageNotification
    case "ActivityReply": return AniListAPI.Objects.ActivityReply
    case "ActivityReplyLikeNotification": return AniListAPI.Objects.ActivityReplyLikeNotification
    case "ActivityReplyNotification": return AniListAPI.Objects.ActivityReplyNotification
    case "ActivityReplySubscribedNotification": return AniListAPI.Objects.ActivityReplySubscribedNotification
    case "AiringNotification": return AniListAPI.Objects.AiringNotification
    case "AiringSchedule": return AniListAPI.Objects.AiringSchedule
    case "Character": return AniListAPI.Objects.Character
    case "CharacterConnection": return AniListAPI.Objects.CharacterConnection
    case "CharacterEdge": return AniListAPI.Objects.CharacterEdge
    case "CharacterImage": return AniListAPI.Objects.CharacterImage
    case "CharacterName": return AniListAPI.Objects.CharacterName
    case "Deleted": return AniListAPI.Objects.Deleted
    case "Favourites": return AniListAPI.Objects.Favourites
    case "FollowingNotification": return AniListAPI.Objects.FollowingNotification
    case "FuzzyDate": return AniListAPI.Objects.FuzzyDate
    case "ListActivity": return AniListAPI.Objects.ListActivity
    case "Media": return AniListAPI.Objects.Media
    case "MediaConnection": return AniListAPI.Objects.MediaConnection
    case "MediaCoverImage": return AniListAPI.Objects.MediaCoverImage
    case "MediaDataChangeNotification": return AniListAPI.Objects.MediaDataChangeNotification
    case "MediaDeletionNotification": return AniListAPI.Objects.MediaDeletionNotification
    case "MediaEdge": return AniListAPI.Objects.MediaEdge
    case "MediaExternalLink": return AniListAPI.Objects.MediaExternalLink
    case "MediaList": return AniListAPI.Objects.MediaList
    case "MediaListCollection": return AniListAPI.Objects.MediaListCollection
    case "MediaListGroup": return AniListAPI.Objects.MediaListGroup
    case "MediaListOptions": return AniListAPI.Objects.MediaListOptions
    case "MediaListTypeOptions": return AniListAPI.Objects.MediaListTypeOptions
    case "MediaMergeNotification": return AniListAPI.Objects.MediaMergeNotification
    case "MediaRank": return AniListAPI.Objects.MediaRank
    case "MediaStats": return AniListAPI.Objects.MediaStats
    case "MediaStreamingEpisode": return AniListAPI.Objects.MediaStreamingEpisode
    case "MediaTag": return AniListAPI.Objects.MediaTag
    case "MediaTitle": return AniListAPI.Objects.MediaTitle
    case "MediaTrailer": return AniListAPI.Objects.MediaTrailer
    case "MessageActivity": return AniListAPI.Objects.MessageActivity
    case "Mutation": return AniListAPI.Objects.Mutation
    case "Page": return AniListAPI.Objects.Page
    case "PageInfo": return AniListAPI.Objects.PageInfo
    case "Query": return AniListAPI.Objects.Query
    case "Recommendation": return AniListAPI.Objects.Recommendation
    case "RecommendationConnection": return AniListAPI.Objects.RecommendationConnection
    case "RelatedMediaAdditionNotification": return AniListAPI.Objects.RelatedMediaAdditionNotification
    case "Review": return AniListAPI.Objects.Review
    case "ReviewConnection": return AniListAPI.Objects.ReviewConnection
    case "ScoreDistribution": return AniListAPI.Objects.ScoreDistribution
    case "Staff": return AniListAPI.Objects.Staff
    case "StaffConnection": return AniListAPI.Objects.StaffConnection
    case "StaffEdge": return AniListAPI.Objects.StaffEdge
    case "StaffImage": return AniListAPI.Objects.StaffImage
    case "StaffName": return AniListAPI.Objects.StaffName
    case "StatusDistribution": return AniListAPI.Objects.StatusDistribution
    case "Studio": return AniListAPI.Objects.Studio
    case "StudioConnection": return AniListAPI.Objects.StudioConnection
    case "TextActivity": return AniListAPI.Objects.TextActivity
    case "Thread": return AniListAPI.Objects.Thread
    case "ThreadComment": return AniListAPI.Objects.ThreadComment
    case "ThreadCommentLikeNotification": return AniListAPI.Objects.ThreadCommentLikeNotification
    case "ThreadCommentMentionNotification": return AniListAPI.Objects.ThreadCommentMentionNotification
    case "ThreadCommentReplyNotification": return AniListAPI.Objects.ThreadCommentReplyNotification
    case "ThreadCommentSubscribedNotification": return AniListAPI.Objects.ThreadCommentSubscribedNotification
    case "ThreadLikeNotification": return AniListAPI.Objects.ThreadLikeNotification
    case "User": return AniListAPI.Objects.User
    case "UserAvatar": return AniListAPI.Objects.UserAvatar
    case "UserCountryStatistic": return AniListAPI.Objects.UserCountryStatistic
    case "UserFormatStatistic": return AniListAPI.Objects.UserFormatStatistic
    case "UserGenreStatistic": return AniListAPI.Objects.UserGenreStatistic
    case "UserLengthStatistic": return AniListAPI.Objects.UserLengthStatistic
    case "UserOptions": return AniListAPI.Objects.UserOptions
    case "UserReleaseYearStatistic": return AniListAPI.Objects.UserReleaseYearStatistic
    case "UserScoreStatistic": return AniListAPI.Objects.UserScoreStatistic
    case "UserStaffStatistic": return AniListAPI.Objects.UserStaffStatistic
    case "UserStartYearStatistic": return AniListAPI.Objects.UserStartYearStatistic
    case "UserStatisticTypes": return AniListAPI.Objects.UserStatisticTypes
    case "UserStatistics": return AniListAPI.Objects.UserStatistics
    case "UserStatusStatistic": return AniListAPI.Objects.UserStatusStatistic
    case "UserStudioStatistic": return AniListAPI.Objects.UserStudioStatistic
    case "UserTagStatistic": return AniListAPI.Objects.UserTagStatistic
    case "UserVoiceActorStatistic": return AniListAPI.Objects.UserVoiceActorStatistic
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
