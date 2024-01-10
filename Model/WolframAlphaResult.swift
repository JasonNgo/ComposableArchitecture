//
//  WolframAlphaResult.swift
//
//
//  Created by Jason Ngo on 2024-01-10.
//

import Foundation

struct WolframAlphaResult: Decodable {
  let queryresult: QueryResult

  struct QueryResult: Decodable {
    let pods: [Pod]

    struct Pod: Decodable {
      let primary: Bool?
      let subpods: [SubPod]

      struct SubPod: Decodable {
        let plaintext: String
      }
    }
  }
}

func wolframAlpha(query: String, callback: @escaping (WolframAlphaResult?) -> Void) -> Void {
    var components = URLComponents(string: "https://api.wolframalpha.com/v2/query")!
    components.queryItems = [
        URLQueryItem(name: "input", value: query),
        URLQueryItem(name: "format", value: "plaintext"),
        URLQueryItem(name: "output", value: "JSON"),
//        URLQueryItem(name: "appid", value: wolframAlphaApiKey),
    ]

    URLSession.shared.dataTask(with: components.url(relativeTo: nil)!) { data, response, error in
        callback(
            data
                .flatMap { try? JSONDecoder().decode(WolframAlphaResult.self, from: $0) }
        )
    }
    .resume()
}

func nthPrime(_ n: Int, callback: @escaping (PrimeResult?) -> Void) -> Void {
    wolframAlpha(query: "prime \(n)") { result in
        callback(
//            result
//                .flatMap {
//                    $0.queryresult
//                        .pods
//                        .first(where: { $0.primary == .some(true) })?
//                        .subpods
//                        .first?
//                        .plaintext
//                }
//                .flatMap(Int.init)
//                .flatMap(PrimeResult.init)
            PrimeResult(value: nthPrime(nth: n))
        )
    }
}

extension FixedWidthInteger {
    var isPrime: Bool {
        if self <  2 { return false }
        let squareRoot = Self(Double(self).squareRoot())
        if squareRoot * squareRoot == self { return false }
        for i in 2..<Self(Double(self).squareRoot().rounded(.up)) where self % i == 0 {
           return false
        }
        return true
    }
}

func nthPrime(nth: Int) -> Int {
    var primeCounter = 0
    var number = 2
    while true {
        if number.isPrime {
            primeCounter += 1
            if nth == primeCounter { return number }
        }
        number += 1
    }
}
