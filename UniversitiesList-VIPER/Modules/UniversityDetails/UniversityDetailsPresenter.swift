//
//  UniversityDetailsPresenter.swift
//  UniversitiesList-VIPER
//
//  Created by Ibrahim El-geddawy on 02/05/2024.
//

import Foundation

class UniversityDetailsPresenter{
    private weak var view: UniversityDetailsViewProtocol?

    var interactor: UniversityDetailsInteractorInputProtocol?
    private var router: UniversityDetailsWireframeProtocol?
    
    private var unversity: UniversityResponse!
    
    init(view: UniversityDetailsViewProtocol?, interactor: UniversityDetailsInteractorInputProtocol?, router: UniversityDetailsWireframeProtocol?, unversity: UniversityResponse) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.unversity = unversity
    }

}
extension UniversityDetailsPresenter: UniversityDetailsPresenterProtocol{
    
    func load() {
        self.view?.loadData(model: self.unversity)
    }
        
}
extension UniversityDetailsPresenter: UniversityDetailsInteractorOutputProtocol{
    
}
