//
//  File.swift
//  exam8
//
//  Created by Dmitry on 01/02/2020.
//  Copyright © 2020 Dmitry. All rights reserved.
//

import Foundation
import Alamofire

enum PostResult{
    case success(URL)
    case failure(Error)
}

enum MyError: Error{
    case requestError
}

class PastebinAPI: Alamofire.SessionManager {
//    static let apiKey = "7859691892dee13cf769f7c979e2d13e"
    static let apiKey = "f0fee6a899f960bd46730fe44e47125d"
    static let shared = PastebinAPI()
    var expData = "1H"
    
    let pasteBinUrl = "https://pastebin.com/api/api_post.php"
    
    let header = [
    "Content-Type": "application/x-www-form-urlencoded",
    "Accept": "text/html"]
    
    var requestParameters: [String:String] = [:]
    
    let api_dev_key_head = "api_dev_key" //ключ авторизации приложения
    let api_option_head = "api_option" //действие. Для создания поста отправляйте post
    let api_paste_code_head = "api_paste_code" //текст, который вы хотите сохранить
    
    let api_user_key_head = "api_user_key" //ключ авторизации пользователя
    let api_paste_name_head = "api_paste_name" //имя поста
    let api_paste_format_head = "api_paste_format" //формат текста
    let api_paste_private_head = "api_paste_private" //0 – публичный, 1 – unlisted, 2 – приватный.
    let api_paste_expire_date_head = "api_paste_expire_date"  //отвечает за время жизни поста, допустимы следующие значения: N, 10M, 1H, 1D, 1W, 2W, 1M, 6M, 1Y. В тестовых целях используйте значение 1H.
    
    func sendText(_ text: String, title: String?, expDate: String, completion: @escaping (_ result: PostResult) -> Void) {
        
        requestParameters = [
            api_dev_key_head: PastebinAPI.apiKey,
            api_option_head: "paste",
            api_paste_code_head: text,
            api_paste_expire_date_head: expDate
        ]
        
        if let t = title {
            requestParameters[api_paste_name_head] = t
        }
        
        self.request(
            pasteBinUrl,
            method: .post,
            parameters: requestParameters,
            encoding: URLEncoding.default,
            headers: header
        )
            .validate()
            .responseString(completionHandler: { (response) in
                
                if let str = response.value {
                    
                    if let requestUrl = URL(string: str) {
                        completion(.success(requestUrl))
                    }
                    else {
                        completion(.failure(MyError.requestError))
                    }
                    
                }
                
            })
        
//        print(requestParameters)
        
    }
    
}
