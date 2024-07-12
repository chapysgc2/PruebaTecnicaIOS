//
//  BarChartData.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 11/07/24.
//

import Foundation
import SwiftUI

// Define la estructura para los datos de origen y total

struct BarChartDataEntry: Codable {
    let origen: String
    let total: Int
}

// Define un objeto para almacenar la respuesta del endpoint
// Esta estructura ahora representa directamente el array de BarChartDataEntry que se espera del JSON
struct BarChartDataResponse: Codable {
    let data: [BarChartDataEntry]
    
    // Método para inicializar desde JSON
    static func fromJSON(data: Data) throws -> BarChartDataResponse {
        return try JSONDecoder().decode(BarChartDataResponse.self, from: data)
    }
}

// Define la estructura para los segmentos del gráfico de barras
struct BarChartSegment {
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
