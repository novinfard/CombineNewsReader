import UIKit
import SwiftUI
import Combine

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    let userSettings = Settings()
    private var subscriptions = Set<AnyCancellable>()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let viewModel = ReaderViewModel()
        
        let rootView = ReaderView(model: viewModel)
        
        if let windowScene = scene as? UIWindowScene {
            viewModel.fetchStories()

            userSettings.$keywords
                .map { $0.map { $0.value } }
                .assign(to: \.filter, on: viewModel)
                .store(in: &subscriptions)
            
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: rootView)
            self.window = window
            window.makeKeyAndVisible()
            
        }
    }
}
