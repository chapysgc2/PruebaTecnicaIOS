//
//  LineChartInteractor\.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 11/07/24.
//

import Foundation

class LineChartInteractor: LineChartInteractorProtocol {
    func fetchLineChartData(completion: @escaping (Result<[LineChartDataEntry], Error>) -> Void) {
        guard let url = URL(string: "http://xignumresearch.com/apicrm/api/Dashboard/getOpenandClosed") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(.failure(NetworkError.noData))
                return
            }
            
            // Print para verificar los datos recibidos
            print("Received data:")
            if let jsonString = String(data: data, encoding: .utf8) {
                print(jsonString)
            }
            
            do {
                let response = try JSONDecoder().decode([LineChartDataEntry].self, from: data)
                print("Decoded response: \(response)")
                completion(.success(response))
            } catch {
                print("Error decoding JSON: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
}

