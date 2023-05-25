// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == API.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == API.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == API.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == API.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> Object? {
    switch typename {
    case "Query": return API.Objects.Query
    case "Page": return API.Objects.Page
    case "Media": return API.Objects.Media
    case "MediaTitle": return API.Objects.MediaTitle
    case "MediaCoverImage": return API.Objects.MediaCoverImage
    case "PageInfo": return API.Objects.PageInfo
    case "MediaTag": return API.Objects.MediaTag
    case "Mutation": return API.Objects.Mutation
    case "MediaList": return API.Objects.MediaList
    case "FuzzyDate": return API.Objects.FuzzyDate
    case "User": return API.Objects.User
    case "Favourites": return API.Objects.Favourites
    case "MediaConnection": return API.Objects.MediaConnection
    case "UserAvatar": return API.Objects.UserAvatar
    case "StudioConnection": return API.Objects.StudioConnection
    case "Studio": return API.Objects.Studio
    case "Deleted": return API.Objects.Deleted
    case "CharacterConnection": return API.Objects.CharacterConnection
    case "Character": return API.Objects.Character
    case "CharacterName": return API.Objects.CharacterName
    case "CharacterImage": return API.Objects.CharacterImage
    case "MediaStats": return API.Objects.MediaStats
    case "StatusDistribution": return API.Objects.StatusDistribution
    case "ScoreDistribution": return API.Objects.ScoreDistribution
    case "MediaRank": return API.Objects.MediaRank
    case "UserOptions": return API.Objects.UserOptions
    case "MediaListOptions": return API.Objects.MediaListOptions
    case "MediaEdge": return API.Objects.MediaEdge
    case "RecommendationConnection": return API.Objects.RecommendationConnection
    case "Recommendation": return API.Objects.Recommendation
    case "AiringSchedule": return API.Objects.AiringSchedule
    case "MediaExternalLink": return API.Objects.MediaExternalLink
    case "MediaTrailer": return API.Objects.MediaTrailer
    case "MediaStreamingEpisode": return API.Objects.MediaStreamingEpisode
    case "Thread": return API.Objects.Thread
    case "ReviewConnection": return API.Objects.ReviewConnection
    case "Review": return API.Objects.Review
    case "Staff": return API.Objects.Staff
    case "StaffName": return API.Objects.StaffName
    case "StaffImage": return API.Objects.StaffImage
    case "StaffConnection": return API.Objects.StaffConnection
    case "AiringNotification": return API.Objects.AiringNotification
    case "FollowingNotification": return API.Objects.FollowingNotification
    case "ActivityMessageNotification": return API.Objects.ActivityMessageNotification
    case "ActivityMentionNotification": return API.Objects.ActivityMentionNotification
    case "ActivityReplyNotification": return API.Objects.ActivityReplyNotification
    case "ActivityReplySubscribedNotification": return API.Objects.ActivityReplySubscribedNotification
    case "ActivityLikeNotification": return API.Objects.ActivityLikeNotification
    case "ActivityReplyLikeNotification": return API.Objects.ActivityReplyLikeNotification
    case "ThreadCommentMentionNotification": return API.Objects.ThreadCommentMentionNotification
    case "ThreadCommentReplyNotification": return API.Objects.ThreadCommentReplyNotification
    case "ThreadCommentSubscribedNotification": return API.Objects.ThreadCommentSubscribedNotification
    case "ThreadCommentLikeNotification": return API.Objects.ThreadCommentLikeNotification
    case "ThreadLikeNotification": return API.Objects.ThreadLikeNotification
    case "RelatedMediaAdditionNotification": return API.Objects.RelatedMediaAdditionNotification
    case "MediaDataChangeNotification": return API.Objects.MediaDataChangeNotification
    case "MediaMergeNotification": return API.Objects.MediaMergeNotification
    case "MediaDeletionNotification": return API.Objects.MediaDeletionNotification
    case "UserStatisticTypes": return API.Objects.UserStatisticTypes
    case "UserStatistics": return API.Objects.UserStatistics
    case "UserScoreStatistic": return API.Objects.UserScoreStatistic
    case "UserFormatStatistic": return API.Objects.UserFormatStatistic
    case "UserStatusStatistic": return API.Objects.UserStatusStatistic
    case "UserCountryStatistic": return API.Objects.UserCountryStatistic
    case "UserReleaseYearStatistic": return API.Objects.UserReleaseYearStatistic
    case "UserStartYearStatistic": return API.Objects.UserStartYearStatistic
    case "CharacterEdge": return API.Objects.CharacterEdge
    case "StaffEdge": return API.Objects.StaffEdge
    case "ThreadComment": return API.Objects.ThreadComment
    case "TextActivity": return API.Objects.TextActivity
    case "ListActivity": return API.Objects.ListActivity
    case "MessageActivity": return API.Objects.MessageActivity
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
