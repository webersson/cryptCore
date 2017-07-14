//
//  ViewController1.swift
//  Cryptotable
//
//  Created by Albrecht Weber on 23.06.17.
//  Copyright © 2017 Albrecht Weber. All rights reserved.
//

import Cocoa



class ViewController1: NSViewController  {
    var moc = Context.moc
    
    
    //    var customSortDescriptors = [NSSortDescriptor(key: "percent_change_1h", ascending: false), NSSortDescriptor(key: "rank", ascending: false)]
    
    @IBAction func imagedownload(_ sender: Any) {
        
        LogoRequest.init().download()
        
    }
    
    @IBOutlet var arrayController: NSArrayController!
    
    @IBOutlet var tableView: NSTableView!
    
    @IBOutlet var scrollView: NSScrollView!
    
    @IBOutlet var backgroundView: NSView!
    
    
    @IBOutlet weak var filterButton: NSButton!
    
    var predicate = NSPredicate(format: "rank > 0")
    var filtered: Bool = false
    
    @IBAction func filterAction(_ sender: Any) {
        
        if filterButton.state == 1 {
            // UserDefaults.standard.set(1, forKey: "filteredInt")
            print(UserDefaults.standard.integer(forKey: "filteredInt"))
            setFilter(true)
        } else {
            // UserDefaults.standard.set(0, forKey: "filteredInt")
            print(UserDefaults.standard.integer(forKey: "filteredInt"))
            setFilter(false)
        }
    }
    
    
    
    
    
    @IBOutlet weak var numberOfResults: NSComboBox!
    
    @IBAction func upDateButton(_ sender: Any) {
        
        // let data = dataArray
        
        CoinmarketRequest.init().fetchNewData(resultAmount: numberOfResults.stringValue) { (data) in
            
            Deviation.init().setDeviations(data: data)
            
            let request = NSFetchRequest<CoinValues>(entityName: "CoinValues")
            let result = try? Context.moc.fetch(request)
            for object in result! {
                self.moc.delete(object)
            }
            
//            let request2 = NSFetchRequest<CoinNames>(entityName: "CoinNames")
//            let result2 = try? DataController.moc.fetch(request2)
//            for object in result2! {
//                self.moc.delete(object)
//            }

            let clipOrigin = self.tableView.enclosingScrollView?.contentView.bounds.origin // get the position
            
            var i = 0
            
            let group = DispatchGroup()
            data.forEach { coin in
                group.enter()
                i += 1
                let p = CoinValues.createCoinValue(symbol: coin.symbol)
                p.rank = coin.rank
                p.price_usd = coin.price_usd
                p.price_btc = coin.price_btc
                p.volume_usd = coin.volume_usd
                p.market_cap_usd = coin.market_cap_usd
                p.available_supply = coin.available_supply
                p.total_supply = coin.total_supply
                p.percent_change_1h = coin.percent_change_1h
                p.percent_change_24h = coin.percent_change_24h
                p.percent_change_7d = coin.percent_change_7d
                p.last_updated = coin.last_updated
                p.relative_volume = (coin.rank - i)
                
                p.setValue(GetNames.getCoinName(coin.name, coin.id), forKey: "coinnames")
                group.leave()
                
            }
            group.enter()
            self.tableView.enclosingScrollView?.contentView.scroll(to: clipOrigin!) // set the new position
            PUSHER.getUTC()
            LogoRequest.init().download()
            group.leave()
            group.notify(queue: .main) {
                print("loop finished")
            }


        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(true, forKey: "NSConstraintBasedLayoutVisualizeMutuallyExclusiveConstraints")
        backgroundView.backgroundColor = NSColor.controlLightHighlightColor
        UserDefaults.standard.set(false, forKey: "BarsSameDirection")
        let headerCell = CustomTableHeaderCell.init(textCell: "123123")
        
        // self.tableView.tableColumns[0].headerCell = headerCell
       
        setFilterButton()
        
        
        self.createTableContextMenu()
        
        tableView.doubleAction = #selector(doubleClick(_:))
        
        
        
        
        
        
        
        
        
        
    }
    
    
    // MARK: - Table column choosing
    
    /// the key in user defaults
    let kUserDefaultsKeyVisibleColumns = "kUserDefaultsKeyVisibleColumns"
    
    /// set up the table header context menu for choosing the columns.
    func createTableContextMenu() {
        
        let tableHeaderContextMenu = NSMenu(title:"Select Columns")
        let tableColumns = self.tableView.tableColumns
        for column in tableColumns {
            let title = column.headerCell.title
            
            let item = tableHeaderContextMenu.addItem(withTitle: title,
                                                      action:#selector(contextMenuSelected(_:)),
                                                      keyEquivalent: "")
            
            item.target = self
            item.representedObject = column
            item.state = NSOnState
            
            if let dict = UserDefaults.standard.dictionary(forKey: kUserDefaultsKeyVisibleColumns) as? [String : Bool] {
                if let hidden = dict[column.identifier] {
                    column.isHidden = hidden
                }
            }
            item.state = column.isHidden ? NSOffState : NSOnState
            
        }
        self.tableView.headerView?.menu = tableHeaderContextMenu
    }
    
    /// The table action. `addItemWithTitle` specifies this func.
    func contextMenuSelected(_ menu:NSMenuItem) {
        if let column = menu.representedObject as? NSTableColumn {
            let shouldHide = !column.isHidden
            column.isHidden = shouldHide
            menu.state = column.isHidden ? NSOffState: NSOnState
            if shouldHide {
                // haven't decided which I like better.
                //                tableView.sizeLastColumnToFit()
                tableView.sizeToFit()
            } else {
                tableView.sizeToFit()
            }
        }
        self.saveTableColumnDefaults()
    }
    
    /// Writes the selection to user defaults. Called every time an item is chosen.
    func saveTableColumnDefaults() {
        var dict = [String : Bool]()
        let tableColumns = self.tableView.tableColumns
        for column:NSTableColumn in tableColumns {
            dict[column.identifier] = column.isHidden
        }
         UserDefaults.standard.set(dict, forKey: kUserDefaultsKeyVisibleColumns)
    }
    
    func doubleClick(_ sender:AnyObject) {
        // the sender is the tableview
        
        guard tableView.selectedRow >= 0 else {
            return
        }
        let item = dataArray[tableView.selectedRow]
        representedObject = item
    }


    
    func setFilterButton() {
        if (UserDefaults.standard.integer(forKey: "filteredInt") == nil) {
            UserDefaults.standard.set(0, forKey: "filteredInt")
        }
        
        filterButton.state = UserDefaults.standard.integer(forKey: "filteredInt")
        if UserDefaults.standard.integer(forKey: "filteredInt") == 1 {
            setFilter(true)
        } else {
            setFilter(false)
        }

        
    }
   
    func setFilter(_ onoff: Bool) {
        if onoff == true {
            willChangeValue(forKey: "predicate")
            predicate = NSPredicate(format: "coinnames.favorite == true")
            didChangeValue(forKey: "predicate")
        } else {
            willChangeValue(forKey: "predicate")
            predicate = NSPredicate(format: "rank > 0")
            didChangeValue(forKey: "predicate")
        }
        
    }
    
    
}

