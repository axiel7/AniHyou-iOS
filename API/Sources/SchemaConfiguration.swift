// @generated
// This file was automatically generated and can be edited to
// provide custom configuration for a generated GraphQL schema.
//
// Any changes to this file will not be overwritten by future
// code generation execution.

import ApolloAPI

public enum SchemaConfiguration: ApolloAPI.SchemaConfiguration {
  public static func cacheKeyInfo(for type: Object, object: JSONObject) -> CacheKeyInfo? {
    // Since the AniList API sometimes returns the same id for some queries (https://github.com/AniList/ApiV2-GraphQL-Docs/issues/165)
    // I won't use the cache key for now.
    //return CacheKeyInfo(id: "id")
      return nil
  }
}
