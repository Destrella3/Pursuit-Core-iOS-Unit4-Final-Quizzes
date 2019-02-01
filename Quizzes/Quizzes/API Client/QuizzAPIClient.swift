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
        NetworkHelper.shared.performDataTask(endpointURLString: "https://github.com/Destrella3/Pursuit-Core-iOS-Unit4-Final-Quizzes", httpMethod: "GET", httpBody: nil) { (appError, data) in
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
