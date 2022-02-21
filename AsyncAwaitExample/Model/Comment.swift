
struct Comment: Codable, Identifiable {
    var id: Int
    var postId: Int
    var name: String
    var email: String
    var body: String
    var comments: [Comment]?
}
