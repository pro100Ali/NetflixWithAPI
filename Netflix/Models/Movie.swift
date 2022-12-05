//
//  Movie.swift
//  Netflix
//
//  Created by Dimash Nsanbaev on 11/8/22.
//

import Foundation

struct TrendingTitleResponse:Codable{
    let results:[Title]
}
struct Title:Codable{
    let id:Int
    let media_type:String?
    let title:String?
    let original_title:String?
    let poster_path:String?
    let overview:String?
    let vote_count:Int
    let release_date:String?
    let vote_average:Double
}


//"adult": false,
//      "backdrop_path": "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
//      "id": 436270,
//      "title": "Black Adam",
//      "original_language": "en",
//      "original_title": "Black Adam",
//      "overview": "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
//      "poster_path": "/3zXceNTtyj5FLjwQXuPvLYK5YYL.jpg",
//      "media_type": "movie",
//      "genre_ids": [
//        28,
//        14,
//        878
//      ],
//      "popularity": 3772.253,
//      "release_date": "2022-10-19",
//      "video": false,
//      "vote_average": 6.841,
//      "vote_count": 949
//    },
