//
//  ContentView.swift
//  study-swift-github-search
//
//  Created by axis on 2024/11/17.
//

import SwiftUI
import ComposableArchitecture


@Reducer
struct CounterFeature {
  @ObservableState
  struct State {
    var count = 0
  }
  
  enum Action {
    case decrementButtonTapped
    case incrementButtonTapped
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .decrementButtonTapped:
        state.count -= 1
        return .none
        
      case .incrementButtonTapped:
        state.count += 1
        return .none
      }
    }
  }
}

struct ContentView: View {
  let store: StoreOf<CounterFeature>
  
  var body: some View {
    VStack {
      Text("\(store.count)")
        .font(.largeTitle)
        .padding()
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
      HStack {
        Button("-") {
          store.send(.decrementButtonTapped)
        }
        .font(.largeTitle)
        .padding()
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
        
        Button("+") {
          store.send(.incrementButtonTapped)
        }
        .font(.largeTitle)
        .padding()
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
      }
    }
  }
}

#Preview {
    ContentView(
        store: Store(initialState: CounterFeature.State()) {
          CounterFeature()
        }
    )
}
