//
//  HomeProtocols.swift
//  NewsFlow
//
//  Created by Горніч Антон on 05.03.2026.
//

import UIKit

//View -> Presenter
protocol HomeViewToPresenterProtocol: AnyObject {
    var view:HomePresenterToViewProtocol? {get set}
    var interactor: HomePresenterToInteractorProtocol? {get set}
    var router: HomePresenterToRouterProtocol? {get set}
    
    func viewDidLoad()
    func didSelectArticle(_ article: Article)
    func didSelectCategory(_ category: String)
}

//Presenter -> View
@MainActor
protocol HomePresenterToViewProtocol: AnyObject {
    func showArticles(_ article: [Article])
    func showError(_ message: String)
    func showLoading()
    func hideLoading()
}

//Presenter -> Interactor
protocol HomePresenterToInteractorProtocol: AnyObject{
    var presenter: HomeInteractorToPresenterProtocol? {get set}
    func fetchArticles(category: String) async
}

//Interactor -> Presenter
protocol HomeInteractorToPresenterProtocol: AnyObject{
    func didFetchArticles(_ articles: [Article])
    func didFailWithError(_ error:Error)
}

//Presenter -> Router
protocol HomePresenterToRouterProtocol: AnyObject{
    static func createModule() -> UIViewController
    func navigateToDetail(article: Article, from view: HomePresenterToViewProtocol)
}
