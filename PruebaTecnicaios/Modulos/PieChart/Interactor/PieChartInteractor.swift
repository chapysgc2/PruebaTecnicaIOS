//
//  PieChartInteractor.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 11/07/24.
//

import Foundation
import Combine

class PieChartInteractor: ObservableObject, PieChartInteractorInput {
    var presenter: PieChartPresenterProtocol?
    private var cancellables = Set<AnyCancellable>()

    func fetchPieChartData() {
        guard let url = URL(string: "http://xignumresearch.com/apicrm/api/Dashboard/getTotalAnualProspects") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [ProspectData].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print("Error fetching data: \(error)")
                }
            }, receiveValue: { [weak self] data in
                self?.presenter?.presentSegments(data) // Llama a presentSegments con [ProspectData]
            })
            .store(in: &cancellables)
    }
}
