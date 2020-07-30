
import Foundation

// MARK: - ResultVideoModel
struct ResultVideoModel: Codable {
    let id, desc: String?
    let createTime: Int?
    let video: VideoItem?
    let author: Author?
    let music: Music?
    let statistics: Statistics?
    let status: Status?
    let textExtra: [TextExtra]?
    let shareInfo: ShareInfo?

    enum CodingKeys: String, CodingKey {
        case id, desc, createTime, video, author, music, statistics, status
        case textExtra = "text_extra"
        case shareInfo = "share_info"
    }
}

// MARK: - Author
struct Author: Codable {
    let id, userName: String?
    let avatarThumb, avatarMedium, avatarLarger: String?
    let signature, nickname: String?

    enum CodingKeys: String, CodingKey {
        case id
        case userName = "user_name"
        case avatarThumb, avatarMedium, avatarLarger, signature, nickname
    }
}

//MARK: - Music
struct Music: Codable {
    let id, title: String?
    let playURL: String?
    let coverThumb, coverMedium, coverLarge: String?
    let authorName: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case playURL = "playUrl"
        case coverThumb, coverMedium, coverLarge, authorName
    }
}

// MARK: - Statistics
struct Statistics: Codable {
    let commentCount, diggCount, likesCount, playCount: Int?
    let shareCount, forwardCount: Int?

    enum CodingKeys: String, CodingKey {
        case commentCount = "comment_count"
        case diggCount = "digg_count"
        case likesCount
        case playCount = "play_count"
        case shareCount = "share_count"
        case forwardCount = "forward_count"
    }
}

// MARK: - Status
struct Status: Codable {
    let allowShare, allowComment, isPrivate, withGoods: Bool?
    let digged, liked, showNotPass, isHashTag: Bool?
    let region: String?
    let longVideo: Bool?
    let descLanguage: String?

    enum CodingKeys: String, CodingKey {
        case allowShare = "allow_share"
        case allowComment = "allow_comment"
        case isPrivate = "is_private"
        case withGoods = "with goods"
        case digged, liked, showNotPass
        case isHashTag = "is_hash_tag"
        case region
        case longVideo = "long_video"
        case descLanguage = "desc_language"
    }
}

// MARK: - VideoItem
struct VideoItem: Codable {
    let height, width, duration: Int?
    let ratio: String?
    let dataSize: Int?
    let cover, originCover, playAddr: String?

    enum CodingKeys: String, CodingKey {
        case height, width, duration, ratio
        case dataSize = "data_size"
        case cover, originCover, playAddr
    }
}

//MARK: - ShareInfo
//struct ShareInfo: Codable {
//    let shareURL, shareTitle: String?
//
//    enum CodingKeys: String, CodingKey {
//        case shareURL = "share_url"
//        case shareTitle = "share_title"
//    }
//}

// MARK: - TextExtra
//struct TextExtra: Codable {
//    let start, end, type: Int?
//    let hashtagName, hashtagID: String?
//
//    enum CodingKeys: String, CodingKey {
//        case start, end, type
//        case hashtagName = "hashtag_name"
//        case hashtagID = "hashtag_id"
//    }
//}


