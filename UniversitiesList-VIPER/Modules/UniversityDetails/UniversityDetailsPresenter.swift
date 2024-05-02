//
//  UniversityDetailsPresenter.swift
//  UniversitiesList-VIPER
//
//  Created by Ibrahim El-geddawy on 02/05/2024.
//

import Foundation

class UniversityDetailsPresenter{
    private weak var view: UniversityDetailsViewProtocol?
    internal var delegate: RefreshUniversityListDelegate?
    var interactor: UniversityDetailsInteractorInputProtocol?
    private var router: UniversityDetailsWireframeProtocol?
    
    private var unversity: UniversityResponse!
    
    init(view: UniversityDetailsViewProtocol?, interactor: UniversityDetailsInteractorInputProtocol?, router: UniversityDetailsWireframeProtocol?, unversity: UniversityResponse,delegate: RefreshUniversityListDelegate?) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.unversity = unversity
        self.delegate = delegate
    }

}
extension UniversityDetailsPresenter: UniversityDetailsPresenterProtocol{
    func didTapRefresh() {
        self.delegate?.refershList()
        router?.dismissUniversityDetails()
    }
    
    func load() {
        self.view?.loadData(model: self.unversity)
    }
        
}

extension UniversityDetailsPresenter: UniversityDetailsInteractorOutputProtocol{
    
}
