//
//  HomeViewController.swift
//  PizzaWorld
//
//  Created by Omar on 13/09/2023.
//

import UIKit
import RxSwift
import RxCocoa
class HomeViewController: UIViewController {

    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    
    @IBOutlet weak var PopularTableView: UITableView!
    let viewModel = HomeViewModel()
    var bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCells()
        viewModel.viewDidLoad()
        bind()
        
    }
    func setupUI(){
        if let flowLayout = sliderCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.height*0.4)
                }
    }
    func registerCells(){
        sliderCollectionView.registerCell(cellClass: SliderCell.self)
        PopularTableView.registerCellNib(cellClass: PopularCell.self)
    }
    //subscribe 
    func bind(){
        viewModel.slide.bind(to: sliderCollectionView.rx.items(cellIdentifier: String(describing: SliderCell.self),cellType: SliderCell.self)){row,slide,item in
            
        }.disposed(by: bag)
        viewModel.slideToItemAtIndex.subscribe { [weak self]index in
            self?.sliderCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
        }.disposed(by: bag)
        viewModel.products.bind(to: PopularTableView.rx.items(cellIdentifier: String(describing: PopularCell.self),cellType: PopularCell.self)){row,product,cell in
            cell.title.text = product.title
            cell.des.text = product.desc
            cell.ratingView.configureWithRating(style : .compact)
            cell.ratingView.rate.text = String(product.rating ?? 0)
        }.disposed(by: bag)
    }
}


