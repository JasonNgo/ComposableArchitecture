//
//  File.swift
//  
//
//  Created by Jason Ngo on 2024-01-10.
//

import Foundation

class AppState: ObservableObject, Codable {

    // MARK: - Properties

    @Published var count: Int {
        didSet {
            let encodedData = try? JSONEncoder().encode(self)
            UserDefaults.standard.setValue(encodedData, forKey: "AppState")
        }
    }

    var isCountPrime: Bool {
        guard count >= 2 else { return false }
        guard count != 2 else { return true  }
        guard count % 2 != 0 else { return false }
        return !stride(from: 3, through: Int(sqrt(Double(count))), by: 2).contains { count % $0 == 0 }
    }


    // MARK: - Initializers

    init() {
        if let oldData = UserDefaults.standard.data(forKey: "AppState"),
           let decodedData = try? JSONDecoder().decode(AppState.self, from: oldData) {
            self.count = decodedData.count
        } else {
            self.count = 0
        }
    }

    // MARK: - Codable

    enum CodingKeys: CodingKey {
        case count
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(count, forKey: .count)
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        count = try container.decode(Int.self, forKey: .count)
    }

}
