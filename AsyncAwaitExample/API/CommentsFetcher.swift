import Foundation

protocol CommentsFetching {
    func fetchComments() async throws -> [Comment]
}

class CommentsFetcher: CommentsFetching {
    func fetchComments() async throws -> [Comment] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/comments")!
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            let comments = try JSONDecoder().decode([Comment].self, from: data)
            return comments
        }
        catch {
            return []
        }
    }
}
