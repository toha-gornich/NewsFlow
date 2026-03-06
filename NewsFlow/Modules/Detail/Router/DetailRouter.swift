//
//  DetailRouter.swift
//  NewsFlow
//
//  Created by Горніч Антон on 06.03.2026.
//

import UIKit

final class DetailRouter: DetailPresenterToRouterProtocol{
    static func createModule(article:Article) -> UIViewController {
        let view = DetailViewController()
        let interactor = DetailInteractor(article: article)
        let presenter = DetailPresenter()
        let router = DetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    func openURL(_ url: String, from view: any DetailPresenterToViewProtocol) {
        guard let _ = view as? UIViewController,
              let url = URL(string: url) else { return }
        UIApplication.shared.open(url)
    }
    
    
}
