//
//  UniversityDetailsInteractor.swift
//  UniversitiesList-VIPER
//
//  Created by Ibrahim El-geddawy on 02/05/2024.
//

import Foundation

class UniversityDetailsInteractor{
    internal weak var presenter: UniversityDetailsInteractorOutputProtocol?
    
    // MARK: - Custom Setter
    public func setPresenter (presenter: UniversityDetailsInteractorOutputProtocol) {
        self.presenter = presenter
    }
}
extension UniversityDetailsInteractor: UniversityDetailsInteractorInputProtocol{
    
}
