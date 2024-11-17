//
//  study_swift_github_searchTests.swift
//  study-swift-github-searchTests
//
//  Created by axis on 2024/11/17.
//
import ComposableArchitecture
import Testing

@testable import study_swift_github_search

@MainActor
struct study_swift_github_searchTests {
    @Test func basics() async throws {

        let clock = TestClock()

        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        } withDependencies: {
            $0.continuousClock = clock
        }

        await store.send(.incrementButtonTapped) {
            $0.count = 1
        }
        await store.send(.decrementButtonTapped) {
            $0.count = 0
        }
        await store.send(.toggleTimerButtonTapped) {
          $0.isTimerRunning = true
        }
        await clock.advance(by: .seconds(1))
        await store.receive(\.timerTick) {
          $0.count = 1
        }
        await store.send(.toggleTimerButtonTapped) {
          $0.isTimerRunning = false
        }
    }
}
