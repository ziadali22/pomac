//
//  RecipesPresenter.swift
//  pomac
//
//  Created by ziad on 11/03/2022.
//

import Foundation
import Kingfisher

protocol RecipesView: AnyObject{
    func showIndicator()
    func hideIndicator()
    func fetchDataSuccess()
    func showError(error: String)
}

protocol RecipesCellView{
    func displayName(name: String)
    func displayCalories(calories: String)
    func displayHeadLine(headLine: String)
}
class RecipesPresenter {
    private weak var view: RecipesView?
    private let interactor = RecipesInteractor()
    private var recipes = [RecipesModel]()
    
    init(view: RecipesView){
        self.view = view
    }
    
    func viewDidload(){
        getRecipesData()
        //getRecipesDat()
    }
    func getRecipesData(){
        view?.showIndicator()
        interactor.getRecipesData { [weak self] (response) in
            switch response{
            case .success(let listOfData):
                self?.view?.hideIndicator()
                self?.recipes = listOfData
                self?.view?.fetchDataSuccess()
            case .failure(let error):
                self?.view?.showError(error: error.localizedDescription)
            }
        }
    }
    
//
//        func getRecipesDat(){
//            self.view?.showIndicator()
//            RequestRouter.home.send(RecipesModelArray.self, then: handleGetResponse)
//        }
//        var handleGetResponse: HandleResponse<RecipesModelArray> {
//            return { [weak self] (response) in
//                guard let self = self else {return}
//                self.view?.hideIndicator()
//                switch response {
//                case .failure(let error):
//                    self.view?.showError(error: String(describing: error))
//                    print(error.localizedDescription)
//                case .success(let model):
//                    self.recipes = model.data
//                    self.view?.fetchDataSuccess()
//                    print(self.recipes)
//
//                }
//            }
//        }
    
    
    func getRecipesCount() -> Int{
        return recipes.count
    }
    
    func configureCell(cell: RecipesTableViewCell, index: Int){
        let recipesDataCell = recipes[index]
        cell.displayName(name: recipesDataCell.name ?? "" )
        cell.displayCalories(calories: recipesDataCell.calories ?? "")
        cell.displayHeadLine(headLine: recipesDataCell.headline ?? "")
        cell.mainImage.kf.setImage(with: URL(string: recipesDataCell.image ?? ""), options: [.transition(.fade(0.8))])
    }
    
    func didTaptheCell(self: UIViewController, index: Int){
        let dependencyInjectionToPresenter = RecipesDetailsPresenter(data: recipes[index], cellIndex: index)
        let viewController = ReciepeDetailsVC(with: dependencyInjectionToPresenter)
        
        self.show(viewController, sender: nil)
        
        
    }
}
