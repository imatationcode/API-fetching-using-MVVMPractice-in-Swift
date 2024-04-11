//
//  productListTableViewCell.swift
//  MVVM_Practice
//
//  Created by Shivakumar Harijan on 10/04/24.
//

import UIKit

class productListTableViewCell: UITableViewCell {

    @IBOutlet weak var productBackgroundView: UIView!
    
    @IBOutlet weak var productCategory: UILabel!
    @IBOutlet weak var productTItle: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productDiscription: UILabel!
    @IBOutlet weak var productRating: UIButton!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    var product: Product? {
        didSet { //property observer
            productDetailConfiguration()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        productBackgroundView.clipsToBounds = false
        productBackgroundView.layer.cornerRadius = 15
        productImage.layer.cornerRadius = 10
        self.productBackgroundView.backgroundColor = .systemGray6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productDetailConfiguration() {
        guard let product else { return }
        productTItle.text = product.title
        productPrice.text = "$ \(product.price)"
        productCategory.text = product.category
        productRating.setTitle("\(product.rating.rate)", for: .normal)
        productDiscription.text = product.description
        productImage.setImage(with: product.image)
    }
    
}
