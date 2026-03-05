//
//  HomeInteractor.swift
//  NewsFlow
//
//  Created by Горніч Антон on 05.03.2026.
//

import Foundation

final class HomeInteractor: HomePresenterToInteractorProtocol{
    weak var presenter: HomeInteractorToPresenterProtocol?
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManger: NetworkManager = NetworkManager.shared){
        self.networkManager = networkManger
    }
    
    func fetchArticles(category: String) async {
        do{
            let articles = try await networkManager.fetchTopHeadlines(category: category)
            await MainActor.run{
                presenter?.didFetchArticles(articles)
            }
            
        }catch{
            await MainActor.run{
                presenter?.didFailWithError(error)
            }
            
        }
    }
    
    
}


