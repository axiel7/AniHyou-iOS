// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct VoiceActorStat: AniListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment VoiceActorStat on UserVoiceActorStatistic { __typename voiceActor { __typename id name { __typename userPreferred } image { __typename medium } } count meanScore minutesWatched chaptersRead }"#
  }

  @_spi(Unsafe) public let __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.UserVoiceActorStatistic }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("voiceActor", VoiceActor?.self),
    .field("count", Int.self),
    .field("meanScore", Double.self),
    .field("minutesWatched", Int.self),
    .field("chaptersRead", Int.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    VoiceActorStat.self
  ] }

  public var voiceActor: VoiceActor? { __data["voiceActor"] }
  public var count: Int { __data["count"] }
  public var meanScore: Double { __data["meanScore"] }
  public var minutesWatched: Int { __data["minutesWatched"] }
  public var chaptersRead: Int { __data["chaptersRead"] }

  /// VoiceActor
  ///
  /// Parent Type: `Staff`
  public struct VoiceActor: AniListAPI.SelectionSet, Identifiable {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.Staff }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", Int.self),
      .field("name", Name?.self),
      .field("image", Image?.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      VoiceActorStat.VoiceActor.self
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
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.StaffName }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("userPreferred", String?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        VoiceActorStat.VoiceActor.Name.self
      ] }

      /// The currently authenticated users preferred name language. Default romaji for non-authenticated
      public var userPreferred: String? { __data["userPreferred"] }
    }

    /// VoiceActor.Image
    ///
    /// Parent Type: `StaffImage`
    public struct Image: AniListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AniListAPI.Objects.StaffImage }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("medium", String?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        VoiceActorStat.VoiceActor.Image.self
      ] }

      /// The person's image of media at medium size
      public var medium: String? { __data["medium"] }
    }
  }
}
