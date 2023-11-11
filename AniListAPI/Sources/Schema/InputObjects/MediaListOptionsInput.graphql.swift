// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// A user's list options for anime or manga lists
public struct MediaListOptionsInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    sectionOrder: GraphQLNullable<[String?]> = nil,
    splitCompletedSectionByFormat: GraphQLNullable<Bool> = nil,
    customLists: GraphQLNullable<[String?]> = nil,
    advancedScoring: GraphQLNullable<[String?]> = nil,
    advancedScoringEnabled: GraphQLNullable<Bool> = nil,
    theme: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "sectionOrder": sectionOrder,
      "splitCompletedSectionByFormat": splitCompletedSectionByFormat,
      "customLists": customLists,
      "advancedScoring": advancedScoring,
      "advancedScoringEnabled": advancedScoringEnabled,
      "theme": theme
    ])
  }

  /// The order each list should be displayed in
  public var sectionOrder: GraphQLNullable<[String?]> {
    get { __data["sectionOrder"] }
    set { __data["sectionOrder"] = newValue }
  }

  /// If the completed sections of the list should be separated by format
  public var splitCompletedSectionByFormat: GraphQLNullable<Bool> {
    get { __data["splitCompletedSectionByFormat"] }
    set { __data["splitCompletedSectionByFormat"] = newValue }
  }

  /// The names of the user's custom lists
  public var customLists: GraphQLNullable<[String?]> {
    get { __data["customLists"] }
    set { __data["customLists"] = newValue }
  }

  /// The names of the user's advanced scoring sections
  public var advancedScoring: GraphQLNullable<[String?]> {
    get { __data["advancedScoring"] }
    set { __data["advancedScoring"] = newValue }
  }

  /// If advanced scoring is enabled
  public var advancedScoringEnabled: GraphQLNullable<Bool> {
    get { __data["advancedScoringEnabled"] }
    set { __data["advancedScoringEnabled"] = newValue }
  }

  /// list theme
  public var theme: GraphQLNullable<String> {
    get { __data["theme"] }
    set { __data["theme"] = newValue }
  }
}
