//
//  UniversityDetailsRouter.swift
//  UniversitiesList-VIPER
//
//  Created by Ibrahim El-geddawy on 02/05/2024.
//

import Foundation
import UIKit

class UniversityDetailsRouter{
   
    private weak var viewController: UIViewController?
    
    private init () {}
    
    private init(with viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func createModule(model: UniversityResponse) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = UniversityDetailsViewController()
        let interactor = UniversityDetailsInteractor()
        let router = UniversityDetailsRouter(with: view)
        let presenter = UniversityDetailsPresenter(view: view, interactor: interactor, router: router, unversity: model)
        
        view.setPresenter(presenter: presenter)
        interactor.setPresenter(presenter: presenter)
        
        return view
    }
}

extension UniversityDetailsRouter: UniversityDetailsWireframeProtocol{
    func dismissUniversityDetails() {
        self.viewController?.navigationController?.popViewController(animated: true)
    }
    
}
