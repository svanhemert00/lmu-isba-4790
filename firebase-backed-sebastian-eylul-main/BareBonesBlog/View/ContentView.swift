import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var articleService: BareBonesBlogArticle
    @State private var selection: Tab = .homePage
    
    enum Tab {
        case homePage
        case blog
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomePage()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.homePage)
            Blog()
                .tabItem {
                        Label("Blog", systemImage: "list.dash")
                }
                .tag(Tab.blog)
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(BareBonesBlogAuth())
    }
}
