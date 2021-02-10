import Foundation

struct NetworkManager {

    static func getListOfData(numberOfItems: String, completion: @escaping ((Welcome?, Error?) -> Void)) {

        let urlString = GeneralConstants.urlString.replacingOccurrences(
            of: GeneralConstants.listLimitParamter,
            with: GeneralConstants.listLimitParamter + numberOfItems
        )

        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            do {
                let decoder = JSONDecoder()
                let responseData = try decoder.decode(Welcome.self, from: data!)
                completion(responseData, nil)
            } catch let parsingError {
                completion(nil, parsingError)
            }
        }
        task.resume()
    }
}
