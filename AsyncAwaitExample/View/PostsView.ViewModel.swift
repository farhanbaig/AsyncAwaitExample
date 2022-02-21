import Combine
import Foundation

extension PostsView {
    class ViewModel: ObservableObject {
        private var comments = [Comment]()
        @Published private (set) var posts: Result<[Post],Error>?
        init(postFetcher: PostFetching,commentsFetcher: CommentsFetching) {
            DispatchQueue.main.async {
                Task {
                    self.posts = try await postFetcher.loadPost()
                    self.comments = try await commentsFetcher.fetchComments()
                }
            }
        }
        
        func getCommentsfor(_ post: Post) -> [Comment] {
            return self.comments.filter({$0.postId == post.id})
        }
    }
}
