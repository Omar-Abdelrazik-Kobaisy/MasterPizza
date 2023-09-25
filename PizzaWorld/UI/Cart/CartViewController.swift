//
//  CartViewController.swift
//  PizzaWorld
//
//  Created by Omar on 23/09/2023.
//

import UIKit
import RxSwift
import RxCocoa

class CartViewController: BaseViewController<CartViewModel> {

    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var placeOrderBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        
       
    }
    
    func configureTableView(){
        registerCells()
        tableView.rx.setDelegate(self).disposed(by: bag)
        viewModel?.bind()
        viewModel?.cartItemObservable.bind(to: tableView.rx.items(cellIdentifier: String(describing: CartItemCell.self),cellType: CartItemCell.self)){ index , model , cell in
            cell.configureCell(cart: model)
        }.disposed(by: bag)
        
    }
    func registerCells(){
        tableView.registerCellNib(cellClass: CartItemCell.self)
        tableView.registerCellNib(cellClass: CartFooterCell.self)
        tableView.registerCellNib(cellClass: CartHeaderCell.self)
    }

    override func bind(viewModel: CartViewModel) {
        //
    }

    @IBAction func didPressOlaceOrder(_ sender: Any) {
    }
}
extension CartViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeue(cellClass: CartHeaderCell.self)
        cell.configureCell()
        return cell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "delete") { [unowned self] action, view, completion in
            self.viewModel?.didDeleteItem(at: indexPath)
            completion(true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}
