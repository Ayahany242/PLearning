//
//  Language.swift
//  Project
//
//  Created by Afnan MacBook Pro on 21/05/2022.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import Foundation

struct Languages : Codable {

    let languages : [Language]?


    enum CodingKeys: String, CodingKey {
        case languages = "languages"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        languages = try values.decodeIfPresent([Language].self, forKey: .languages)
    }
}
struct Language : Codable {

    let desc : String?
    let examples : [String]?
    let image : String?
    let name : String?
    let videos : [Video]?


    enum CodingKeys: String, CodingKey {
        case desc = "desc"
        case examples = "examples"
        case image = "image"
        case name = "name"
        case videos = "videos"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        desc = try values.decodeIfPresent(String.self, forKey: .desc)
        examples = try values.decodeIfPresent([String].self, forKey: .examples)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        videos = try values.decodeIfPresent([Video].self, forKey: .videos)
    }
}
struct Video : Codable {

    let link : String?
    let name : String?


    enum CodingKeys: String, CodingKey {
        case link = "link"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        link = try values.decodeIfPresent(String.self, forKey: .link)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}
