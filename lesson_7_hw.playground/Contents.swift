import UIKit
//////////////////////////////////////////////////////////////////// TASK 1 ///////////////////////////////////////////////////////////////////////////////
//struct Item {
//    var price: Int
//    var count: Int
//    var sale: Bool
//    let product: Product
//}
//
//struct Product {
//    let name: String
//}
//
//
//class OnlineStore {
//    var inventory = [
//        "Iphone Xs": Item(price: 80000, count: 5, sale: false, product: Product(name: "Iphone Xs")),
//        "Samsung S10": Item(price: 50000, count: 3, sale: true, product: Product(name: "Samsung S10")),
//        "Nokia": Item(price: 25000, count: 15, sale: true, product: Product(name: "Nokia"))
//    ]
//
//    var coinsDeposit = 0
//    var promoCod = 2000
//
//    func buy(itemNamed name: String) -> Product? {
//        //если такого товара нет то возвращаем nil
//        guard let item = inventory[name] else {
//            return nil
//        }
//
//        // если товар закончился возвращаем nil
//        guard item.count > 0 else {
//            return nil
//        }
//
//        // если есть скидка то нельзя применить промокод и возвращаем nil
//        guard item.sale == false else {
//            return nil
//        }
//
//        // продаем товар
//        coinsDeposit -= item.price
//        var newItem = item
//        newItem.count -= 1
//        inventory[name] = newItem
//        print("продан \(name)")
//        print("осталось \(item.count - 1) \(name)")
//        return newItem.product
//    }
//}
//
//
//
//let onlineShop = OnlineStore()
//onlineShop.buy(itemNamed: "Iphone Xs")
//onlineShop.buy(itemNamed: "Iphone Xs")
//onlineShop.buy(itemNamed: "Iphone Xs")
//onlineShop.buy(itemNamed: "Iphone Xs")
//onlineShop.buy(itemNamed: "Iphone Xs")
//onlineShop.buy(itemNamed: "Iphone Xs")
//onlineShop.buy(itemNamed: "Iphone 7 plus")
//


//////////////////////////////////////////////////////////////////// TASK 2 ///////////////////////////////////////////////////////////////////////////////


enum OnlineStoreError: Error {
    case invalidSelection                           // нет в ассортименте
    case outOfStock                                 // нет в наличии
    case insufficientFunds (coinsNeeded: Int)       // недостаточно денег
    case invalidPromoCod                            // невозможно применить промокод
}


struct Item {
    var price: Int
    var count: Int
    var sale: Bool
    let product: Product
}

struct Product {
    let name: String
}


class OnlineStore {
    var inventory = [
        "Iphone Xs": Item(price: 80000, count: 5, sale: false, product: Product(name: "Iphone Xs")),
        "Samsung S10": Item(price: 50000, count: 3, sale: true, product: Product(name: "Samsung S10")),
        "Nokia": Item(price: 25000, count: 15, sale: true, product: Product(name: "Nokia"))
    ]

    var coinsDeposit = 0
    var promoCod = 2000
    
    func buy(itemNamed name: String) throws -> Product {
            //если такого товара нет то возвращаем ошибку
            guard let item = inventory[name] else {
                throw OnlineStoreError.invalidSelection
            }
    
            // если товар закончился возвращаем ошибку
            guard item.count > 0 else {
                throw OnlineStoreError.outOfStock
            }
    
            // если есть скидка то нельзя применить промокод и возвращаем ошибку
            guard item.sale == false else {
                throw OnlineStoreError.invalidPromoCod
            }
        
        // продаем товар
                coinsDeposit -= item.price
                var newItem = item
                newItem.count -= 1
                inventory[name] = newItem
                print("продан \(name)")
                print("осталось \(item.count - 1) \(name)")
                return newItem.product
    }
}


let onlineShop = OnlineStore()

do {
    let buy1 = try onlineShop.buy(itemNamed: "Iphone Xs")
} catch OnlineStoreError.invalidSelection {
    print("такого товара не существует")
} catch OnlineStoreError.outOfStock {
    print("товар закончился")
} catch OnlineStoreError.invalidPromoCod {
print("нельзя применить промокод")
} catch let error {
    print(error.localizedDescription)
}


let buy2 = try? onlineShop.buy(itemNamed: "Iphone Xs")


do {
    let buy3 = try onlineShop.buy(itemNamed: "Nokia")
} catch OnlineStoreError.invalidSelection {
    print("такого товара не существует")
} catch OnlineStoreError.outOfStock {
    print("товар закончился")
} catch OnlineStoreError.invalidPromoCod {
print("нельзя применить промокод")
} catch let error {
    print(error.localizedDescription)
}

let buy4 = try? onlineShop.buy(itemNamed: "Nokia")

//onlineShop.buy(itemNamed: "Iphone Xs")
//onlineShop.buy(itemNamed: "Iphone Xs")
//onlineShop.buy(itemNamed: "Iphone Xs")
//onlineShop.buy(itemNamed: "Iphone Xs")
//onlineShop.buy(itemNamed: "Iphone Xs")
//onlineShop.buy(itemNamed: "Iphone Xs")
//onlineShop.buy(itemNamed: "Iphone 7 plus")
//onlineShop.buy(itemNamed: "Nokia")
