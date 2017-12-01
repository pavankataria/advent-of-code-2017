import Foundation

public protocol PathLoadable {
    var resourceName: String { get set }
    var type: String? { get set }
}

extension PathLoadable {
    private func filePath() -> String {
        guard !resourceName.isEmpty else {
            fatalError("No resource name specified")
        }
        guard let filePath = Bundle.main.path(forResource: resourceName, ofType: type, inDirectory: nil) else {
            fatalError("Input file missing for resource name: \(resourceName)")
        }
        return filePath
    }
    public func getInput() -> Data {
        let file = filePath()
        guard let data = FileManager.default.contents(atPath: file) else {
            fatalError("The contents couldn't be retrieved for file: \(file)")
        }
        return data
    }
}
