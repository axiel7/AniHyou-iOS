// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct MediaStaff: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    "fragment MediaStaff on StaffEdge { __typename role node { __typename id name { __typename userPreferred } image { __typename medium } } }"
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.StaffEdge }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("role", String?.self),
    .field("node", Node?.self),
  ] }

  /// The role of the staff member in the production of the media
  public var role: String? { __data["role"] }
  public var node: Node? { __data["node"] }

  /// Node
  ///
  /// Parent Type: `Staff`
  public struct Node: AniListAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.Staff }
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

    /// Node.Name
    ///
    /// Parent Type: `StaffName`
    public struct Name: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.StaffName }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("userPreferred", String?.self),
      ] }

      /// The currently authenticated users preferred name language. Default romaji for non-authenticated
      public var userPreferred: String? { __data["userPreferred"] }
    }

    /// Node.Image
    ///
    /// Parent Type: `StaffImage`
    public struct Image: AniListAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { AniListAPI.Objects.StaffImage }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("medium", String?.self),
      ] }

      /// The person's image of media at medium size
      public var medium: String? { __data["medium"] }
    }
  }
}
