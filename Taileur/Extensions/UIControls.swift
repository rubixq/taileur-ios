//
//  UIControls.swift
//  Taileur
//
//  Created by Engineer 144 on 30/08/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit

class UIControls: NSObject {

	
	
	lazy var label: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	
	lazy var stack: UIStackView = {
		let view = UIStackView()
		view.axis = .vertical
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
}
