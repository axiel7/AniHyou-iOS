// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) import ApolloAPI

/// The language the user wants to see staff and character names in
public enum UserStaffNameLanguage: String, EnumType {
  /// The romanization of the staff or character's native name, with western name ordering
  case romajiWestern = "ROMAJI_WESTERN"
  /// The romanization of the staff or character's native name
  case romaji = "ROMAJI"
  /// The staff or character's name in their native language
  case native = "NATIVE"
}
