import SwiftUI
import Combine

struct FilterKeyword: Identifiable, Codable {
    var id: String { value }
    let value: String
}

