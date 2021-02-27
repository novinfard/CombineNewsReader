import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let viewModel = ReaderViewModel()
        
        let rootView = ReaderView(model: viewModel)
        
        if let windowScene = scene as? UIWindowScene {
            viewModel.fetchStories()
            
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: rootView)
            self.window = window
            window.makeKeyAndVisible()
            
        }
    }
}
