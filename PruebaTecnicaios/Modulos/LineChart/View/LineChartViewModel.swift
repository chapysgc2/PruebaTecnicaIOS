//
//  LineChartViewModel.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 11/07/24.
//

import Foundation

class LineChartViewModel: ObservableObject {
    @Published var segments: [LineChartSegment] = []
    
    private let interactor: LineChartInteractorProtocol
    private let presenter: LineChartPresenterProtocol

    init(interactor: LineChartInteractorProtocol, presenter: LineChartPresenterProtocol = LineChartPresenter()) {
        self.interactor = interactor
        self.presenter = presenter
    }

    func fetchLineChartData() {
        interactor.fetchLineChartData { [weak self] result in
            switch result {
            case .success(let entries):
                self?.presenter.presentLineChartData(entries)
            case .failure(let error):
                print("Failed to fetch line chart data: \(error)")
                // Handle error as needed
            }
        }
    }
}

extension LineChartViewModel: LineChartViewProtocol {
    func displayLineChartData(_ segments: [LineChartSegment]) {
        DispatchQueue.main.async {
            self.segments = segments
        }
    }
}
