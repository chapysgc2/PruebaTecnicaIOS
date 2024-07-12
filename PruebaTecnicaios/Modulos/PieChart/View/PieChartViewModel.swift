//
//  PieChartViewModel.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 11/07/24.
//

import Foundation
import SwiftUI

class PieChartViewModel: ObservableObject {
    @Published var segments: [PieChartSegment] = []
    private var interactor: PieChartInteractor

    init(interactor: PieChartInteractor) {
        self.interactor = interactor
        setupVIPER()
        fetchPieChartData()
    }

    private func setupVIPER() {
        let presenter = PieChartPresenter()
        presenter.view = self
        interactor.presenter = presenter
    }

    private func fetchPieChartData() {
        interactor.fetchPieChartData()
    }
}

extension PieChartViewModel: PieChartViewProtocol {
    func displaySegments(_ segments: [PieChartSegment]) {
        DispatchQueue.main.async {
            self.segments = segments
        }
    }
}
