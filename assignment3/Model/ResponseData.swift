import Foundation

// MARK: - Welcome
struct Welcome: Decodable {
    let statusCode: Int
    let body: Body

    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case body
    }
}

// MARK: - Body
struct Body: Decodable {
    let response: [Response]
    let canCreate, totalItemCount: Int
    let filter: [Filter]
}

// MARK: - Filter
struct Filter: Decodable {
    let type, name, label: String
    let multiOptions: MultiOptions
}

// MARK: - MultiOptions
struct MultiOptions: Decodable {
    let the1, the2, the3, the4: String?
    let the5, the6, the7, the8: String?
    let the9, the10, the11, the12: String?
    let the13, the14, the15, the16: String?
    let the17, the18, the19, the20: String?
    let the21, the22, the23, the24: String?
    let the25, the26, the27, the28: String?
    let the30, the31, the32, the33: String?
    let the35, the36, the37, the38: String?
    let the39, the40: String?
    let none, recent: String?
    let popular: String?

    enum CodingKeys: String, CodingKey {
        case the1 = "1"
        case the2 = "2"
        case the3 = "3"
        case the4 = "4"
        case the5 = "5"
        case the6 = "6"
        case the7 = "7"
        case the8 = "8"
        case the9 = "9"
        case the10 = "10"
        case the11 = "11"
        case the12 = "12"
        case the13 = "13"
        case the14 = "14"
        case the15 = "15"
        case the16 = "16"
        case the17 = "17"
        case the18 = "18"
        case the19 = "19"
        case the20 = "20"
        case the21 = "21"
        case the22 = "22"
        case the23 = "23"
        case the24 = "24"
        case the25 = "25"
        case the26 = "26"
        case the27 = "27"
        case the28 = "28"
        case the30 = "30"
        case the31 = "31"
        case the32 = "32"
        case the33 = "33"
        case the35 = "35"
        case the36 = "36"
        case the37 = "37"
        case the38 = "38"
        case the39 = "39"
        case the40 = "40"
        case none, recent, popular
    }
}

// MARK: - Response
struct Response: Decodable {
    let albumID, photoID: Int
    let title, responseDescription: String
    let ownerID, viewCount, commentCount, rating: Int
    let seaoLocationid: Int
    let location: JSONNull?
    let likeCount: Int
    let creationDate: String
    let categoryID, photosCount: Int
    let locationitemID, resourceType, resourceID, latitude: JSONNull?
    let longitude, formattedAddress, country, state: JSONNull?
    let zipcode, city, address, zoom: JSONNull?
    let search: Int
    let image, imageNormal, imageProfile, imageIcon: String
    let contentURL: String
    let defaultCover: Int
    let isLike: Bool
    let allowToView: Int
    let ownerTitle: String
    let photoCount: Int

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case photoID = "photo_id"
        case title
        case responseDescription = "description"
        case ownerID = "owner_id"
        case viewCount = "view_count"
        case commentCount = "comment_count"
        case rating
        case seaoLocationid = "seao_locationid"
        case location
        case likeCount = "like_count"
        case creationDate = "creation_date"
        case categoryID = "category_id"
        case photosCount = "photos_count"
        case locationitemID = "locationitem_id"
        case resourceType = "resource_type"
        case resourceID = "resource_id"
        case latitude, longitude
        case formattedAddress = "formatted_address"
        case country, state, zipcode, city, address, zoom, search, image
        case imageNormal = "image_normal"
        case imageProfile = "image_profile"
        case imageIcon = "image_icon"
        case contentURL = "content_url"
        case defaultCover = "default_cover"
        case isLike = "is_like"
        case allowToView = "allow_to_view"
        case ownerTitle = "owner_title"
        case photoCount = "photo_count"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Decodable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
