//
//  UniversityListRouter.swift
//  UniversitiesList-VIPER
//
//  Created by Ibrahim El-geddawy on 02/05/2024.
//

import Foundation
import UIKit

class UniversityListRouter{
    private weak var viewController: UIViewController?
    
    private init () {}
    
    private init(with viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = UniversityListViewController()
        let interactor = UniversityListInteractor()
        let router = UniversityListRouter(with: view)
        let presenter = UniversityListPresenter(view: view, interactor: interactor, router: router)
        
        view.setPresenter(presenter: presenter)
        interactor.setPresenter(presenter: presenter)
        
        return view
    }
}

extension UniversityListRouter: UniversityListWireframeProtocol{
    
    func navigateToUniversityDetails(model: UniversityResponse, delegate: RefreshUniversityListDelegate?) {
        let module = UniversityDetailsRouter.createModule(model: model, delegate: delegate)
        self.viewController?.navigationController?.pushViewController(module, animated: true)
    }
    
}
