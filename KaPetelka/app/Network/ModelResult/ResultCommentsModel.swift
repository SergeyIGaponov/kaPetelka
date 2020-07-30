
import Foundation

typealias ResultCommentsModel = [ResultCommentsModelElement]

// MARK: - SPFullPosterElement
struct ResultCommentsModelElement: Codable {
    let id, idComment, avatar: String?
    let like: Int?
    let idUser, text: String?
    let isAuthor, isAuthorLiked: Bool?
    let createTime: Int?
    let textExtra: [TextExtra]?
    let mansion: [Mansion]?
    let responceArray: [ResultCommentsModelElement]?

    enum CodingKeys: String, CodingKey {
        case id
        case idComment = "id_comment"
        case avatar, like
        case idUser = "id_user"
        case text
        case isAuthor = "is_author"
        case isAuthorLiked = "is_author_liked"
        case createTime
        case textExtra = "text_extra"
        case mansion
        case responceArray = "responce_array"
    }
}

// MARK: - Mansion
struct Mansion: Codable {
    let start, end: Int?
    let nikmane, hashtagID: String?

    enum CodingKeys: String, CodingKey {
        case start, end, nikmane
        case hashtagID = "hashtag_id"
    }
}

// MARK: - TextExtra
struct TextExtra: Codable {
    let start, end, type: Int?
    let hashtagName, hashtagID: String?

    enum CodingKeys: String, CodingKey {
        case start, end, type
        case hashtagName = "hashtag_name"
        case hashtagID = "hashtag_id"
    }
}
