//
//  LineChartInteractor.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 10/07/24.
//

import Foundation

class LineChartInteractor: LineChartInteractorProtocol {
    func fetchLineChartData(completion: @escaping (Result<[LineChartDataEntry], Error>) -> Void) {
        let urlString = "http://xignumresearch.com/apicrm/api/Dashboard/getOpenandClosed"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data"])))
                return
            }

            do {
                let entries = try JSONDecoder().decode([LineChartDataEntry].self, from: data)
                completion(.success(entries))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
