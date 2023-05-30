

import SwiftUI

@main
struct ImageAIApp: App {
    
    @StateObject var imageViewModel = ImageViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(imageViewModel)
        }
    }
}

