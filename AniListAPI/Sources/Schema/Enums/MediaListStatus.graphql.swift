// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) import ApolloAPI

/// Media list watching/reading status enum.
public enum MediaListStatus: String, EnumType {
  /// Currently watching/reading
  case current = "CURRENT"
  /// Planning to watch/read
  case planning = "PLANNING"
  /// Finished watching/reading
  case completed = "COMPLETED"
  /// Stopped watching/reading before completing
  case dropped = "DROPPED"
  /// Paused watching/reading
  case paused = "PAUSED"
  /// Re-watching/reading
  case repeating = "REPEATING"
}
