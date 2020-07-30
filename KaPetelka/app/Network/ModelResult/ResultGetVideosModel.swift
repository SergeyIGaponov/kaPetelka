//
//  ResultGetVideosModel.swift
//  AltTikTok
//
//  Created by Viktor on 13.05.2020.
//

import Foundation

struct ResultVideoResponseModel: Codable
{
    let list: [VideoUnitModel]
    let count: Int
}


// MARK: - List
struct VideoUnitModel: Codable {
    let id: String
    let url: String
    let listDescription, createdAt: String
    let height, width, duration: Int
    let ratio: String
    let isAllowToShare, isAllowToComment, isUsePassword, isLongVideo: Bool
    let likesCount, viewsCount: String
    let music: Music?

    enum CodingKeys: String, CodingKey {
        case id, url
        case listDescription = "description"
        case createdAt, height, width, duration, ratio, isAllowToShare, isAllowToComment, isUsePassword, isLongVideo, likesCount, viewsCount, music
    }
}
