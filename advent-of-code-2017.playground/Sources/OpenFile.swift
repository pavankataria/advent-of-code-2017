import Foundation

public var content: ((String) -> String) = {
    let fileUrl = Bundle.main.url(forResource: $0, withExtension: "txt")
    return try! String(contentsOf: fileUrl!, encoding: String.Encoding.utf8)
}

