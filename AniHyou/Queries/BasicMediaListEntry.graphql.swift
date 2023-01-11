// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import API

public struct BasicMediaListEntry: API.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment BasicMediaListEntry on MediaList {
      __typename
      id
      status
      score
      progress
      progressVolumes
      startedAt {
        __typename
        ...FuzzyDate
      }
      completedAt {
        __typename
        ...FuzzyDate
      }
    }
    """ }

  public let __data: DataDict
  public init(data: DataDict) { __data = data }

  public static var __parentType: ApolloAPI.ParentType { API.Objects.MediaList }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("id", Int.self),
    .field("status", GraphQLEnum<API.MediaListStatus>?.self),
    .field("score", Double?.self),
    .field("progress", Int?.self),
    .field("progressVolumes", Int?.self),
    .field("startedAt", StartedAt?.self),
    .field("completedAt", CompletedAt?.self),
  ] }

  /// The id of the list entry
  public var id: Int { __data["id"] }
  /// The watching/reading status
  public var status: GraphQLEnum<API.MediaListStatus>? { __data["status"] }
  /// The score of the entry
  public var score: Double? { __data["score"] }
  /// The amount of episodes/chapters consumed by the user
  public var progress: Int? { __data["progress"] }
  /// The amount of volumes read by the user
  public var progressVolumes: Int? { __data["progressVolumes"] }
  /// When the entry was started by the user
  public var startedAt: StartedAt? { __data["startedAt"] }
  /// When the entry was completed by the user
  public var completedAt: CompletedAt? { __data["completedAt"] }

  /// StartedAt
  ///
  /// Parent Type: `FuzzyDate`
  public struct StartedAt: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ApolloAPI.ParentType { API.Objects.FuzzyDate }
    public static var __selections: [ApolloAPI.Selection] { [
      .fragment(FuzzyDate.self),
    ] }

    /// Numeric Day (24)
    public var day: Int? { __data["day"] }
    /// Numeric Month (3)
    public var month: Int? { __data["month"] }
    /// Numeric Year (2017)
    public var year: Int? { __data["year"] }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public var fuzzyDate: FuzzyDate { _toFragment() }
    }
  }

  /// CompletedAt
  ///
  /// Parent Type: `FuzzyDate`
  public struct CompletedAt: API.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ApolloAPI.ParentType { API.Objects.FuzzyDate }
    public static var __selections: [ApolloAPI.Selection] { [
      .fragment(FuzzyDate.self),
    ] }

    /// Numeric Day (24)
    public var day: Int? { __data["day"] }
    /// Numeric Month (3)
    public var month: Int? { __data["month"] }
    /// Numeric Year (2017)
    public var year: Int? { __data["year"] }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public var fuzzyDate: FuzzyDate { _toFragment() }
    }
  }
}
