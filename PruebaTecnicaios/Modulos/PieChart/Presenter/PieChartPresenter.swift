//
//  PieChartPresenter.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 11/07/24.
//

import Foundation

class PieChartPresenter: PieChartPresenterProtocol {
    weak var view: PieChartViewProtocol?

    func presentSegments(_ segments: [ProspectData]) {
        let pieChartSegments = processData(segments)
        view?.displaySegments(pieChartSegments)
    }

    private func processData(_ data: [ProspectData]) -> [PieChartSegment] {
        guard let firstItem = data.first else { return [] }

        let segments = [
            PieChartSegment(color: .red, value: Double(firstItem.abiertos), label: "Abiertos"),
            PieChartSegment(color: .green, value: Double(firstItem.cerrados), label: "Cerrados"),
            PieChartSegment(color: .blue, value: Double(firstItem.nO_INTERESADOS), label: "No Interesados")
        ]

        return segments
    }
}

