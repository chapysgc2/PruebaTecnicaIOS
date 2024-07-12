//
//  ProspectData.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 11/07/24.
//

import Foundation
import SwiftUI

struct ProspectData: Codable {
    let fechA_INICIO: String
    let fechA_ACTUAL: String
    let abiertos: Int
    let cerrados: Int
    let nO_INTERESADOS: Int
}

struct PieChartSegment: Identifiable {
    let id = UUID()
    let color: Color
    let value: Double
    let label: String
}

