//
//  File.swift
//  exam8
//
//  Created by Dmitry on 01/02/2020.
//  Copyright © 2020 Dmitry. All rights reserved.
//

import Foundation
import Alamofire

class PastebinAPI: Alamofire.SessionManager {
    static let apiKey = "7859691892dee13cf769f7c979e2d13e"
    static let shared = PastebinAPI()
}
