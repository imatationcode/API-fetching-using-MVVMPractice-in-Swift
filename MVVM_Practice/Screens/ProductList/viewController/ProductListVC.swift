//
//  ProductListVC.swift
//  MVVM_Practice
//
//  Created by Shivakumar Harijan on 10/04/24.
//

import UIKit

class ProductListVC: UIViewController {
    
    @IBOutlet weak var productTableview: UITableView!
    
    private var viewModel = ProductListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        
        }

    }
    
extension ProductListVC {
    func configuration() {
        productTableview.register(UINib(nibName: "productListTableViewCell", bundle: nil), forCellReuseIdentifier: "Pcell")
        initViewModel()
        observeEvent()
    }
    
    func initViewModel() {
        
        viewModel.fetchProductListInVM()
    }
    
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard self != nil else {
                return
            }
            switch event {
            case .loading: break
            case .stopLoading: break
            case .dataLoaded:
                print("Data loaded...")
                DispatchQueue.main.async {
                    self?.productTableview.reloadData()
                }
            case .error(let error): print (error ?? "Found an error")
            }
        }
        
    }
}

extension ProductListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Pcell") as? productListTableViewCell else {
            return UITableViewCell()
        }
        let product = viewModel.products[indexPath.row]
        cell.product = product
        return cell
    }
    
    
}

