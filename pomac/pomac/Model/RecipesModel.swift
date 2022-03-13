//
//  RecipesModel.swift
//  pomac
//
//  Created by ziad on 11/03/2022.
//

import UIKit
struct RecipesModelArray:Codable, CodableInit {
    let data: [RecipesModel]
}
struct RecipesModel: Codable, CodableInit {
    let id, fats, name, time: String?
    let image: String?
    let weeks: [String]?
    let carbos, fibers: String?
    let rating: Double?
    let country: String?
    let ratings: Int?
    let calories, headline: String?
    let keywords, products: [String]?
    let proteins: String?
    let favorites, difficulty: Int?
    let welcomeDescription: String?
    let highlighted: Bool?
    let ingredients: [String]?
    let deliverableIngredients: [String]?

    enum CodingKeys: String, CodingKey {
        case id, fats, name, time, image, weeks, carbos, fibers, rating, country, ratings, calories, headline, keywords, products, proteins, favorites, difficulty
        case welcomeDescription = "description"
        case highlighted, ingredients
        case deliverableIngredients = "deliverable_ingredients"
    }
    
}
