/**
 * ArticleUpdate  is a view for updating an article.
 */
import SwiftUI

struct ArticleUpdate: View {
    @EnvironmentObject var articleService: BareBonesBlogArticle
    @Binding var updating: Bool
    @State var articles: [Article]
    
    var currentArticle: Article {
        didSet {
            title = currentArticle.title
            articleBody = currentArticle.body
        }
    }
    
    @State var title = ""
    @State var articleBody = ""

    func updateArticle(articleToUpdate: Article) {
        updating = true
        articleService.db.collection(COLLECTION_NAME).document(articleToUpdate.id).setData(["title" : title, "body" : articleBody ], merge: true)
    }
 
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Title")) {
                    TextEditor(text: $title)
                }
                Section(header: Text("Body")) {
                    TextEditor(text: $articleBody)
                        .frame(minHeight: 256, maxHeight: .infinity)
                }
            }
            .navigationTitle("Edit Article")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        updating = false
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        updateArticle(articleToUpdate: currentArticle)
                        updating = false
                        }, label: { Text("Submit")
                        })
                    .disabled(title.isEmpty || articleBody.isEmpty)
                }
            }
        }
    }
}

struct ArticleUpdate_Previews: PreviewProvider {
    @State static var articles: [Article] = []
    @State static var writing = true
    
    static var previews: some View {
        ArticleEntry(articles: $articles, writing: $writing)
            .environmentObject(BareBonesBlogArticle())
    }
}
