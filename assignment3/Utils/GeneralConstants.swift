import Foundation
import CoreGraphics

struct GeneralConstants {

    // MARK: - Error messages

    static let imageDownloadError = "Image download error"
    static let urlFailure = "Cannot create URL from url string"
    static let notNumber = "The value should be a number"
    static let invalidNumber = "The value should be in exclusive range of 1 and 100"
    static let unableToFetchData = "Unable to fetch data"

    // MARK: - Numerical Data

    static let cornerRadius: CGFloat = 6
    static let defaultListSize: Int = 20
    static let minListSize: Int = 1
    static let maxListSize: Int = 100
    static let defaultAnimationTime: TimeInterval = 0.3
    static let safeAreaBottom: CGFloat = 20
    static let cellHeight: CGFloat = 70

    // MARK: - URLs

    static let urlString = "https://mobiledemo.socialengineaddons.com/api/rest/albums?language=en&oauth_token=" +
        "ddeimjbpu7b2esk3u79qdq77tfhlo1qf&_IOS_VERSION=2.7.19&oauth_secret=ywzgn9b8ficbroc2imnb14tynbvb82ah&ios=1&page=" +
        "1&oauth_consumer_secret=f2ax3r6yzki9yiiby7g0v4rlbnl16dio&limit=&sort=&oauth_consumer_key" +
    "=nt416zygfd0o6h2gabjv2qy4nj0wcdyo"

    static let listLimitParamter = "limit="
}
