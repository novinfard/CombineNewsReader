import Foundation
import Combine

final class Settings: ObservableObject {
    init() { }
    
    @Published var keywords = [FilterKeyword]()
}
