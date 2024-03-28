// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == AniListAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == AniListAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == AniListAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == AniListAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Query": return AniListAPI.Objects.Query
    case "MediaTag": return AniListAPI.Objects.MediaTag
    case "Mutation": return AniListAPI.Objects.Mutation
    case "ListActivity": return AniListAPI.Objects.ListActivity
    case "TextActivity": return AniListAPI.Objects.TextActivity
    case "MessageActivity": return AniListAPI.Objects.MessageActivity
    case "ActivityReply": return AniListAPI.Objects.ActivityReply
    case "Thread": return AniListAPI.Objects.Thread
    case "ThreadComment": return AniListAPI.Objects.ThreadComment
    case "Page": return AniListAPI.Objects.Page
    case "Studio": return AniListAPI.Objects.Studio
    case "MediaConnection": return AniListAPI.Objects.MediaConnection
    case "Media": return AniListAPI.Objects.Media
    case "MediaCoverImage": return AniListAPI.Objects.MediaCoverImage
    case "MediaTitle": return AniListAPI.Objects.MediaTitle
    case "MediaList": return AniListAPI.Objects.MediaList
    case "PageInfo": return AniListAPI.Objects.PageInfo
    case "FuzzyDate": return AniListAPI.Objects.FuzzyDate
    case "Deleted": return AniListAPI.Objects.Deleted
    case "AiringSchedule": return AniListAPI.Objects.AiringSchedule
    case "User": return AniListAPI.Objects.User
    case "UserAvatar": return AniListAPI.Objects.UserAvatar
    case "Character": return AniListAPI.Objects.Character
    case "MediaEdge": return AniListAPI.Objects.MediaEdge
    case "Staff": return AniListAPI.Objects.Staff
    case "StaffName": return AniListAPI.Objects.StaffName
    case "CharacterName": return AniListAPI.Objects.CharacterName
    case "CharacterImage": return AniListAPI.Objects.CharacterImage
    case "Favourites": return AniListAPI.Objects.Favourites
    case "StudioConnection": return AniListAPI.Objects.StudioConnection
    case "CharacterConnection": return AniListAPI.Objects.CharacterConnection
    case "StaffConnection": return AniListAPI.Objects.StaffConnection
    case "StaffImage": return AniListAPI.Objects.StaffImage
    case "UserOptions": return AniListAPI.Objects.UserOptions
    case "MediaListOptions": return AniListAPI.Objects.MediaListOptions
    case "MediaListTypeOptions": return AniListAPI.Objects.MediaListTypeOptions
    case "AiringNotification": return AniListAPI.Objects.AiringNotification
    case "FollowingNotification": return AniListAPI.Objects.FollowingNotification
    case "ActivityMessageNotification": return AniListAPI.Objects.ActivityMessageNotification
    case "ActivityMentionNotification": return AniListAPI.Objects.ActivityMentionNotification
    case "ActivityReplyNotification": return AniListAPI.Objects.ActivityReplyNotification
    case "ActivityReplySubscribedNotification": return AniListAPI.Objects.ActivityReplySubscribedNotification
    case "ActivityLikeNotification": return AniListAPI.Objects.ActivityLikeNotification
    case "ActivityReplyLikeNotification": return AniListAPI.Objects.ActivityReplyLikeNotification
    case "ThreadCommentMentionNotification": return AniListAPI.Objects.ThreadCommentMentionNotification
    case "ThreadCommentReplyNotification": return AniListAPI.Objects.ThreadCommentReplyNotification
    case "ThreadCommentSubscribedNotification": return AniListAPI.Objects.ThreadCommentSubscribedNotification
    case "ThreadCommentLikeNotification": return AniListAPI.Objects.ThreadCommentLikeNotification
    case "ThreadLikeNotification": return AniListAPI.Objects.ThreadLikeNotification
    case "RelatedMediaAdditionNotification": return AniListAPI.Objects.RelatedMediaAdditionNotification
    case "MediaDataChangeNotification": return AniListAPI.Objects.MediaDataChangeNotification
    case "MediaMergeNotification": return AniListAPI.Objects.MediaMergeNotification
    case "MediaDeletionNotification": return AniListAPI.Objects.MediaDeletionNotification
    case "Review": return AniListAPI.Objects.Review
    case "MediaStats": return AniListAPI.Objects.MediaStats
    case "StatusDistribution": return AniListAPI.Objects.StatusDistribution
    case "ScoreDistribution": return AniListAPI.Objects.ScoreDistribution
    case "MediaRank": return AniListAPI.Objects.MediaRank
    case "RecommendationConnection": return AniListAPI.Objects.RecommendationConnection
    case "Recommendation": return AniListAPI.Objects.Recommendation
    case "MediaExternalLink": return AniListAPI.Objects.MediaExternalLink
    case "MediaTrailer": return AniListAPI.Objects.MediaTrailer
    case "MediaStreamingEpisode": return AniListAPI.Objects.MediaStreamingEpisode
    case "ReviewConnection": return AniListAPI.Objects.ReviewConnection
    case "CharacterEdge": return AniListAPI.Objects.CharacterEdge
    case "StaffEdge": return AniListAPI.Objects.StaffEdge
    case "UserStatisticTypes": return AniListAPI.Objects.UserStatisticTypes
    case "UserStatistics": return AniListAPI.Objects.UserStatistics
    case "UserTagStatistic": return AniListAPI.Objects.UserTagStatistic
    case "UserGenreStatistic": return AniListAPI.Objects.UserGenreStatistic
    case "UserScoreStatistic": return AniListAPI.Objects.UserScoreStatistic
    case "UserFormatStatistic": return AniListAPI.Objects.UserFormatStatistic
    case "UserStatusStatistic": return AniListAPI.Objects.UserStatusStatistic
    case "UserCountryStatistic": return AniListAPI.Objects.UserCountryStatistic
    case "UserReleaseYearStatistic": return AniListAPI.Objects.UserReleaseYearStatistic
    case "UserStartYearStatistic": return AniListAPI.Objects.UserStartYearStatistic
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
