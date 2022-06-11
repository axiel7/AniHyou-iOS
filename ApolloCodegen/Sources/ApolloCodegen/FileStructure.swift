import Foundation
import ApolloCodegenLib

// An object representing the filesystem structure. Allows you to grab references to folders in the filesystem without having to pass them through as environment variables.
struct FileStructure {
    
    let sourceRootURL: URL
    let cliFolderURL: URL
    
    init() throws {
        // Grab the parent folder of this file on the filesystem
        let parentFolderOfScriptFile = FileFinder.findParentFolder()
        CodegenLogger.log("Parent folder of script file: \(parentFolderOfScriptFile)")

        // Use that to calculate the source root for both your main project and this codegen project.
        // NOTE: You may need to change this if your project has a different structure than the suggested structure.
        self.sourceRootURL = parentFolderOfScriptFile
          .apollo.parentFolderURL() // Result: Sources folder
          .apollo.parentFolderURL() // Result: ApolloCodegen folder
          .apollo.parentFolderURL() // Result: Project source root folder

        // Set up the folder where you want the typescript CLI to download.
        self.cliFolderURL = sourceRootURL
          .apollo.childFolderURL(folderName: "ApolloCodegen")
          .apollo.childFolderURL(folderName: "ApolloCLI")
    }
}

extension FileStructure: CustomDebugStringConvertible {
    var debugDescription: String {
        """
        Source root URL: \(self.sourceRootURL)
        CLI folder URL: \(self.cliFolderURL)
        """
    }
}
