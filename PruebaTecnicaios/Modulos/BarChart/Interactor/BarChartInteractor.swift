//
//  BarChartInteractor.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 11/07/24.
//

import Foundation

class BarChartInteractor: BarChartInteractorProtocol {
    func fetchBarChartData(completion: @escaping (Result<[BarChartDataEntry], Error>) -> Void) {
        guard let url = URL(string: "http://xignumresearch.com/apicrm/api/Dashboard/getTopOrigins") else {
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
                let response = try JSONDecoder().decode([BarChartDataEntry].self, from: data)
                print("Decoded response: \(response)")
                completion(.success(response))
            } catch {
                print("Error decoding JSON: \(error)")
                completion(.failure(error))
            }


        }.resume()
    }
}

// Define errores específicos para la red
enum NetworkError: Error {
    case invalidURL
    case noData
}
