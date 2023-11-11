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
    case "Page": return AniListAPI.Objects.Page
    case "Media": return AniListAPI.Objects.Media
    case "MediaTitle": return AniListAPI.Objects.MediaTitle
    case "MediaCoverImage": return AniListAPI.Objects.MediaCoverImage
    case "MediaList": return AniListAPI.Objects.MediaList
    case "PageInfo": return AniListAPI.Objects.PageInfo
    case "MediaTag": return AniListAPI.Objects.MediaTag
    case "Mutation": return AniListAPI.Objects.Mutation
    case "FuzzyDate": return AniListAPI.Objects.FuzzyDate
    case "Staff": return AniListAPI.Objects.Staff
    case "MediaConnection": return AniListAPI.Objects.MediaConnection
    case "MediaEdge": return AniListAPI.Objects.MediaEdge
    case "User": return AniListAPI.Objects.User
    case "Favourites": return AniListAPI.Objects.Favourites
    case "AiringSchedule": return AniListAPI.Objects.AiringSchedule
    case "UserOptions": return AniListAPI.Objects.UserOptions
    case "MediaListOptions": return AniListAPI.Objects.MediaListOptions
    case "MediaListTypeOptions": return AniListAPI.Objects.MediaListTypeOptions
    case "UserAvatar": return AniListAPI.Objects.UserAvatar
    case "StudioConnection": return AniListAPI.Objects.StudioConnection
    case "Studio": return AniListAPI.Objects.Studio
    case "Deleted": return AniListAPI.Objects.Deleted
    case "CharacterConnection": return AniListAPI.Objects.CharacterConnection
    case "Character": return AniListAPI.Objects.Character
    case "CharacterName": return AniListAPI.Objects.CharacterName
    case "CharacterImage": return AniListAPI.Objects.CharacterImage
    case "MediaStats": return AniListAPI.Objects.MediaStats
    case "StatusDistribution": return AniListAPI.Objects.StatusDistribution
    case "ScoreDistribution": return AniListAPI.Objects.ScoreDistribution
    case "MediaRank": return AniListAPI.Objects.MediaRank
    case "RecommendationConnection": return AniListAPI.Objects.RecommendationConnection
    case "Recommendation": return AniListAPI.Objects.Recommendation
    case "MediaExternalLink": return AniListAPI.Objects.MediaExternalLink
    case "MediaTrailer": return AniListAPI.Objects.MediaTrailer
    case "MediaStreamingEpisode": return AniListAPI.Objects.MediaStreamingEpisode
    case "Thread": return AniListAPI.Objects.Thread
    case "ReviewConnection": return AniListAPI.Objects.ReviewConnection
    case "Review": return AniListAPI.Objects.Review
    case "StaffName": return AniListAPI.Objects.StaffName
    case "StaffImage": return AniListAPI.Objects.StaffImage
    case "ListActivity": return AniListAPI.Objects.ListActivity
    case "TextActivity": return AniListAPI.Objects.TextActivity
    case "MessageActivity": return AniListAPI.Objects.MessageActivity
    case "ActivityReply": return AniListAPI.Objects.ActivityReply
    case "ThreadComment": return AniListAPI.Objects.ThreadComment
    case "StaffConnection": return AniListAPI.Objects.StaffConnection
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
    case "UserStatisticTypes": return AniListAPI.Objects.UserStatisticTypes
    case "UserStatistics": return AniListAPI.Objects.UserStatistics
    case "UserScoreStatistic": return AniListAPI.Objects.UserScoreStatistic
    case "UserFormatStatistic": return AniListAPI.Objects.UserFormatStatistic
    case "UserStatusStatistic": return AniListAPI.Objects.UserStatusStatistic
    case "UserCountryStatistic": return AniListAPI.Objects.UserCountryStatistic
    case "UserReleaseYearStatistic": return AniListAPI.Objects.UserReleaseYearStatistic
    case "UserStartYearStatistic": return AniListAPI.Objects.UserStartYearStatistic
    case "CharacterEdge": return AniListAPI.Objects.CharacterEdge
    case "StaffEdge": return AniListAPI.Objects.StaffEdge
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
