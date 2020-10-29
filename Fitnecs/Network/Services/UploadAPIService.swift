//
//  UploadAPIService.swift
//  Fitnecs
//
//  Created by Panov Sergey on 29.10.2020.
//

import Moya


// MARK: - Upload API Service

protocol UploadAPIService {

    func getInterval( _ completion: @escaping (Result<GetIntervalResponseModel, APIError>) -> Void)
    func uploadData(data: ActivityDataType, _ completion: @escaping (Result<UploadDataResponseModel, APIError>) -> Void)
}


// MARK: - Upload API Service Implementation

class UploadAPIServiceImplementation: BaseAPIService, UploadAPIService {

    // MARK: UploadAPIService

    func getInterval(_ completion: @escaping (Result<GetIntervalResponseModel, APIError>) -> Void) {
        provider.request(MultiTarget(UploadAPI.getInterval)) { result in
            let handledResult = self.handleNetworkResult(result, responseObject: GetIntervalResponseModel.self)

            switch handledResult {
            case .success(let responseObject):
                completion(.success(responseObject))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func uploadData(data: ActivityDataType, _ completion: @escaping (Result<UploadDataResponseModel, APIError>) -> Void) {
        provider.request(MultiTarget(UploadAPI.uploadData(data: data))) { result in
            let handledResult = self.handleNetworkResult(result, responseObject: UploadDataResponseModel.self)

            switch handledResult {
            case .success(let responseObject):
                completion(.success(responseObject))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }


}
