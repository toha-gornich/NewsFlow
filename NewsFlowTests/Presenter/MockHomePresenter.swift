//
//  NewsFlowTests.swift
//  NewsFlowTests
//
//  Created by Горніч Антон on 04.03.2026.
//

import Testing
@testable import NewsFlow

final class MockHomePresenter: HomeInteractorToPresenterProtocol{
    var didFetchArticlesCalled = false
    var didFailedCalled = false
    var fetchedArticles: [Article] = []
    
    func didFetchArticles(_ articles: [Article]){
        didFetchArticlesCalled = true
        fetchedArticles = articles
    }
    func didFailWithError(_ error: Error) {
        didFailedCalled = true
    }

}
