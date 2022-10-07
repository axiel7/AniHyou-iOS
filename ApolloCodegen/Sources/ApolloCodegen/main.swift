import Foundation
import ApolloCodegenLib
import ArgumentParser

// An outer structure to hold all commands and sub-commands handled by this script.
struct SwiftScript: ParsableCommand {

  static var configuration = CommandConfiguration(
    abstract: """
        A swift-based utility for performing Apollo-related tasks.
        
        NOTE: If running from a compiled binary, prefix subcommands with `swift-script`. Otherwise use `swift run ApolloCodegen [subcommand]`.
        """,
    subcommands: [DownloadSchema.self, GenerateCode.self, DownloadSchemaAndGenerateCode.self])

  /// The URL to the source root for your main project.
  /// Defaults to the folder containing the `ApolloCodgen` Package folder.
  ///
  /// NOTE: - You may need to change this if your project has a different structure
  /// than the suggested structure.
  static let SourceRootURL: URL = {
    let parentFolderOfScriptFile = FileFinder.findParentFolder()
    let sourceRootURL = parentFolderOfScriptFile
      .parentFolderURL() // Result: Sources folder
      .parentFolderURL() // Result: ApolloCodegen folder
      .parentFolderURL() // Result: Project source root folder

    CodegenLogger.log("Source Root URL: \(sourceRootURL)")
    return sourceRootURL
  }()

  // The URL where the downloaded schema will be written to.
  // The default writes the schema to your project's root.
  static let SchemaOutputURL: URL = {
    SourceRootURL.appendingPathComponent("schema.graphqls")
  }()

  /// The sub-command to download a schema from a provided endpoint.
  struct DownloadSchema: ParsableCommand {
    static var configuration = CommandConfiguration(
      commandName: "downloadSchema",
      abstract: "Downloads the schema with the settings you've set up in the `DownloadSchema` command in `main.swift`.")

    func run() throws {
      // Set up the URL you want to use to download the project
      // TODO: Replace the placeholder with the GraphQL endpoint you're using to download the schema.
      let endpoint = URL(string: "https://graphql.anilist.co/graphql")!

      // Make sure the folder is created before trying to download something to it.
      let folderForDownloadedSchema = SchemaOutputURL.deletingLastPathComponent()
      try ApolloFileManager.default.createDirectoryIfNeeded(atPath: folderForDownloadedSchema.path)

      // Create a configuration object for downloading the schema.
      // Provided code will download the schema via an introspection query to the provided URL as
      // SDL (GraphQL Schema Definition Language).
      // For all configuration parameters see:
      // https://www.apollographql.com/docs/ios/api/ApolloCodegenLib/structs/ApolloSchemaDownloadConfiguration/
      let schemaDownloadOptions = ApolloSchemaDownloadConfiguration(
        using: .introspection(endpointURL: endpoint),
        outputPath: SchemaOutputURL.path
      )

      // Actually attempt to download the schema.
      try ApolloSchemaDownloader.fetch(configuration: schemaDownloadOptions)
    }
  }

  /// The sub-command to actually generate code.
  struct GenerateCode: ParsableCommand {
    static var configuration = CommandConfiguration(
      commandName: "generate",
      abstract: "Generates swift code from your schema + your operations based on information set up in the `GenerateCode` command.")

    func run() throws {
      // TODO: Replace the placeholder here with the name of the folder containing your project's code files.
      /// The root of the target for which you want to generate code.
      let targetRootURL = SourceRootURL.childFolderURL(folderName: "AniHyou")

      // TODO: Replace the placeholder here with the name you would like to give your schema.
      /// The name of the module that will contain your generated schema objects.
      let generatedSchemaModuleName: String = "API"

      /// The URL where the generated schema files will be written to.
      let schemaModuleURL = SourceRootURL.childFolderURL(folderName: generatedSchemaModuleName)

      // Make sure the folders exists before trying to generate code.
      try ApolloFileManager.default.createDirectoryIfNeeded(atPath: targetRootURL.path)
      try ApolloFileManager.default.createDirectoryIfNeeded(atPath: schemaModuleURL.path)

      // Create the Codegen configuration object. For all configuration parameters see: https://www.apollographql.com/docs/ios/api/ApolloCodegenLib/structs/ApolloCodegenConfiguration/
      let codegenConfiguration = ApolloCodegenConfiguration(
        schemaName: generatedSchemaModuleName,
        input: ApolloCodegenConfiguration.FileInput(schemaPath: SchemaOutputURL.path),
        output: ApolloCodegenConfiguration.FileOutput(
          schemaTypes: ApolloCodegenConfiguration.SchemaTypesFileOutput(
            path: schemaModuleURL.path,
            //moduleType: .embeddedInTarget(name: generatedSchemaModuleName)
            moduleType: .swiftPackageManager)
        )
      )

      // Actually attempt to generate code.
      try ApolloCodegen.build(with: codegenConfiguration, withRootURL: targetRootURL)
    }
  }

  /// A sub-command which lets you download the schema then generate swift code.
  ///
  /// NOTE: This will both take significantly longer than code generation alone and fail when you're offline, so this is not recommended for use in a Run Phase Build script that runs with every build of your project.
  struct DownloadSchemaAndGenerateCode: ParsableCommand {
    static var configuration = CommandConfiguration(
      commandName: "all",
      abstract: "Downloads the schema and generates swift code. NOTE: Not recommended for use as part of a Run Phase Build Script.")

    func run() throws {
      try DownloadSchema().run()
      try GenerateCode().run()
    }
  }
}

// This will set up the command and parse the arguments when this executable is run.
SwiftScript.main()
