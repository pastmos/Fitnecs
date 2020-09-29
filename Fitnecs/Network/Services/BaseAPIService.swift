//
//  BaseAPIService.swift
//  VTBMobile
//
//  Created by Panov Sergey on 6/6/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import Moya
//import Result

class AuthenticationErrorHandler {
    private let onAuthenticationError: () -> Void

    init(onError: @escaping () -> Void) {
        onAuthenticationError = onError
    }

    func handleError(_ error: APIError) -> Bool {
        if case APIError.authenticationError = error {
            onAuthenticationError()
            return true
        }
        return false
    }
}

class BaseAPIService {

    weak var authErrorHandler: AuthenticationErrorHandler?

    convenience init() {
        self.init(authErrorHandler: AppDelegate.shared?.appCoordinator.authErrorHandler)
    }

    init(authErrorHandler: AuthenticationErrorHandler?) {
        self.authErrorHandler = authErrorHandler
    }

    // MARK: Properties

    private let authPlugin = AccessTokenPlugin {_ in 
        let storageService: StorageService = StorageServiceImplementation()

        guard let secret = storageService.stringFromUserDefaults(with: .secretKey), !secret.isEmpty else {
            return ""
        }

        let token = storageService.stringFromKeychain(with: KeychainStorage.Key.token)

        return token ?? ""
    }

    var plugins: [PluginType] {
        #if DEBUG
        return [authPlugin, NetworkLoggerPlugin()]
        #endif
        return [authPlugin]
    }

    lazy var provider = MoyaProvider<MultiTarget>(/*stubClosure: MoyaProvider.immediatelyStub,*/ plugins: plugins)


    // MARK: Public

    func handleNetworkResult<T: Decodable>(_ result: Result<Moya.Response, MoyaError>, responseObject: T.Type) -> Swift.Result<T, APIError> {
        switch result {
        case .success(let response):
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .customISO8601
                let value = try response.map(responseObject, using: decoder)
                return .success(value)
            }
            catch {
                let pureResponseBody = String(decoding: response.data, as: UTF8.self)
                #if DEBUG
                print("BODY: \(pureResponseBody)") // TODO: Create and move to external network logger
                print("ERROR: \(error)")
                #endif
                return .failure(.unableToDecode(message: Strings.Error.Decode.Unable.message))
            }

        case .failure(let error):
            return .failure(handleNetworkError(error))
        }

    }

    func handleNetworkResult(_ result: Result<Moya.Response, MoyaError>) -> Swift.Result<Void, APIError> {
        switch result {
        case .success:
            return .success(())
        case .failure(let error):
            return .failure(handleNetworkError(error))
        }
    }


    // MARK: Private

    private func handleNetworkError(_ error: MoyaError) -> APIError {
        if let errorResponse = error.response {
            do {
                let serverErrorModel = try errorResponse.map(ErrorModel.self)
                #if DEBUG
                print(serverErrorModel) // TODO: Create and move to external network logger
                #endif

                switch errorResponse.statusCode {
                case 401, 403: return .authenticationError(error: serverErrorModel)
                case 501...599: return .badRequest(error: serverErrorModel)
                case 600: return .outdated(error: serverErrorModel)
                default: return .failed(error: serverErrorModel, code: errorResponse.statusCode)
                }
            }
            catch {
                let pureResponseBody = String(decoding: errorResponse.data, as: UTF8.self)
                #if DEBUG
                print(pureResponseBody) // TODO: Create and move to external network logger
                #endif
                return .unableToDecode(message: error.localizedDescription)
            }
        }
        else {
            switch error {
            case .underlying(let underlyingError, _):
                return handleUnderlyingError(underlyingError)
            default:
                return .custom(message: error.localizedDescription)
            }
        }
    }

    private func handleUnderlyingError(_ error: Error) -> APIError {
        let nsError = error as NSError

        switch nsError.domain {
        case NSURLErrorDomain:
            return handleNSURLError(nsError)
        default:
            return .custom(message: error.localizedDescription)
        }
    }

    private func handleNSURLError(_ error: NSError) -> APIError {
        switch error.code {
        case NSURLErrorNotConnectedToInternet:
            return .notConnectedToInternet
        case NSURLErrorTimedOut:
            return .timedOut
        default:
            return .custom(message: error.localizedDescription)
        }
    }
}


enum APIError: Error, Equatable {

    case authenticationError(error: ErrorModel)
    case badRequest(error: ErrorModel)
    case outdated(error: ErrorModel)
    case failed(error: ErrorModel, code: Int)
//    case noData
    case unableToDecode(message: String)
    case custom(message: String)
    case notConnectedToInternet
    case timedOut

}
