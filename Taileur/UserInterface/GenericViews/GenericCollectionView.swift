//
//  GenericCollectionView.swift
//  Taileur
//
//  Created by Engineer 144 on 13/09/2019.
//  Copyright © 2019 Engineer 144. All rights reserved.
//

import UIKit
class GenericCollectionView<T, Cell: UICollectionViewCell>: UICollectionView,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
	
	
	var items: [T]
	var configure: (Cell, T,Int) -> Void
	var selectHandler: (T,Int,UICollectionView) -> Void
	var cellWidth: CGFloat = 0.0
	var cellHeight: CGFloat = 0.0
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
/**	init(frame: CGRect,layout:UICollectionViewLayout,items: [T], configure: @escaping (Cell, T,Int) -> Void, selectHandler: @escaping (T,Int,UICollectionView) -> Void) {
		self.items = items
		self.configure = configure
		self.selectHandler = selectHandler
		super.init(frame: frame, collectionViewLayout: layout)
		self.register(Cell.self, forCellWithReuseIdentifier: "Cell")
		self.delegate = self
		self.dataSource = self
	}**/
	
	
	init(cellHeight: CGFloat = 0.0,
			 cellWidth:CGFloat = 0.0,
			 frame: CGRect,
			 layout:UICollectionViewLayout,
			 items: [T],
			 configure: @escaping (Cell, T,Int) -> Void, selectHandler: @escaping (T,Int,UICollectionView) -> Void) {
		
		self.items = items
		self.configure = configure
		self.selectHandler = selectHandler
		self.cellHeight = cellHeight
		self.cellWidth = cellWidth
		super.init(frame: frame, collectionViewLayout: layout)
		self.register(Cell.self, forCellWithReuseIdentifier: "Cell")
		self.delegate = self
		self.dataSource = self

	}
	
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		print("ITEMS COUNT Category",items.count)
		
		return items.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
		//let borderColor: CGColor! =  UIColor(hue: 0/360, saturation: 0/100, brightness: 90/100, alpha: 1.0).cgColor //
		cell.backgroundColor = .white
	//	cell.layer.borderColor = borderColor
	//	cell.layer.borderWidth = 1
		let item = items[indexPath.row]
		
		configure(cell, item,indexPath.row)
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		//collectionView.deselectItem(at: indexPath, animated: true)
		let item = items[indexPath.row]
		selectHandler(item,indexPath.row,collectionView)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)//here your custom value for spacing
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let lay = collectionViewLayout as! UICollectionViewFlowLayout
		
		var width : CGFloat = 0.0
		var height : CGFloat = 0.0
		
		if cellWidth == 0.0 {
			width = (collectionView.frame.width / 2) - lay.minimumInteritemSpacing
		}else{
			width = cellWidth
		}
		
		if cellHeight == 0.0 {
			height = 85
		}else{
			height = 280
		}

		return CGSize(width:width, height:height)
	}
	
	
	
	func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
		let cell = collectionView.cellForItem(at: indexPath) as! Cell
		cell.backgroundColor = 	UIColor(white: 0.9, alpha: 1)
	}
	
	func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
		let cell = collectionView.cellForItem(at: indexPath) as! Cell
		cell.backgroundColor = .white
	}
}
