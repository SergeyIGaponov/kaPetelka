import Foundation

struct ResultVideoListModel: Codable {
    let list: [ItemVideoList]
    let count: Int?
}

struct ItemVideoList: Codable {
    let id: String
    let url: String
    let thumbnail: String?
    let description: String?
    let createdAt: String?
    let height: Int?
    let width: Int?
    let duration: Int?
    let ratio: String?
    let isAllowToShare: Bool?
    let isAllowToComment: Bool?
    let isUsePassword: Bool?
    let isLongVideo: Bool?
    var likesCount: String?
    let viewsCount: String?
    let music: MusicVideo?
    let hashtags: [VideosHashtags]?
    var isLiked: Bool?
    
    let user: UserOwnerVideo?
}

struct MusicVideo: Codable {
    let id: String?
    let musicID: String
    let title: String?
    let playUrl: String?
    let coverThumb: String?
    let coverMedium: String?
    let coverLarge: String?
    let author: String?

}

struct VideosHashtags: Codable {
    let id: String
    let name: String 
}


struct UserOwnerVideo: Codable {
    let id: String?
    let nickname: String?
    let uniqueID: String?
    let avatar: String?
    let avatarThumb: String?
}
