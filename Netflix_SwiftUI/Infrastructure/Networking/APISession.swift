//
//  APISession.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import Foundation
import Alamofire
import Moya
import Pulse

class APISession {
    typealias NetworkSession = Alamofire.Session

    static let eventMonitor = NetworkLoggerEventMonitor()
    static let session: NetworkSession = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = TimeInterval(Constants.DEFAULT_TIMEOUT_INTERVAL)
        configuration.timeoutIntervalForResource = TimeInterval(Constants.DEFAULT_TIMEOUT_INTERVAL)
        let sessionManager = NetworkSession(configuration: configuration, interceptor: RequestHandler(), eventMonitors: [eventMonitor])
        return sessionManager
    }()
}

struct NetworkLoggerEventMonitor: EventMonitor {
    private let logger = NetworkLogger()

    func request(_ request: Request, didCreateTask task: URLSessionTask) {
        logger.logTaskCreated(task)
    }

    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        logger.logDataTask(dataTask, didReceive: data)
    }

    func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
        logger.logTask(task, didFinishCollecting: metrics)
    }

    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        logger.logTask(task, didCompleteWithError: error)
    }
}

class RequestHandler: RequestInterceptor {
    private typealias RefreshCompletion = (_ succeeded: Bool, _ idToken: String?) -> Void
    private let lock = NSLock()
    private var isRefreshing = false
    private var requestsToRetry: [(RetryResult) -> Void] = []

    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        lock.lock()
        defer { lock.unlock() }

        if let response = request.task?.response as? HTTPURLResponse,
            response.statusCode == HTTPStatusCodes.unauthorized.rawValue
                || response.statusCode == HTTPStatusCodes.forbidden.rawValue {
            requestsToRetry.append(completion)
            if !isRefreshing {
                completion(.doNotRetry)
            }
            // handle retry code here
//            completion(.retry)
        } else {
            completion(.doNotRetry)
        }

    }
}
