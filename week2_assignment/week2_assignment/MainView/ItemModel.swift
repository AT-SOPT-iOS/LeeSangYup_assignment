//
//  ItemModel.swift
//  week2_assignment
//
//  Created by 이상엽 on 4/30/25.
//

import UIKit

struct todayTvingModel {
    let rateNumber: String
    let todayTvingImgae: UIImage
}

extension todayTvingModel {
    static func dummyData() -> [todayTvingModel] {
        return [
            todayTvingModel(rateNumber: "1", todayTvingImgae: .movie1),
            todayTvingModel(rateNumber: "2", todayTvingImgae: .movie2),
            todayTvingModel(rateNumber: "3", todayTvingImgae: .movie3),
            todayTvingModel(rateNumber: "4", todayTvingImgae: .movie4),
            todayTvingModel(rateNumber: "5", todayTvingImgae: .movie5),
            todayTvingModel(rateNumber: "6", todayTvingImgae: .movie6),
            todayTvingModel(rateNumber: "7", todayTvingImgae: .movie7),
            todayTvingModel(rateNumber: "8", todayTvingImgae: .movie8),
            todayTvingModel(rateNumber: "9", todayTvingImgae: .movie9)

        ]
    }
}

struct popularLiveModel {
    let popularLiveImgae: UIImage
    let rankNumber: String
    let liveName: String
    let episodeNumber: String
    let viewingNumber: String
}

extension popularLiveModel {
    static func dummyData() -> [popularLiveModel] {
        return [
            popularLiveModel(popularLiveImgae: .live1, rankNumber: "1", liveName: "환승연애3", episodeNumber: "12화", viewingNumber: "27.2%"),
            popularLiveModel(popularLiveImgae: .live2, rankNumber: "2", liveName: "별들에게 물어봐", episodeNumber: "14화", viewingNumber: "27.2%"),
            popularLiveModel(popularLiveImgae: .live3, rankNumber: "3", liveName: "선재업고튀어", episodeNumber: "14화", viewingNumber: "27.2%"),
            popularLiveModel(popularLiveImgae: .live4, rankNumber: "4", liveName: "뿅뿅 지구오락실", episodeNumber: "14화", viewingNumber: "27.2%"),
            popularLiveModel(popularLiveImgae: .live5, rankNumber: "5", liveName: "슬기로울 전공의생활", episodeNumber: "14화", viewingNumber: "27.2%"),
            popularLiveModel(popularLiveImgae: .live6, rankNumber: "6", liveName: "이혼보험", episodeNumber: "14화", viewingNumber: "27.2%"),

            ]
    }
}

struct baseballModel {
    let baseballImage: UIImage
}

extension baseballModel {
    static func dummyData() -> [baseballModel] {
        return [
            baseballModel(baseballImage: .baseball1),
            baseballModel(baseballImage: .baseball2),
            baseballModel(baseballImage: .baseball3),
            baseballModel(baseballImage: .baseball4),
            baseballModel(baseballImage: .baseball5),
            baseballModel(baseballImage: .baseball6),
            baseballModel(baseballImage: .baseball7),
            baseballModel(baseballImage: .baseball8),
            baseballModel(baseballImage: .baseball9),
            baseballModel(baseballImage: .baseball10)
        ]
    }
}

struct popularMovieModel {
    let popularMovieImage: UIImage
}

extension popularMovieModel {
    static func dummyData() -> [popularMovieModel] {
        return [
            popularMovieModel(popularMovieImage: .movie10),
            popularMovieModel(popularMovieImage: .movie11),
            popularMovieModel(popularMovieImage: .movie9),
            popularMovieModel(popularMovieImage: .movie8),
            popularMovieModel(popularMovieImage: .movie7),
            popularMovieModel(popularMovieImage: .movie6),
            popularMovieModel(popularMovieImage: .movie5),
            popularMovieModel(popularMovieImage: .movie4),
            popularMovieModel(popularMovieImage: .movie3),
            popularMovieModel(popularMovieImage: .movie2),
            popularMovieModel(popularMovieImage: .movie1)
        ]
    }
}

struct etcModel {
    let etcImage: UIImage
}

extension etcModel {
    static func dummyData() -> [etcModel] {
        return [
            etcModel(etcImage: .etc1),
            etcModel(etcImage: .etc2),
            etcModel(etcImage: .etc4),
            etcModel(etcImage: .etc1),
            etcModel(etcImage: .etc3),
            etcModel(etcImage: .etc4),
        ]
    }
}

struct masterpieceModel {
    let masterpieceImage: UIImage
}

extension masterpieceModel {
    static func dummyData() -> [masterpieceModel] {
        return [
            masterpieceModel(masterpieceImage: .live6),
            masterpieceModel(masterpieceImage: .live3),
            masterpieceModel(masterpieceImage: .live1),
            masterpieceModel(masterpieceImage: .live2),
            masterpieceModel(masterpieceImage: .live4)
        ]
    }
}
