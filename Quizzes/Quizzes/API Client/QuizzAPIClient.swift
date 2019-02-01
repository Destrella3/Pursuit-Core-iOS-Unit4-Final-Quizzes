//
//  QuizzAPIClient.swift
//  Quizzes
//
//  Created by Diego Estrella III on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

final class QuizzAPIClient {
    static func getQuizz(onCompletion: @escaping ((AppError?, [QuizzQuestion]?) -> Void)) {
        NetworkHelper.shared.performDataTask(endpointURLString: "http://5c4d4c0d0de08100147c59b5.mockapi.io/api/v1/quizzes", httpMethod: "GET", httpBody: nil) { (appError, data) in
            if let appError = appError {
                onCompletion(appError, nil)
            } else if let data = data {
                do {
                    let question = try JSONDecoder().decode([QuizzQuestion].self, from: data)
                    onCompletion(nil, question)
                } catch {
                    onCompletion(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
