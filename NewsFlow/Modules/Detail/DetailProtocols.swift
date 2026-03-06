//
//  HomeProtocols.swift
//  NewsFlow
//
//  Created by Горніч Антон on 05.03.2026.
//

import UIKit

//View -> Presenter
protocol DetailViewToPresenterProtocol: AnyObject {
    var view:DetailPresenterToViewProtocol? {get set}
    var interactor: DetailPresenterToInteractorProtocol? {get set}
    var router: DetailPresenterToRouterProtocol? {get set}
    
    func viewDidLoad()
    func didTapReadMore()

}

//Presenter -> View
@MainActor
protocol DetailPresenterToViewProtocol: AnyObject {
    func showArticles(_ article: Article)
}

//Presenter -> Interactor
protocol DetailPresenterToInteractorProtocol: AnyObject{
    var presenter: DetailInteractorToPresenterProtocol? {get set}
    var article: Article{get set}
}

//Interactor -> Presenter
protocol DetailInteractorToPresenterProtocol: AnyObject{
    func didFetchArticle(_ articles: Article)
}

//Presenter -> Router
protocol DetailPresenterToRouterProtocol: AnyObject{
    static func createModule(article:Article) -> UIViewController
    func openURL(_ url: String, from view: DetailPresenterToViewProtocol)
}
