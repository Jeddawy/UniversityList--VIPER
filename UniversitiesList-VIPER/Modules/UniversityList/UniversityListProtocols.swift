//
//  UniversityListProtocols.swift
//  UniversitiesList-VIPER
//
//  Created by Ibrahim El-geddawy on 02/05/2024.
//

import Foundation

// MARK: - ViewController -> Presenter

protocol UniversityListPresenterProtocol {
    
    var interactor: UniversityListInteractorInputProtocol? { get set }
    var homeData: [UniversityResponse] { get }

    /* ViewController -> Presenter */
    
    func getUniversities()
    
    func didTapCell(at index: Int)
    func getUnivesitiesCount()-> Int
    func getUniversity(at index: Int) -> UniversityResponse?
    
}

protocol UniversityListInteractorInputProtocol: AnyObject {
    
    var presenter: UniversityListInteractorOutputProtocol? { get set }
    func getUniversityList()
    func getArticlesFromRealm() -> [UniversityResponse]
  
    /* Presenter -> Interactor */
}

// MARK: - Interactor -> Presenter

protocol UniversityListInteractorOutputProtocol: AnyObject {
    
    /* Interactor -> Presenter */
    func universitiesFetchedSuccessfully(_ unversities: [UniversityResponse], statusCode: Int)
    func universitiesFetchedUnSuccessfully(title: String, errorMessage: String, statusCode: Int)
}

// MARK: - Presenter -> ViewController

protocol UniversityListViewProtocol: AnyObject {
    
    var presenter: UniversityListPresenterProtocol? { get set }
    /* Presenter -> ViewController */
    func reloadList()
    func showLoading()
    func hideLoading()
    func showErrorMessage(title: String, message: String, statusCode: Int)
}

// MARK: - Router

protocol UniversityListWireframeProtocol: AnyObject {
    func navigateToUniversityDetails(model: UniversityResponse)
}
