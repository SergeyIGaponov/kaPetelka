import Foundation

struct ResultDeezerSearchAPIModel: Codable {
     let data: [TracksDatum]
     let total: Int
}

struct ResultDeezerChartAPIModel: Codable {
    let tracks: Tracks
    let albums: Albums
    let artists: Artists
    let playlists: Playlists
    let podcasts: Albums
}

// MARK: - Albums
struct Albums: Codable {
    let data: [AlbumsDatum]
    let total: Int
}

// MARK: - AlbumsDatum
struct AlbumsDatum: Codable {
    let id: Int
    let title: String
    let link, cover: String
    let coverSmall, coverMedium, coverBig, coverXl: String
    let recordType: String?
    let tracklist: String
    let explicitLyrics: Bool
    let position: Int
    let artist: ArtistElement
    let type: RecordTypeEnum

    enum CodingKeys: String, CodingKey {
        case id, title, link, cover
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
        case recordType = "record_type"
        case tracklist
        case explicitLyrics = "explicit_lyrics"
        case position, artist, type
    }
}

// MARK: - ArtistElement
struct ArtistElement: Codable {
    let id: Int
    let name: String
    let link, picture: String
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String
    let radio: Bool?
    let tracklist: String
    let type: ArtistType
    let position: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, link, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case radio, tracklist, type, position
    }
}

enum ArtistType: String, Codable {
    case artist = "artist"
}

enum RecordTypeEnum: String, Codable {
    case album = "album"
}

// MARK: - Artists
struct Artists: Codable {
    let data: [ArtistElement]
    let total: Int
}

// MARK: - Playlists
struct Playlists: Codable {
    let data: [PlaylistsDatum]
    let total: Int
}

// MARK: - PlaylistsDatum
struct PlaylistsDatum: Codable {
    let id: Int
    let title: String
    let datumPublic: Bool
    let nbTracks: Int
    let link, picture: String
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String
    let checksum: String
    let tracklist: String
    let creationDate: String
    let user: User
    let type: PurpleType

    enum CodingKeys: String, CodingKey {
        case id, title
        case datumPublic = "public"
        case nbTracks = "nb_tracks"
        case link, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case checksum, tracklist
        case creationDate = "creation_date"
        case user, type
    }
}

enum PurpleType: String, Codable {
    case playlist = "playlist"
}

// MARK: - User
struct User: Codable {
    let id: Int
    let name: String
    let tracklist: String
    let type: UserType
}

enum UserType: String, Codable {
    case user = "user"
}

// MARK: - Tracks
struct Tracks: Codable {
    let data: [TracksDatum]
    let total: Int
}

// MARK: - TracksDatum
struct TracksDatum: Codable {
let id: Int
var isPlaying: Bool?
let readable: Bool?
let title, titleShort, titleVersion: String
let link: String
let duration, rank: Int
let explicitLyrics: Bool
let explicitContentLyrics, explicitContentCover: Int
let preview: String
let position: Int?
let artist: ArtistElement
let album: Album
let type: FluffyType

    enum CodingKeys: String, CodingKey {
        case id, title, readable,isPlaying
        case titleShort = "title_short"
        case titleVersion = "title_version"
        case link, duration, rank
        case explicitLyrics = "explicit_lyrics"
        case explicitContentLyrics = "explicit_content_lyrics"
        case explicitContentCover = "explicit_content_cover"
        case preview, position, artist, album, type
    }
}

// MARK: - Album
struct Album: Codable {
    let id: Int
    let title: String
    let cover: String
    let coverSmall, coverMedium, coverBig, coverXl: String
    let tracklist: String
    let type: RecordTypeEnum

    enum CodingKeys: String, CodingKey {
        case id, title, cover
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
        case tracklist, type
    }
}

enum FluffyType: String, Codable {
    case track = "track"
}

