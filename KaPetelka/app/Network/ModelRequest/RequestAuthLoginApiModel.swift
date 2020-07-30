import Foundation

public struct RequestAuthLoginApiModel: Codable, Equatable {
    public let type: String
    public let system: String
    public let expansion: String
    public let uniqueName: String
    public let conversationId: String
    public let version: String

    enum CodingKeys: String, CodingKey {
        case type = "_type", system, expansion = "expansion", uniqueName = "unique_name", conversationId = "conv_id", version = "version"
    }
}

struct RequestAuthLoginModel: Codable {
    let phone: String
    let password: String
}

struct RequestSignUpModel: Codable {
    let phone: String
    let password: String
    let birthday: String
    let location: LocationModel?
    let interests: [Int]
}

struct LocationModel: Codable {
    let longitude: Double
    let latitude: Double
    let country: String
    let city: String
    let province: String
    
    init(dictionary: [String: Any]) {
        self.longitude = dictionary["longitude"] as? Double ?? 0.0
        self.latitude = dictionary["latitude"] as? Double ?? 0.0
        self.country = dictionary["country"] as? String ?? ""
        self.city = dictionary["city"] as? String ?? ""
        self.province = dictionary["province"] as? String ?? ""
    }
    
    init(longitude: Double, latitude: Double, country: String, city: String, province: String) {
        self.longitude = longitude
        self.latitude = latitude
        self.country = country
        self.city = city
        self.province = province

    }
}

struct RequestSignUpCodeModel: Codable {
    let phone: String
}

struct RequestSignUpCodeVerifyModel: Codable {
    let phone: String
    let code: Int
}
