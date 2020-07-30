import Foundation

public struct ResultAuthLoginAPIModel: Codable, Equatable {
    public let code: Int
    public let data: String
    public let message: String
    public let requestId: String

    enum CodingKeys: String, CodingKey {
        case code, data, message, requestId = "request-id"
    }
}

public struct ResultAuthLoginModel: Codable {
    public let id: String
    public let accessToken: String
    public let refreshToken: String
}

public struct ResultAuthSignupModel: Codable {
    public let phone: String
    public let password: String
}

//MARK: Interests category

public struct ResultInterestsModel: Codable {
    public let id: Int
    public let name: String
}



