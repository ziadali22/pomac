//
//  RecipesDetailsPresenter.swift
//  pomac
//
//  Created by ziad on 13/03/2022.
//

import Foundation

class RecipesDetailsPresenter{
    var favBoll: Bool = false
    var cellIndex: Int
    var recipesData: RecipesModel
    
    init(data: RecipesModel,cellIndex: Int){
        self.recipesData = data
        self.cellIndex = cellIndex
    }

    func updateSelection(completion: (Bool) -> Void){
        let key = "\(cellIndex)"
        let userDefault = UserDefaults.standard
        let isFav = userDefault.bool(forKey: key)
        favBoll = isFav
        completion(favBoll)

    }
    
    func addToFav(completion: (Bool) -> Void){
        let key = "\(cellIndex)"
        favBoll = !favBoll
        UserDefaults.standard.set(favBoll, forKey: key)
        completion(favBoll)
    }
    

}
