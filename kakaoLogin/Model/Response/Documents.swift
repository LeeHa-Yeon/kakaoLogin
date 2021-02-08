//
//  Documents.swift
//  kakaoLogin
//
//  Created by 이하연 on 2021/02/07.
//

import UIKit

struct Documents: Codable {
    let documents : [Document]
    let meta : Meta
}

struct Meta : Codable {
    let same_name : Same_name
    let pageable_count : Int
    let total_count : Int
    let is_end : Bool
}

struct Document : Codable {
    let x : String
    let y : String
    let place_name : String
}

struct Same_name : Codable {
    let region : [String]
    let keyword : String
    let selected_region : String
}

