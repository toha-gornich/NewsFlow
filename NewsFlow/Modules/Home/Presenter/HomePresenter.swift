//
//  HomePresenter.swift
//  NewsFlow
//
//  Created by Горніч Антон on 05.03.2026.
//

import Foundation

final class HomePresenter: HomeViewToPresenterProtocol{
    weak var view: HomePresenterToViewProtocol?
    var interactor: HomePresenterToInteractorProtocol?
    var router: HomePresenterToRouterProtocol?
    
    private var currentCategory = "general"
    
    func viewDidLoad() {
        view?.showLoading()
        Task{
            await interactor?.fetchArticles(category:currentCategory)
        }
    }
    
    func didSelectArticle(_ article: Article) {
        guard let view = view else{return}
        router?.navigateToDetail(article: article, from: view)
    }
    
    func didSelectCategory(_ category: String) {
        currentCategory = category
        view?.showLoading()
        Task{
            await interactor?.fetchArticles(category:currentCategory)
        }
    }
    
    func fetchArticles(_ category: String){
        Task{
            await interactor?.fetchArticles(category:category)  
        }
    }
}

extension HomePresenter: HomeInteractorToPresenterProtocol{
    func didFetchArticles(_ articles: [Article]) {
        view?.hideLoading()
        view?.showArticles(articles)
    }
    func didFailWithError(_ error: any Error) {
        view?.hideLoading()
        view?.showError(error.localizedDescription)
    }
}
