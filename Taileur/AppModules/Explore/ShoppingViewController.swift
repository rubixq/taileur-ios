//
//  ShoppingViewController.swift
//  Taileur
//
//  Created by Engineer 144 on 09/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
	
	override func viewDidLayoutSubviews() {
		view.addSubview(emptyCart)
		view.addSubview(emptycartWarning)
		emptyCart.centerVerticalToView(view)
		emptyCart.centerHorizontalToView(view)
		
		emptyCart.setWithAnchor(75)
		emptyCart.setHeightAnchor(75)
		
		emptycartWarning.pintoTop(superview: emptyCart.bottomAnchor,space: 10)
		emptycartWarning.centerVerticalToView(view)
	}

	lazy var emptyCart: UIImageView = {
		let image = UIImageView()
		image.image = #imageLiteral(resourceName: "emptycart")
		image.contentMode = .scaleAspectFit
		image.translatesAutoresizingMaskIntoConstraints = false
		return image
	}()
	
	lazy var emptycartWarning: UILabel = {
		let label = UILabel()
		label.text = "Your cart is Empty"
		label.font = .systemFont(ofSize: 16, weight: .light)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
}
