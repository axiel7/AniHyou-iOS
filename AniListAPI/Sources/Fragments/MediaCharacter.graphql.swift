// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct MediaCharacter: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment MediaCharacter on CharacterEdge { __typename id role node { __typename id name { __typename userPreferred } image { __typename medium } } voiceActors(language: JAPANESE) { __typename id name { __typename userPreferred } image { __typename medium } } }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.CharacterEdge }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int?.self),
    .field("role", GraphQLEnum<AniListAPI.CharacterRole>?.self),
    .field("node", Node?.self),
    .field("voiceActors", [VoiceActor?]?.self, arguments: ["language": "JAPANESE"]),
  ] }

  /// The id of the connection
  public var id: Int? { __data["id"] }
  /// The characters role in the media
  public var role: GraphQLEnum<AniListAPI.CharacterRole>? { __data["role"] }
  public var node: Node? { __data["node"] }
  /// The voice actors of the character
  public var voiceActors: [VoiceActor?]? { __data["voiceActors"] }

  /// Node
  ///
  /// Parent Type: `Character`
  public struct Node: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Character }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
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
    public struct Name: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.CharacterName }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("userPreferred", String?.self),
      ] }

      /// The currently authenticated users preferred name language. Default romaji for non-authenticated
      public var userPreferred: String? { __data["userPreferred"] }
    }

    /// Node.Image
    ///
    /// Parent Type: `CharacterImage`
    public struct Image: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.CharacterImage }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("medium", String?.self),
      ] }

      /// The character's image of media at medium size
      public var medium: String? { __data["medium"] }
    }
  }

  /// VoiceActor
  ///
  /// Parent Type: `Staff`
  public struct VoiceActor: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Staff }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
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
    public struct Name: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.StaffName }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("userPreferred", String?.self),
      ] }

      /// The currently authenticated users preferred name language. Default romaji for non-authenticated
      public var userPreferred: String? { __data["userPreferred"] }
    }

    /// VoiceActor.Image
    ///
    /// Parent Type: `StaffImage`
    public struct Image: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.StaffImage }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("medium", String?.self),
      ] }

      /// The person's image of media at medium size
      public var medium: String? { __data["medium"] }
    }
  }
}
