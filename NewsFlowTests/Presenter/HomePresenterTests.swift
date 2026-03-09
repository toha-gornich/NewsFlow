//
//  HomePresenterTests.swift
//  NewsFlow
//
//  Created by Горніч Антон on 09.03.2026.
//
import Testing
@testable import NewsFlow
import Foundation

@MainActor
final class HomePresenterTests {
    
    let presenter: HomePresenter
    let mockView: MockHomeView
    let mockInteractor: MockHomeInteractor
    
    init() {
        presenter = HomePresenter()
        mockView = MockHomeView()
        mockInteractor = MockHomeInteractor()
        presenter.view = mockView
        presenter.interactor = mockInteractor
    }
    
    @Test("didFetchArticles shows articles in view")
    func didFetchArticles_showsArticles() {
        let articles = MockNetworkManager().mockArticles
        presenter.didFetchArticles(articles)
        #expect(mockView.showArticlesCalled == true)
        #expect(mockView.articles.count == 1)
    }
    
    @Test("didFailWithError shows error in view")
    func didFailWithError_showsError() {
        let error = NSError(domain: "TestError", code: -1)
        presenter.didFailWithError(error)
        #expect(mockView.showErrorCalled == true)
    }
    
    @Test("didSelectCategory triggers fetch with new category")
    func didSelectCategory_triggersFetch() async {
        presenter.didSelectCategory("sports")
        try? await Task.sleep(nanoseconds: 100_000_000)
        #expect(mockInteractor.fetchArticlesCalled == true)
        #expect(mockInteractor.lastCategory == "sports")
    }
}
