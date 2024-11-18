//
//  GithubClient.swift
//  study-swift-github-search
//
//  Created by axis on 2024/11/17.
//

import ComposableArchitecture
import Foundation


struct GithubClient {
  var fetch: (Int) async throws -> String
}


extension GithubClient: DependencyKey {
  static let liveValue = Self(
    fetch: { number in
      let (data, _) = try await URLSession.shared
        .data(from: URL(string: "https://api.github.com/users/\(number)")!)
      return String(decoding: data, as: UTF8.self)
    }
  )
}


extension DependencyValues {
  var githubClient: GithubClient {
    get { self[GithubClient.self] }
    set { self[GithubClient.self] = newValue }
  }
}
