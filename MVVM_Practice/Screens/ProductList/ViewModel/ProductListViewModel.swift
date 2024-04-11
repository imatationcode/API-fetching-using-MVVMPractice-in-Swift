//
//  ProductViewModel.swift
//  MVVM_Practice
//
//  Created by Shivakumar Harijan on 10/04/24.
//

import Foundation

final class ProductListViewModel {
    var products: [Product] = []
    var eventHandler: ((_ envent: Event) -> Void)? //DataBinding closure
    func fetchProductListInVM() {
        self.eventHandler?(.loading)
        APIHelper.shared.fetchProductList { response in
            self.eventHandler?(.stopLoading)
                switch response {
                case .success(let products):
                    self.products = products
                    //print(products)
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    self.eventHandler?(.error(error))
                    print(error)
                }
            }
            
        }
    }

extension ProductListViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
