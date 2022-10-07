// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI
@_exported import enum ApolloAPI.GraphQLEnum
@_exported import enum ApolloAPI.GraphQLNullable
import API

public struct MediaCharacter: API.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment MediaCharacter on CharacterEdge {
      __typename
      role
      node {
        __typename
        id
        name {
          __typename
          userPreferred
        }
        image {
          __typename
          medium
        }
      }
      voiceActors(language: JAPANESE) {
        __typename
        id
        name {
          __typename
          userPreferred
        }
        image {
          __typename
          medium
        }
      }
    }
    """ }

  public let __data: DataDict
  public init(data: DataDict) { __data = data }

  public static var __parentType: ParentType { API.Objects.CharacterEdge }
  public static var __selections: [Selection] { [
    .field("role", GraphQLEnum<API.CharacterRole>?.self),
    .field("node", Node?.self),
    .field("voiceActors", [VoiceActor?]?.self, arguments: ["language": "JAPANESE"]),
  ] }

  /// The characters role in the media
  public var role: GraphQLEnum<API.CharacterRole>? { __data["role"] }
  public var node: Node? { __data["node"] }
  /// The voice actors of the character
  public var voiceActors: [VoiceActor?]? { __data["voiceActors"] }

  /// Node
  ///
  /// Parent Type: `Character`
  public struct Node: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { API.Objects.Character }
    public static var __selections: [Selection] { [
      .field("id", Int.self),
      .field("name", Name?.self),
      .field("image", Image?.self),
    ] }

    /// The id of the character
    public var id: Int { __data["id"] }
    /// The names of the character
    public var name: Name? { __data["name"] }
    /// Character images
    public var image: Image? { __data["image"] }

    /// Node.Name
    ///
    /// Parent Type: `CharacterName`
    public struct Name: API.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { API.Objects.CharacterName }
      public static var __selections: [Selection] { [
        .field("userPreferred", String?.self),
      ] }

      /// The currently authenticated users preferred name language. Default romaji for non-authenticated
      public var userPreferred: String? { __data["userPreferred"] }
    }

    /// Node.Image
    ///
    /// Parent Type: `CharacterImage`
    public struct Image: API.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { API.Objects.CharacterImage }
      public static var __selections: [Selection] { [
        .field("medium", String?.self),
      ] }

      /// The character's image of media at medium size
      public var medium: String? { __data["medium"] }
    }
  }

  /// VoiceActor
  ///
  /// Parent Type: `Staff`
  public struct VoiceActor: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { API.Objects.Staff }
    public static var __selections: [Selection] { [
      .field("id", Int.self),
      .field("name", Name?.self),
      .field("image", Image?.self),
    ] }

    /// The id of the staff member
    public var id: Int { __data["id"] }
    /// The names of the staff member
    public var name: Name? { __data["name"] }
    /// The staff images
    public var image: Image? { __data["image"] }

    /// VoiceActor.Name
    ///
    /// Parent Type: `StaffName`
    public struct Name: API.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { API.Objects.StaffName }
      public static var __selections: [Selection] { [
        .field("userPreferred", String?.self),
      ] }

      /// The currently authenticated users preferred name language. Default romaji for non-authenticated
      public var userPreferred: String? { __data["userPreferred"] }
    }

    /// VoiceActor.Image
    ///
    /// Parent Type: `StaffImage`
    public struct Image: API.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { API.Objects.StaffImage }
      public static var __selections: [Selection] { [
        .field("medium", String?.self),
      ] }

      /// The person's image of media at medium size
      public var medium: String? { __data["medium"] }
    }
  }
}
