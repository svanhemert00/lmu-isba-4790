/**
 * This defines the struct used to represent an individual article in the blog.
 */
import Foundation

struct Article: Hashable, Codable, Identifiable {
    var id: String
    var title: String
    var date: Date
    var body: String
    var url: String?
}
