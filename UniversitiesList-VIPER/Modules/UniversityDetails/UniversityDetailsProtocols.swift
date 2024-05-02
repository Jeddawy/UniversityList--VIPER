//
//  UniversityDetailsProtocols.swift
//  UniversitiesList-VIPER
//
//  Created by Ibrahim El-geddawy on 02/05/2024.
//

import Foundation

// MARK: - ViewController -> Presenter

protocol UniversityDetailsPresenterProtocol {

    var interactor: UniversityDetailsInteractorInputProtocol? { get set }

    /* ViewController -> Presenter */
    func load()
    func didTapRefresh()
}

protocol UniversityDetailsInteractorInputProtocol: AnyObject {

    var presenter: UniversityDetailsInteractorOutputProtocol? { get set }
    /* Presenter -> Interactor */
}

// MARK: - Interactor -> Presenter

protocol UniversityDetailsInteractorOutputProtocol: AnyObject {

    /* Interactor -> Presenter */
  
}

// MARK: - Presenter -> ViewController

protocol UniversityDetailsViewProtocol: AnyObject {

    var presenter: UniversityDetailsPresenterProtocol? { get set }

    /* Presenter -> ViewController */
    func loadData(model: UniversityResponse)
}

// MARK: - Router

protocol UniversityDetailsWireframeProtocol: AnyObject {
    func dismissUniversityDetails()
}
