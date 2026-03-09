//
//  MockHomeInteractor.swift
//  NewsFlow
//
//  Created by Горніч Антон on 09.03.2026.
//


import Testing
@testable import NewsFlow

final class MockHomeInteractor: HomePresenterToInteractorProtocol {
    weak var presenter: HomeInteractorToPresenterProtocol?
    var fetchArticlesCalled = false
    var lastCategory = ""
    
    func fetchArticles(category: String) async {
        fetchArticlesCalled = true
        lastCategory = category
    }
}