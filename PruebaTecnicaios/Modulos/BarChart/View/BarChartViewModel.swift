//
//  BarChartViewModel.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 10/07/24.
//

import Foundation
import SwiftUI
class BarChartViewModel: ObservableObject {
    @Published var segments: [BarChartSegment] = []
    private var interactor: BarChartInteractorProtocol

    init(interactor: BarChartInteractorProtocol) {
        self.interactor = interactor
    }

    func fetchBarChartData() {
        print("ViewModel: Fetching bar chart data...")
        interactor.fetchBarChartData { result in
            switch result {
            case .success(let entries):
                DispatchQueue.main.async {
                    self.segments = self.convertToSegments(entries)
                }
            case .failure(let error):
                print("ViewModel: Failed to fetch bar chart data: \(error.localizedDescription)")
            }
        }
    }

    private func convertToSegments(_ entries: [BarChartDataEntry]) -> [BarChartSegment] {
        var segments: [BarChartSegment] = []
        
        for entry in entries {
            var color: Color = .blue
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
        
        return segments.sorted(by: { $0.value > $1.value }) // Ordenamos por valor descendente
    }
}
