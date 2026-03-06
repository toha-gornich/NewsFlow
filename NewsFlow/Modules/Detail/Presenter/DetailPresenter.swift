//
//  DetailPresenter.swift
//  NewsFlow
//
//  Created by Горніч Антон on 06.03.2026.
//

import Foundation

final class DetailPresenter: DetailViewToPresenterProtocol{
    weak var view: DetailPresenterToViewProtocol?
    var interactor: DetailPresenterToInteractorProtocol?
    var router: DetailPresenterToRouterProtocol?
    
    func viewDidLoad() {
        guard let article = interactor?.article else{return}
        view?.showArticles(article)
    }
    
    func didTapReadMore() {
        guard let url = interactor?.article.url else{return}
        guard let view = view else{return}
        router?.openURL(url, from: view)
    }
}

extension DetailPresenter: DetailInteractorToPresenterProtocol{
    func didFetchArticle(_ article: Article) {
        view?.showArticles(article)
    }
}
