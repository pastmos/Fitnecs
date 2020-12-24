//
//  ActivityAPIService.swift
//  Fitnecs
//
//  Created by Panov Sergey on 24.12.2020.
//  Copyright © 2020 Sergey Panov. All rights reserved.
//

import Moya


// MARK: - Upload API Service

protocol ActivityAPIService {

    func getActivityIndex( _ completion: @escaping (Result<ActivityIndexResponseModel, APIError>) -> Void)
}


// MARK: - Upload API Service Implementation

class ActivityAPIServiceImplementation: BaseAPIService, ActivityAPIService {

    // MARK: UploadAPIService

    func getActivityIndex(_ completion: @escaping (Result<ActivityIndexResponseModel, APIError>) -> Void) {
        provider.request(MultiTarget(ActivityAPI.getActivityIndex)) { result in
            let handledResult = self.handleNetworkResult(result, responseObject: ActivityIndexResponseModel.self)

            switch handledResult {
            case .success(let responseObject):
                completion(.success(responseObject))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
