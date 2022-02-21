import Foundation

protocol PostFetching {
    func loadPost() async throws -> Result<[Post],Error>
}


class PostFetcher: PostFetching {
    func loadPost() async -> Result<[Post],Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        do {
            let (data,_) = try await URLSession.shared.data(from: url!)
            let posts =  try JSONDecoder().decode([Post].self, from: data)
            return (.success(posts))
        }
        catch let error {
            return (.failure(error))
        }
    }
}
