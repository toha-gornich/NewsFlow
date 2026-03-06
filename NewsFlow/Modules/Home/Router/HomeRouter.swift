//
//  HomeRouter.swift
//  NewsFlow
//
//  Created by Горніч Антон on 05.03.2026.
//

import UIKit

final class HomeRouter: HomePresenterToRouterProtocol{
    static func createModule() -> UIViewController {
        let view = HomeViewController()
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    func navigateToDetail(article: Article, from view: HomePresenterToViewProtocol) {
        guard let viewController = view as? UIViewController else {return}
        let detailVC = DetailRouter.createModule(article: article)
        viewController.navigationController?.pushViewController(detailVC, animated: true)
    }
}
