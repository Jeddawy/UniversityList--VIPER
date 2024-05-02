//
//  UniversityListPresenter.swift
//  UniversitiesList-VIPER
//
//  Created by Ibrahim El-geddawy on 02/05/2024.
//

import Foundation

class UniversityListPresenter{
    private weak var view: UniversityListViewProtocol?
    internal var interactor: UniversityListInteractorInputProtocol?
    private var router: UniversityListWireframeProtocol?
    
    private var unversities: [UniversityResponse] = []
    
    init(view: UniversityListViewProtocol? = nil, interactor: UniversityListInteractorInputProtocol? = nil, router: UniversityListWireframeProtocol? = nil) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}


extension UniversityListPresenter: UniversityListPresenterProtocol{

    func didTapCell(at index: Int) {
        let item = self.getUniversity(at: index)
        router?.navigateToUniversityDetails(model: item)
    }
    
    func getUniversities() {
        self.view?.showLoading()
        interactor?.getUniversityList()
    }
    
    var homeData: [UniversityResponse] {
        return []
    }
    
    func getUnivesitiesCount() -> Int {
        return self.unversities.count
    }
    
    func getUniversity(at index: Int) -> UniversityResponse {
        if index >= 0 && index < self.getUnivesitiesCount(){
            return self.unversities[index]
        }
        return UniversityResponse()
    }
    
}

extension UniversityListPresenter: UniversityListInteractorOutputProtocol{
    func universitiesFetchedSuccessfully(_ inversities: [UniversityResponse], statusCode: Int) {
        self.view?.hideLoading()
        self.unversities = inversities
        self.view?.reloadList()
    }
    
    func universitiesFetchedUnSuccessfully(title: String, errorMessage: String, statusCode: Int) {
        self.view?.hideLoading()
        self.view?.showErrorMessage(title: title, message: errorMessage, statusCode: statusCode)
    }
    
    
}
