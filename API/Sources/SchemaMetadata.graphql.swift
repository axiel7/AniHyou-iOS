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
    case "Mutation": return API.Objects.Mutation
    case "MediaList": return API.Objects.MediaList
    case "FuzzyDate": return API.Objects.FuzzyDate
    case "User": return API.Objects.User
    case "Favourites": return API.Objects.Favourites
    case "MediaConnection": return API.Objects.MediaConnection
    case "PageInfo": return API.Objects.PageInfo
    case "UserAvatar": return API.Objects.UserAvatar
    case "StudioConnection": return API.Objects.StudioConnection
    case "Studio": return API.Objects.Studio
    case "Deleted": return API.Objects.Deleted
    case "CharacterConnection": return API.Objects.CharacterConnection
    case "Character": return API.Objects.Character
    case "CharacterName": return API.Objects.CharacterName
    case "CharacterImage": return API.Objects.CharacterImage
    case "UserOptions": return API.Objects.UserOptions
    case "MediaEdge": return API.Objects.MediaEdge
    case "RecommendationConnection": return API.Objects.RecommendationConnection
    case "Recommendation": return API.Objects.Recommendation
    case "AiringSchedule": return API.Objects.AiringSchedule
    case "MediaExternalLink": return API.Objects.MediaExternalLink
    case "Thread": return API.Objects.Thread
    case "ReviewConnection": return API.Objects.ReviewConnection
    case "Review": return API.Objects.Review
    case "Staff": return API.Objects.Staff
    case "StaffName": return API.Objects.StaffName
    case "StaffImage": return API.Objects.StaffImage
    case "StaffConnection": return API.Objects.StaffConnection
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
