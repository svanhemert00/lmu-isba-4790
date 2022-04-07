/**
 * ArticleDetail displays a single article model object.
 */
import SwiftUI

struct ArticleDetail: View {

    @EnvironmentObject var ref: BareBonesBlogArticle
    @EnvironmentObject var auth: BareBonesBlogAuth
    
    @State var articles: [Article]
    @State var updating = false
    
    var article: Article

    var body: some View {
        VStack {
            ArticleMetadata(article: article)
                .padding()
            Text(article.body).padding()
            // https://developer.apple.com/documentation/uikit/uiapplication/1622952-canopenurl
            if let finalURL = article.URL {
                if let urlObject = URL(string: finalURL) {
                    Link(destination: urlObject, label: {
                        Text("view")
                            .foregroundColor(.purple)
                    })
                }
            }

            Spacer()
            HStack{
            if auth.user != nil {
                Button(action: {
                updating = true
                    }, label: {
                        Image(systemName: "pencil")
                })
                .buttonStyle(BorderedButtonStyle())
                Button(action: {
                    ref.deleteArticle(articleToDelete: article)
                    updating = false
                    }, label: {
                        Image(systemName: "trash")
                    })
                }
            }

        }
        .sheet(isPresented: $updating) {
            ArticleUpdate(updating: $updating, articles: articles, currentArticle: article, title: article.title, articleBody: article.body)
        }
    }
}

struct ArticleDetail_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetail(articles: [], article: Article(
            id: "12345",
            title: "Preview",
            date: Date(),
            body: "Lorem ipsum dolor sit something something amet",
            URL: "facebook.com"
        ))
    }
}
