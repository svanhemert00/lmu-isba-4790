/**
 * ArticleEntry is a view for creating a new article.
 */
import SwiftUI

struct ArticleEntry: View {
    @EnvironmentObject var articleService: BareBonesBlogArticle

    @Binding var articles: [Article]
    @Binding var writing: Bool
    
    @State var title = ""
    @State var articleBody = ""
    @State var inputURL = "https://"

    func submitArticle() {
        let articleId = articleService.createArticle(article: Article(
            id: UUID().uuidString,
            title: title,
            date: Date(),
            body: articleBody,
            // missing argument for parameter 'URL' in call
            URL: inputURL
        ))
        articles.append(Article(
            id: articleId,
            title: title,
            date: Date(),
            body: articleBody,
            // missing argument for parameter 'URL' in call
            URL: inputURL
        ))
        writing = false
    }

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Title")) {
                    TextField("", text: $title)
                }
                
                Section(header: Text("Body")) {
                    TextEditor(text: $articleBody)
                        .frame(minHeight: 100, maxHeight: .infinity)
                }
                Section(header: Text("URL (optional)")) {
                    TextEditor(text: $inputURL)
                }
            }
            .navigationTitle("New Article")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        writing = false
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Submit") {
                        submitArticle()
                    }
                    .disabled(title.isEmpty || articleBody.isEmpty)
                }
            }
        }
    }
}

struct ArticleEntry_Previews: PreviewProvider {
    @State static var articles: [Article] = []
    @State static var writing = true
    
    static var previews: some View {
        ArticleEntry(articles: $articles, writing: $writing)
            .environmentObject(BareBonesBlogArticle())
    }
}
