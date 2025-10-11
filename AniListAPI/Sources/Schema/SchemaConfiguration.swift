// @generated
// This file was automatically generated and can be edited to
// provide custom configuration for a generated GraphQL schema.
//
// Any changes to this file will not be overwritten by future
// code generation execution.

import ApolloAPI

public enum SchemaConfiguration: ApolloAPI.SchemaConfiguration {
  public static func cacheKeyInfo(for type: Object, object: ObjectData) -> CacheKeyInfo? {
      switch type {
      case Objects.MediaList:
          guard let id = object["id"] else {
              return nil
          }
          guard let mediaId = object["mediaId"] else {
              return try? CacheKeyInfo(jsonValue: id, uniqueKeyGroup: "MediaList")
          }
          return CacheKeyInfo(id: "\(id).\(mediaId)", uniqueKeyGroup: "MediaList")
      default:
          guard let id = object["id"] else {
              return nil
          }
          return try? CacheKeyInfo(jsonValue: id)
      }
  }
}
