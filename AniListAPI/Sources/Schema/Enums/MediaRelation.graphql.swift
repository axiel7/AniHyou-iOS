// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) import ApolloAPI

/// Type of relation media has to its parent.
public enum MediaRelation: String, EnumType {
  /// An adaption of this media into a different format
  case adaptation = "ADAPTATION"
  /// Released before the relation
  case prequel = "PREQUEL"
  /// Released after the relation
  case sequel = "SEQUEL"
  /// The media a side story is from
  case parent = "PARENT"
  /// A side story of the parent media
  case sideStory = "SIDE_STORY"
  /// Shares at least 1 character
  case character = "CHARACTER"
  /// A shortened and summarized version
  case summary = "SUMMARY"
  /// An alternative version of the same media
  case alternative = "ALTERNATIVE"
  /// An alternative version of the media with a different primary focus
  case spinOff = "SPIN_OFF"
  /// Other
  case other = "OTHER"
  /// Version 2 only. The source material the media was adapted from
  case source = "SOURCE"
  /// Version 2 only.
  case compilation = "COMPILATION"
  /// Version 2 only.
  case contains = "CONTAINS"
}
