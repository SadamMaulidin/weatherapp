
import Foundation

class JSONDownloader {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    typealias JSON = [String: AnyObject]
    typealias JSONTaskCompletionHandler = (JSON?, DarkSkyError?) -> Void
    
    func jsonTask(with request: URLRequest, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        let task = session.dataTask(with: request) { (data, res, error) in
            
            guard let httpResponse = res as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }
            
            // Get Data if status is success
            if httpResponse.statusCode == 200 {
                if let data = data {
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON
                        completion(json, nil)
                        
                        // debugging
                        //print(json as Any)
                    } catch {
                        completion(nil, .jsonParsingFailiure)
                    }
                } else {
                    completion(nil, .invalidData) // since status code is 200/Okay
                }
                
            }
            // Error/Other Response handler
            else {
                completion(nil, .responseUnsuccessful(statusCode: httpResponse.statusCode))
            }
        }
        
        return task
    }
}
