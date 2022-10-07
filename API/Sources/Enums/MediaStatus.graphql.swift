// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// The current releasing status of the media
public enum MediaStatus: String, EnumType {
  /// Has completed and is no longer being released
  case finished = "FINISHED"
  /// Currently releasing
  case releasing = "RELEASING"
  /// To be released at a later date
  case notYetReleased = "NOT_YET_RELEASED"
  /// Ended before the work could be finished
  case cancelled = "CANCELLED"
  /// Version 2 only. Is currently paused from releasing and will resume at a later date
  case hiatus = "HIATUS"
}
