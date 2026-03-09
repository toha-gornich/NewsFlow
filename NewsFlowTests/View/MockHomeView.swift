//
//  MockHomeView.swift
//  NewsFlow
//
//  Created by Горніч Антон on 09.03.2026.
//


import Testing
@testable import NewsFlow

@MainActor
final class MockHomeView: HomePresenterToViewProtocol {
    var showArticlesCalled = false
    var showErrorCalled = false
    var showLoadingCalled = false
    var hideLoadingCalled = false
    var articles: [Article] = []
    
    func showArticles(_ articles: [Article]) {
        showArticlesCalled = true
        self.articles = articles
    }
    
    func showError(_ message: String) { showErrorCalled = true }
    func showLoading() { showLoadingCalled = true }
    func hideLoading() { hideLoadingCalled = true }
}
