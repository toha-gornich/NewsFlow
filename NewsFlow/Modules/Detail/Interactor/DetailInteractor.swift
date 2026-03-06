//
//  DetailInteractor.swift
//  NewsFlow
//
//  Created by Горніч Антон on 06.03.2026.
//

import Foundation

final class DetailInteractor: DetailPresenterToInteractorProtocol{
    weak var presenter: DetailInteractorToPresenterProtocol?
    
    var article: Article
    
    init(article:Article){
        self.article = article
    }
    
    func fetchArticle(){
        presenter?.didFetchArticle(article)
    }
}
