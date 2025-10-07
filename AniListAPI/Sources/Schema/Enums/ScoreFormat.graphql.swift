// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) import ApolloAPI

/// Media list scoring type
public enum ScoreFormat: String, EnumType {
  /// An integer from 0-100
  case point100 = "POINT_100"
  /// A float from 0-10 with 1 decimal place
  case point10Decimal = "POINT_10_DECIMAL"
  /// An integer from 0-10
  case point10 = "POINT_10"
  /// An integer from 0-5. Should be represented in Stars
  case point5 = "POINT_5"
  /// An integer from 0-3. Should be represented in Smileys. 0 => No Score, 1 => :(, 2 => :|, 3 => :)
  case point3 = "POINT_3"
}
