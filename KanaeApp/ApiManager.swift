//
//  ApiManager.swift
//  KanaeApp
//
//  Created by OGINO Tetsuo on 2020/01/24.
//  Copyright © 2020 togino77.gmail.com. All rights reserved.
//

import Foundation

class ApiManager {
    static let manager = ApiManager()
    private init() {
        
    }
    
    var server = Bundle.main.infoDictionary!["GOO_API_SERVER_URL"] as! String
    var app_id = Bundle.main.infoDictionary!["GOO_APP_ID"] as! String

    func call(path: String, query: [String:String], completionHandler: @escaping (([String:Any]?, URLResponse?, Error?) -> Void)) {
        guard let url = URL(string: server + path) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        var body = ["app_id": app_id]
        body.merge(query){$1}
        request.httpBody = Array(body.keys).map({$0 + "=" + body[$0]!}).joined(separator: "&").data(using: String.Encoding.utf8)

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request, completionHandler: {(data, response, error) in
            var json: [String:Any]?
            if let data = data {
                do {
                    json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String:Any]
                } catch {
                    //TODO: サーバからのレスポンスが JSON でパースできない時の対応
                    print("JSON serialization error")
                }
            }
            DispatchQueue.main.sync {
                completionHandler(json, response, error)
            }
        })
        task.resume()
    }
}
