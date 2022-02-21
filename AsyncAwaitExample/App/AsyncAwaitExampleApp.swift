import SwiftUI

@main
struct AsyncAwaitExampleApp: App {
    var body: some Scene {
        WindowGroup {
            PostsView(viewModel: .init(postFetcher: PostFetcher(), commentsFetcher: CommentsFetcher()))
        }
    }
}
