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
            if let finalURL = article.url {
                if let urlObject = URL(string: finalURL) {
                    Link(destination: urlObject, label: {
                        Text("View")
                            .foregroundColor(.secondary)
                    })
                }
            }

            Spacer()
            HStack{
            if auth.user != nil {
                Button(action: {
                    updating = true
                    }, label: {
                        Image(systemName: "pencil.circle.fill")
                    })
                    .foregroundColor(.primary)
                Button(action: {
                    ref.deleteArticle(articleToDelete: article)
                    updating = false
                    }, label: {
                        Image(systemName: "trash.circle.fill")
                    })
                    .foregroundColor(.primary)
                }
            }

        }
        .sheet(isPresented: $updating) {
            ArticleUpdate(updating: $updating, articles: $articles, currentArticle: article, title: article.title, articleBody: article.body, inputURL: article.url ?? "https://")
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
            url: "facebook.com"
        ))
    }
}
