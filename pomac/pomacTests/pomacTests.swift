//
//  pomacTests.swift
//  pomacTests
//
//  Created by ziad on 13/03/2022.
//

import XCTest
@testable import pomac
class pomacTests: XCTestCase {
    // MARK: - Network
    // Parsing Model
    func testCanParseModelViaJsonFile() throws {
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "Recipes", ofType: "json") else { fatalError("json not found")}
        guard let json = try? String(contentsOfFile: pathString,encoding: .utf8) else{
            fatalError("unable to convert json to string")
        }
        let data = json.data(using: .utf8)!
        let weatherData = try! JSONDecoder().decode([RecipesModel].self, from: data)
        XCTAssertEqual("47 g", weatherData[0].carbos)
        XCTAssertEqual("GB", weatherData[0].country)
    }
    // MARK: - Recipes Details Page
    // DI : Dependency Injection
    func testRecipeDetailsPresenterDI(){
        let data = RecipesModel(id: "1", fats: "8g", name: "testName", time: nil, image: nil, weeks: nil, carbos: nil, fibers: nil, rating: nil, country: nil, ratings: nil, calories: nil, headline: nil, keywords: nil, products: nil, proteins: nil, favorites: nil, difficulty: nil, welcomeDescription: nil, highlighted: nil, ingredients: nil, deliverableIngredients: nil)
        let cellIndex = 8
        let viewCon = RecipesDetailsPresenter(data: data, cellIndex: cellIndex)
        XCTAssertEqual(data.name, viewCon.recipesData.name)
        XCTAssertEqual(data.fats, viewCon.recipesData.fats)
    }
    // MARK: - Login
    func testLoginValidationNotNil(){
        let fixedFirstName = "ziadali@gmail.com"
        let fixedPassword = "1234"
        do{
            let input = try ValidationLogin(email: fixedFirstName, password: fixedPassword)
            XCTAssertNotNil(input)
        }catch{
            fatalError("it's value is nil")
        }
    }
    func testLoginEmail(){
        let fixedFirstName = "ziadali@gmail.com"
        let fixedPassword = "1234"
        do{
            let input = try ValidationLogin(email: fixedFirstName, password: fixedPassword)
            XCTAssertTrue(input.isValidEmail())
        }catch{
            fatalError("it's value is nil")
        }
    }
    func testLoginPasswordLength(){
        let fixedFirstName = "ziadali@gmail.com"
        let fixedPassword = "1234"
        do{
            let input = try ValidationLogin(email: fixedFirstName, password: fixedPassword)
            XCTAssertTrue(input.isValidPasswordLength())
        }catch{
            fatalError("it's value is nil")
        }
    }
    
    
}
