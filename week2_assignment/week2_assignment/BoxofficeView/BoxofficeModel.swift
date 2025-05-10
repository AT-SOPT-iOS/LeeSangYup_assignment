//
//  BoxofficeModel.swift
//  week2_assignment
//
//  Created by 이상엽 on 5/10/25.
//

import Foundation

struct BoxOfficeResponse: Codable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [Movie]
}

struct Movie: Codable {
    let rank: String
    let movieNm: String
    let openDt: String
    let audiAcc: String
}
