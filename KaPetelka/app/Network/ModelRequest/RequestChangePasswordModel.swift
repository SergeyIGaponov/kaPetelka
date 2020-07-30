import Foundation

public struct RequestChangePasswordModel: Codable, Equatable {
    public let token: String
    public let oldPassword: String
    public let newPassword: String
}


