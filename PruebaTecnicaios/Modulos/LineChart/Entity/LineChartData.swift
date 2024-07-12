//
//  LineChartData.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 10/07/24.
//

import Foundation
import SwiftUI

struct LineChartDataEntry: Codable {
    let promotor: Int
    let nombrE_PROMOTOR: String
    let abiertos: Int
    let cerrados: Int
    let nO_INTERESADOS: Int
    let foto: String?
}


struct LineChartDataResponse: Codable {
    let data: [LineChartDataEntry]
    
    static func fromJSON(data: Data) throws -> LineChartDataResponse {
        return try JSONDecoder().decode(LineChartDataResponse.self, from: data)
    }
}


struct LineChartSegment {
    let value: Double
    let label: String
    let color: Color
    let values: [Double]
    
    init(value: Double, label: String, color: Color, values: [Double]) {
        self.value = value
        self.label = label
        self.color = color
        self.values = values
    }
}


