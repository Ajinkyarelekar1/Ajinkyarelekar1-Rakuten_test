//
//  APIHelper.swift
//  CartrackChallenge
//
//  Created by venajr on 11/4/21.
//

import Foundation
import SVProgressHUD

class APIHelper {
    class func response(withRequest request: URLRequest, success: @escaping (_ data: Data)->Void, failure: @escaping (_ error: Error?)->Void) {
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let responseData = data, error == nil {
                success(responseData)
            } else {
                failure(error)
            }
        }
        dataTask.resume()
    }
    
    class func request(withURL urlstring: String, type: HTTPMethod, params: Data?) -> URLRequest? {
        guard let url = URL(string: urlstring) else {
            return nil
        }
        var request = URLRequest(url: url)
        request.timeoutInterval = 10
        request.httpMethod = type.rawValue
        if type == .get {
            return request
        }
        request.httpBody = params
        return request
    }
    
    class func convertToRequestData <T: Codable>(params: T?) -> Data? {
        return try? JSONEncoder().encode(params)
    }
}


enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}


extension APIHelper {
    class func fetchUsers(nextURL: String?, success: @escaping (_ users: [User], _ nextUrl: String?)->Void, failure: @escaping (_ error: String?)->Void) {
        if let request = APIHelper.request(withURL: (nextURL == nil ? APIServices.users.endpoint : nextURL!), type: .get, params: nil) {
            SVProgressHUD.show()
            APIHelper.response(withRequest: request) { (responseData) in
                SVProgressHUD.dismiss()
                if let userResponse = JSONDecoder.decodeInStyle(UserResponse.self, from: responseData), let users = userResponse.values {
                    success(users, userResponse.next)
                } else {
                    failure(nil)
                }
            } failure: { (error) in
                SVProgressHUD.dismiss()
                failure(error?.localizedDescription)
            }
        }
    }
    
    class func setImage(to imageView: UIImageView, withUrl url: String) {
        if let request = APIHelper.request(withURL: url, type: .get, params: nil) {
            APIHelper.response(withRequest: request) { (responseData) in
                if let image = UIImage(data: responseData) {
                    DispatchQueue.main.async {
                        imageView.image = image
                    }
                }
            } failure: { (error) in}
        }
    }
}
