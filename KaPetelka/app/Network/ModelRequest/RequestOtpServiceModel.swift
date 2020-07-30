import Foundation

public struct RequestForgotModel: Codable, Equatable {
    public let phone: String
}

public struct RequestVerifyModel: Codable, Equatable {
    public let phone: String
    public let code: Int
}

public struct RequestVerifyNewPhoneModel: Codable, Equatable {
    public let code: Int
}
