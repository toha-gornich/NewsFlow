//
//  NewsFlowTests.swift
//  NewsFlowTests
//
//  Created by Горніч Антон on 04.03.2026.
//

import Testing
@testable import NewsFlow

struct HomeInteractorTests {
    
    let mockNetwork: MockNetworkManager
    let interactor: HomeInteractor
    let mockPresenter: MockHomePresenter
    
    init() {
        mockNetwork = MockNetworkManager()
        interactor = HomeInteractor(networkManager: mockNetwork)
        mockPresenter = MockHomePresenter()
        interactor.presenter = mockPresenter
    }
    
    @Test("Fetch articles success")
    func fetchArticles_success() async {
        await interactor.fetchArticles(category: "general")
        
        #expect(mockPresenter.didFetchArticlesCalled == true)
        #expect(mockPresenter.fetchedArticles.count == 1)
    }
    
    @Test("Fetch articles failure")
    func fetchArticles_failure() async {
        mockNetwork.shouldFail = true
        await interactor.fetchArticles(category: "general")
        
        #expect(mockPresenter.didFailCalled == true)
    }
}
