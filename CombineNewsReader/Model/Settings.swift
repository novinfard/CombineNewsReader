import Foundation
import Combine

final class Settings: ObservableObject {
    init() {
        self.keywords = (try? JSONFile.loadValue(named: JSONFile.keywordFile)) ?? [FilterKeyword]()
    }
    
    @Published var keywords = [FilterKeyword]() {
        didSet {
            try? JSONFile.save(value: keywords, named: JSONFile.keywordFile)
        }
    }
}

extension JSONFile {
    static let keywordFile = "keywords"
}
