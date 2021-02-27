import Foundation
import Combine

class ReaderViewModel {
    private let api = API()
    private var allStories = [Story]()
    private var subscriptions = Set<AnyCancellable>()
    
    var filter = [String]()
    
    func fetchStories() {
        api
            .stories()
            .receive(on: DispatchQueue.main)
            .sink { (completion) in
                if case .failure(let error) = completion {
                    self.error = error
                }
            } receiveValue: { (stories) in
                self.allStories = stories
                self.error = nil
            }.store(in: &subscriptions)
    }
    
    var stories: [Story] {
        guard !filter.isEmpty else {
            return allStories
        }
        return allStories
            .filter { story -> Bool in
                return filter.reduce(false) { isMatch, keyword -> Bool in
                    return isMatch || story.title.lowercased().contains(keyword)
                }
            }
    }
    
    var error: API.Error? = nil
}

