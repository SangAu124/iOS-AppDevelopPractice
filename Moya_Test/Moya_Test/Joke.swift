//
//  Joke.swift
//  Moya_Test
//
//  Created by 김상금 on 2022/09/17.
//

import Foundation

struct Joke: Decodable {
    var type: String
    var value: Value

    struct Value: Decodable {
        var id: Int
        var joke: String
    }
}
