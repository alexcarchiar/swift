//Lab09 ex 04
import Foundation

//definitions
let MAX_NUM_PRODUCTS = 10
let empty_string = ""
let empty_price = -2.0

//functions
func print_all(_ warehouse: [String],_ price: [Double],_ num_products: Int,_ avg: inout Double,_ max: inout Double){
    avg = 0.0
    max = 0.0
    var counter = 0
    
    print("The products and prices are:")
    
    for i in 0...(num_products - 1) {
        if(warehouse[i] != empty_string){
            print("\(warehouse[i]): \(price[i])")
            avg += price[i]
            counter += 1
            if(max < price[i]){
                max = price[i]
            }
        }
    
    
    }
    avg /= (Double)(counter)
    print("Average: \(avg)\nMaximum price: \(max)")
    
}

func insert_product(_ warehouse: inout [String],_ price: inout [Double],_ num_products: Int,_ new_product: inout String,_ price_new_product: inout Double) -> Int{
        
    var full = 0 //used to check if warehouse is full, counts the number of filled places
    var index_new_product = 0
    var already_in_list = false;//used to check if a product is already in list
    
    var i = num_products - 1
    while(i > -1){
        if(warehouse[i] != empty_string){
            full += 1
        }
        if(warehouse[i] == empty_string){
            index_new_product = i
        }
        i -= 1
    }
    
    if(full == num_products){
        print("The warehouse is full")
        return 2
    } else {
        print("What is the name of the product?")
        new_product = readLine()!
        for i in 0...(num_products-1){
            if(warehouse[i] == new_product){
            already_in_list = true
            }
        }
        if(already_in_list == true){
            print("The product is already in the list")
            return 0
        } else {
            warehouse[index_new_product] = new_product
            print("What is the price?")
            price[index_new_product] = (Double)(readLine()!)!
            return 1
        }
    }
}

func remove_product(_ warehouse: inout [String], _ price: inout [Double],_ num_products: Int,_ old_product: inout String) -> Int{
    
    print("Insert the name of the product you wish to remove")
    old_product = readLine()!
    
    var index_found = 0
    var found = false //means we have not found the product yet
    var i = 0
    while(i < num_products && found == false){
        if(warehouse[i] == old_product){
            found = true
            index_found = i
        }
        i += 1
    }
    
    if(found == false){
        print("The product is not in the warehouse")
        return 0
    } else {
        print("The product is removed")
        warehouse[index_found] = ""
        price[index_found] = empty_price
        return 1;
    }
    
}

//////
func update_product(_ warehouse: [String], _ price: inout [Double],_ num_products: Int,_ product: inout String,_ new_price: inout Double) -> Int{
    
    print("Insert the name of the product you wish to update")
    product = readLine()!
    var index_found = 0
    var found = false //means we have not found the product yet
    var i = 0
    while(i < num_products && found == false){
        if(warehouse[i] == product){
            found = true
            index_found = i
        }
        i += 1
    }
    
    if(found == false){
        print("The product is not in the warehouse");
        return 0;
    } else {
        print("Insert the new price");
        new_price = (Double)(readLine()!)!
        price[index_found] = new_price
        return 1;
    }
    
}
//////
//main
func main(){
    var warehouse = Array(repeating: empty_string, count: MAX_NUM_PRODUCTS)
    var price = Array(repeating: empty_price, count: MAX_NUM_PRODUCTS)
    
    var user_choice = 0
    var average = 0.0
    var max = 0.0
    
    var new_product: String = ""
    var old_product: String = ""
    var new_price = 0.0
    print("Warehouse management program\nBy alexcarchiar (C)")
    while(user_choice != 5){
        print("What do you want to do?\nPress:\n[1] Insertion of a new product and the associated price\n[2] Print the current list\n[3] Remove a product\n[4] Update product\n[5] Exit the program\n");
        user_choice = (Int(readLine()!)!)
        switch(user_choice){
        case 1:
            insert_product(&warehouse, &price, MAX_NUM_PRODUCTS, &new_product, &new_price)
        case 2:
            print_all(warehouse, price, MAX_NUM_PRODUCTS, &average, &max)
        case 3:
            remove_product(&warehouse, &price, MAX_NUM_PRODUCTS, &old_product)
        case 4:
            update_product(warehouse, &price, MAX_NUM_PRODUCTS, &old_product, &new_price)
        case 5:
            print("Goodbye")
        default:
            print("Error: wrong input. Try again")
        }
        
    }

}
main()
