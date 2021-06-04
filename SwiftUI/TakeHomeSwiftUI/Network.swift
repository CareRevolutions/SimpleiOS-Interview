//
//  Network.swift
//  TakeHomeSwiftUI
//
//  Created by Enrique Gongora on 6/3/21.
//

import SwiftUI

class Network: ObservableObject {
    
    @Published var stateNames: [String] = []
    
    init() {
        get { result in
            switch result {
            case .success(let state):
                state.countrySubdivisions.forEach { states in
                    DispatchQueue.main.async {
                        self.stateNames.append(states.name)
                    }
                }
            case .failure(let error):
                print("Failed to fetch states", error)
            }
        }
    }
    
    func get(completion: @escaping (Result<States, Error>) -> ()) {
        guard let url = URL(string: "https://api.carerev.com/api/v1/country_subdivisions?country_code=US") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            guard let safeData = data else { return }
            
            do {
                let states = try JSONDecoder().decode(States.self, from: safeData)
                completion(.success(states))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
