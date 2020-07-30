
import Foundation

struct RequestRecoveryPass: Codable {
    let token: String
    let password: String
}

struct RequestRecoveryPhone: Codable {
    let token: String
    let phone: String
}

struct RequestPhone: Codable {
    let phone: String
}


