
import SwiftUI

struct PostsView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        NavigationView {
            switch viewModel.posts {
            case .success(let posts):
                List {
                    ForEach(posts) { post in
                        VStack(alignment: .leading,spacing:8) {
                            Text(post.title)
                                .fontWeight(.bold)
                            Text(post.body)
                                .font(.footnote)
                            if viewModel.getCommentsfor(post).count > 0 {
                             Text("View all \(viewModel.getCommentsfor(post).count) comments")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .padding(.top,5)
                            }
                        }
                        .padding([.top,.bottom],5)
                        .multilineTextAlignment(.leading)
                    }
                } //: LIST
                .listStyle(.plain)
                .navigationTitle("Posts")
            case .failure (let error):
                Text(error.localizedDescription)
            case .none:
                ProgressView()
            }
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView(viewModel: .init(postFetcher: PostFetcher(), commentsFetcher: CommentsFetcher()))
    }
}
