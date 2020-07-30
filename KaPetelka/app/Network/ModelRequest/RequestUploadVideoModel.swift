import Foundation

// MARK: - ResultVideoModel
struct RequestUploadVideoModel: Codable{
    let desc: String?
    let video: RequestUploadVideoVideoItemModel?
    let music: Music?
    let status: RequestUploadVideoStatusModel?
    let textExtra: [RequestUploadVideoTextExtraModel]?
}

// MARK: - VideoItem
struct RequestUploadVideoVideoItemModel: Codable {
    let height, width, duration: Int?
    let ratio: String?
    let dataSize: Int?

    enum CodingKeys: String, CodingKey {
        case height, width, duration, ratio
        case dataSize = "data_size"
    }
}


// MARK: - Status
struct RequestUploadVideoStatusModel: Codable {
    let allowShare, allowComment, isPrivate, withGoods: Bool?
    let showNotPass, isHashTag: Bool?
    let region: String?
    let longVideo: Bool?
    let descLanguage: String?

    enum CodingKeys: String, CodingKey {
        case allowShare = "allow_share"
        case allowComment = "allow_comment"
        case isPrivate = "is_private"
        case withGoods = "with goods"
        case showNotPass
        case isHashTag = "is_hash_tag"
        case region
        case longVideo = "long_video"
        case descLanguage = "desc_language"
    }
}

// MARK: - TextExtra
struct RequestUploadVideoTextExtraModel: Codable {
    let start, end, type: Int?
    let hashtagName, hashtagID: String?

    enum CodingKeys: String, CodingKey {
        case start, end, type
        case hashtagName = "hashtag_name"
        case hashtagID = "hashtag_id"
    }
}


struct RequestUploadVideoNewModel: Codable, Equatable {
    let description: String?
    let height: String?
    let width: String?
    let duration: String?
    let ratio: String?
    let isAllowToShare, isAllowToComment, isPrivate, isLongVideo: String?
    let musicID, musicTitle: String??
    let musicPlayUrl: String?
    let musicCoverThumb: String?
    let musicCoverMedium: String?
    let musicCoverLarge: String?
    let musicAuthor: String?
    
    enum CodingKeys: String, CodingKey {
        case description = "video[description]"
        case height = "video[height]"
        case width = "video[width]"
        case duration = "video[duration]"
        case ratio = "video[ratio]"
        case isAllowToShare = "video[isAllowToShare]"
        case isAllowToComment = "video[isAllowToComment]"
        case isPrivate = "video[isPrivate]"
        case isLongVideo = "video[isLongVideo]"
        case musicID = "music[id]"
        case musicTitle = "music[title]"
        case musicPlayUrl = "music[playUrl]"
        case musicCoverThumb = "music[coverThumb]"
        case musicCoverMedium = "music[coverMedium]"
        case musicCoverLarge = "music[coverLarge]"
        case musicAuthor = "music[author]"
    }
}

struct RequestViewsVideoModel: Codable {
    let videoID, percent: Int
}


