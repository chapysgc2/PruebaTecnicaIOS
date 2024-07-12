//
//  BarChartPresenter.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 11/07/24.
//

import Foundation
import SwiftUI  // Asegúrate de importar SwiftUI aquí para usar Color

class BarChartPresenter: BarChartPresenterProtocol {
    weak var view: BarChartViewProtocol?

    func presentBarChartData(_ entries: [BarChartDataEntry]) {
        print("Presenter: Presenting bar chart data...")
        let barChartSegments = processData(entries)
        view?.displayBarChartData(barChartSegments)
    }

    private func processData(_ entries: [BarChartDataEntry]) -> [BarChartSegment] {
        var segments: [BarChartSegment] = []

        // Ordenar las entradas por total de mayor a menor (cambiado de menor a mayor según tu requerimiento)
        let sortedEntries = entries.sorted { $0.total > $1.total }
        print("Presenter: Processing \(sortedEntries.count) entries")

        // Mapear las entradas ordenadas a segmentos de gráfica de barras
        for entry in sortedEntries {
            let color: Color
            switch entry.origen {
            case "Streaming":
                color = .green
            case "App Punto Trader":
                color = .orange
            case "puntotrader.mx":
                color = .purple
            default:
                color = .blue
            }
            
            let segment = BarChartSegment(value: Double(entry.total), label: entry.origen, color: color)
            segments.append(segment)
        }

        print("Presenter: Processed \(segments.count) segments")
        return segments
    }
}

