//
//  RecipesInteractor.swift
//  pomac
//
//  Created by ziad on 11/03/2022.
//

import UIKit

class RecipesInteractor{
    private var dataTask: URLSessionDataTask? = nil

    func getRecipesData(completion: @escaping(Result<[RecipesModel],Error>) -> Void) {
        let recipesUrl = "https://api.npoint.io/43427003d33f1f6b51cc"
        
        guard let url = URL(string: recipesUrl) else {return}
        
        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("empty response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                print("Empty Data")
                return
            }

            do{
                let decoder = JSONDecoder()
                let results = try decoder.decode([RecipesModel].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(results))
                }
            }catch{
                completion(.failure(error))
            }


        })
        dataTask?.resume()
    }
}
