//
//  LineChartViewModel.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 10/07/24.
//

import SwiftUI
import Combine

class LineChartViewModel: ObservableObject {
    @Published var segments: [LineChartSegment] = []
    private var interactor: LineChartInteractorProtocol
    private var cancellables = Set<AnyCancellable>()

    init(interactor: LineChartInteractorProtocol) {
        self.interactor = interactor
    }

    func fetchLineChartData() {
        print("Fetching line chart data...")
        interactor.fetchLineChartData { [weak self] result in
            switch result {
            case .success(let entries):
                self?.segments = self?.processData(entries) ?? []
                print("Data fetched successfully: \(self?.segments.count ?? 0) segments")
            case .failure(let error):
                print("Error fetching data: \(error.localizedDescription)")
            }
        }
    }

    private func processData(_ entries: [LineChartDataEntry]) -> [LineChartSegment] {
        print("Processing data...")
        return entries.map { entry in
            LineChartSegment(
                value: Double(entry.abiertos),
                label: entry.nombrE_PROMOTOR,
                color: .blue, // Puedes cambiar esto a tu lógica de color deseada
                values: [Double(entry.abiertos), Double(entry.cerrados), Double(entry.nO_INTERESADOS)]
            )
        }
    }
}

