//
//  LineChartData.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 11/07/24.
//

import Foundation
import SwiftUI

struct LineChartDataEntry: Codable {
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
    let color: Color // Asegúrate de agregar esta propiedad
    
    // Constructor que acepta un color
    init(value: Double, label: String, color: Color) {
        self.value = value
        self.label = label
        self.color = color
    }
}

