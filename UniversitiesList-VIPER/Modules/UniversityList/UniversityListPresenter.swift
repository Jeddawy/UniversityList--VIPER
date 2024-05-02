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
        if let item = self.getUniversity(at: index){
            router?.navigateToUniversityDetails(model: item)
        }
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
    
    func getUniversity(at index: Int) -> UniversityResponse? {
        if index >= 0 && index < self.getUnivesitiesCount(){
            return self.unversities[index]
        }
        return nil
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
        if let unversities = interactor?.getArticlesFromRealm(), !unversities.isEmpty{
            self.unversities = unversities
            self.view?.reloadList()
        }else{
            self.view?.showErrorMessage(title: title, message: errorMessage, statusCode: statusCode)
        }
    }
    
    
}
