//
//  SizesSelectorView.swift
//  PizzaWorld
//
//  Created by Omar on 20/09/2023.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class SizesSelectorView : NibLoadingView {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    let viewModel : SizesSelectorViewModel = SizesSelectorViewModel()
    let bag = DisposeBag()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        collectionView.registerCell(cellClass: SizesSelectorCell.self)
        viewModel.output.itemsObservable.bind(to: collectionView.rx.items(cellIdentifier: String(describing: SizesSelectorCell.self) , cellType: SizesSelectorCell.self)){row,item,cell in
            cell.configure(item)
        }.disposed(by: bag)
    }
}
