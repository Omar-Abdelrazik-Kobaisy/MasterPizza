//
//  HomeViewController.swift
//  PizzaWorld
//
//  Created by Omar on 13/09/2023.
//

import UIKit
import RxSwift
import RxCocoa
class HomeViewController: BaseViewController<HomeViewModel> {

    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    
    @IBOutlet weak var PopularTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCells()
        viewModel?.viewDidLoad()
//        setupPopularItemsTabelView()
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
    override func bind(viewModel: HomeViewModel) {
        viewModel.slide.bind(to: sliderCollectionView.rx.items(cellIdentifier: String(describing: SliderCell.self),cellType: SliderCell.self)){row,slide,item in
            
        }.disposed(by: bag)
        viewModel.slideToItemAtIndex.subscribe { [weak self]index in
            self?.sliderCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
        }.disposed(by: bag)
        viewModel.popularItems.bind(to: PopularTableView.rx.items(cellIdentifier: String(describing: PopularCell.self),cellType: PopularCell.self)){row,product,cell in
            cell.title.text = product.title
            cell.des.text = product.desc
            cell.ratingView.configureWithRating(style : .compact)
            cell.ratingView.rate.text = String(product.rating ?? 0)
        }.disposed(by: bag)
//        viewModel.navigateToItemDetails.subscribe(onNext:{[weak self] product in
//            self?.coordinator?.Main.navigate(to: .itemDetails(product: product), navigationType: .push)
//        }).disposed(by: bag)
        
//        MARK: setup popularTableView
        PopularTableView.rx.modelSelected(Product.self).subscribe {[weak self] product in
            guard let self = self , let product = product.element else {return}
            self.coordinator?.Main.navigate(to: .itemDetails(product: product), navigationType: .push)
        }.disposed(by: bag)
        
        
        
        sliderCollectionView.rx.itemSelected.subscribe({ [weak self]item in
            self?.coordinator?.Main.navigate(to: .home , navigationType: .push)
        }).disposed(by: bag)

    }
    
//    func setupPopularItemsTabelView(){
//        //        MARK: setup popularTableView
//        PopularTableView.rx.itemSelected.subscribe {[weak self] index in
//            guard let self = self , let indexPath = index.element else {return}
//            self.viewModel.didSelectItemAtIndex(indexPath: indexPath)
//        }.disposed(by: bag)
//    }
}
    


