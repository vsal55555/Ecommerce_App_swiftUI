//
//  ContentView.swift
//  Ecommerce_App_swiftUI
//
//  Created by BSAL-MAC on 7/9/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import SwiftUI

//Model Data
struct ProductModel: Identifiable {
    
    let id: Int
    let productName: String
    let productImage: String
    let productPrice: Int
    let symbol: String
    let ratingCount: Int
    let productRating: Int
    
    init(id: Int, productName: String, productImage: String, productPrice: Int, symbol: String, ratingCount: Int, productRating: Int) {
        
        self.id = id
        self.productName = productName
        self.productImage = productImage
        self.productPrice = productPrice
        self.symbol = symbol
        self.ratingCount = ratingCount
        self.productRating = productRating
    }
}

struct ContentView: View {
    
    //new data
    let data: [ProductModel] = [
        ProductModel(id: 1, productName: "Xtreme Gear", productImage: "foto1", productPrice: 20000, symbol: "Top Sale", ratingCount: 4, productRating: 56),
        ProductModel(id: 2, productName: "Light Gear", productImage: "foto2", productPrice: 20000, symbol: "Feel to Edge", ratingCount: 4, productRating: 56),
        ProductModel(id: 3, productName: "Excellent Gear", productImage: "foto3", productPrice: 20000, symbol: "Build for Speed", ratingCount: 4, productRating: 56),
        ProductModel(id: 4, productName: "Amazing Gear", productImage: "foto4", productPrice: 20000, symbol: "Budget Gear", ratingCount: 4, productRating: 56),
        ProductModel(id: 5, productName: "Ultimate Gear", productImage: "foto5", productPrice: 20000, symbol: "Always First", ratingCount: 4, productRating: 56),
        ProductModel(id: 6, productName: "End Gear", productImage: "foto6", productPrice: 20000, symbol: "End Game", ratingCount: 4, productRating: 56)
    ]
    @State var numberofrows: Int = 0
    
    var body: some View {
      //  Product()
        
        NavigationView {
            ScrollView {
                ForEach(data) { row in
                    VStack(spacing: 10) {
                        Product(data: row, numberofProducts: self.$numberofrows)
                    }
                .padding()
                }
            }
        .navigationBarTitle("Hamro Bazar")
        .navigationBarItems(
            trailing:
            HStack(spacing: 20) {
                Button(action: {print()})
                    {
                    Image(systemName: "person.fill")
                }
                cartView(total: $numberofrows)
                }
            )
        }
        .accentColor(Color.secondary)
    .navigationViewStyle(StackNavigationViewStyle())
    }
}
struct cartView: View {
    @Binding var total: Int
    
    var body: some View {
        ZStack{
                Button(action: {print("Oky")}) {
                Image(systemName: "cart.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            Text("\(total)")
                .foregroundColor(Color.white)
            .frame(width: 10, height: 10)
                .font(.body)
            .padding(5)
                .background(Color.red)
            .clipShape(Circle())
            .offset(x: 10, y: -10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Product: View {
    
    let data: ProductModel
    
    //fit to bindings so that they can be read by the content view
    @Binding var numberofProducts: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                Image(self.data.productImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
                
                Button(action: {print("OK")}) {
                    Image(systemName: "heart")
                    .padding()
                    .foregroundColor(Color.red)
                }
            }
            
            Text(self.data.productName)
            .font(.title)
            .bold()
            .padding(.leading)
            .padding(.trailing)
            
            Text("Rs: \(self.data.productPrice)")
            .font(.title)
            .foregroundColor(Color.red)
            .bold()
            .padding(.leading)
            .padding(.trailing)
            
            HStack{
                Image(systemName: "mappin.circle")
                Text(self.data.symbol)
            }
            .padding(.leading)
            .padding(.trailing)
            
            HStack{
                HStack{
                   /* Image(systemName: "star.fill")
                    .foregroundColor(Color.yellow)
                    Image(systemName: "star.fill")
                    .foregroundColor(Color.yellow)
                    Image(systemName: "star.fill")
                    .foregroundColor(Color.yellow)
                    */
                    ForEach(0..<self.data.ratingCount) {
                        items in
                        Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                        
                    }
                }
            }
            .padding(.leading)
            .padding(.trailing)
            
            addtoCart(total: $numberofProducts)
                }
                  .background(Color("myColor"))
                    .cornerRadius(15)
                }
            }
struct addtoCart: View {
    @Binding var total: Int
    var body: some View {
        Button(action: {self.total += 1}) {
                HStack {
                    Spacer()
                    HStack {
                        Image(systemName: "cart")
                        Text("Add to Cart")
                        .font(.callout)
                        .padding()
                    }
                    Spacer()
                }
            }
            .background(Color.green)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .padding()
        }
}
