//
//  BoxofficeService.swift
//  week2_assignment
//
//  Created by 이상엽 on 5/9/25.
//

import Foundation

final class BoxofficeService {
    static let shared = BoxofficeService()
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? "NO_API_KEY"
    
    func fetchMovies(date: String, completion: @escaping ([Movie]) -> Void) {
        guard let url = URL(string: "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(apiKey)&targetDt=\(date)") else {
            completion([])
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                let message = error?.localizedDescription ?? "알 수 없는 에러"
                print("데이터 로드 실패: \(message)")
                completion([])
                return
            }

            do {
                let decoded = try JSONDecoder().decode(BoxOfficeResponse.self, from: data)
                completion(decoded.boxOfficeResult.dailyBoxOfficeList)
            } catch {
                print("디코딩 실패: \(error)")
                completion([])
            }
        }
        task.resume()
    }
}
