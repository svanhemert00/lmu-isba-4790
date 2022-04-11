import SwiftUI

@main
struct BareBonesBlogApp: App {
    // This connects our newfangled SwiftUI app with the UIApplicationDelegate
    // object mentioned in the Firebase documentation.
    @UIApplicationDelegateAdaptor(BareBonesBlogAppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(BareBonesBlogAuth())
                .environmentObject(BareBonesBlogArticle())
        }
    }
}
