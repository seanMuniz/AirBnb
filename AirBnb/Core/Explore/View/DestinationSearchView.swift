//
//  DestinationSearchView.swift
//  AirBnb
//
//  Created by Sean Muniz on 2024-10-14.
//

import SwiftUI




enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    
    // The @Binding property wrapper is used for the show variable.
    // This will allow us to access and modify the state variable (showDestinationSearchView) from the parent (ExploreView)
    // They will both share the same value as each other. if show is false, then so is showDestinationSearchView.
    @Binding var show: Bool
    
    @ObservedObject var viewModel: ExploreViewModel
    
    
    
    @State private var selectedOption: DestinationSearchOptions = .location
    
    @State private var startDate = Date()
    
    @State private var endtDate = Date()
    
    
    @State private var numGuests = 0;
    
    
    
    
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    
                    withAnimation(.snappy){
                        viewModel.updateListingsForLocaiton()
                        
                        // this will toggle show and change it's value.
                        // This change will directly affect the original showDestinationSearchView value.
                        // this will be initialized to false which will in turn change the value of
                        // showDestinationSearchView to false. Since it is false, it will cause ExploreView to rerender
                        // itself.
                        show.toggle()
                        print(show)
                    }
                
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                if !viewModel.searchLocation.isEmpty{
                    Button("Clear") {
                        viewModel.searchLocation = ""
                        viewModel.updateListingsForLocaiton()
                    }
                    .foregroundStyle((.black))
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            
            // location view
            //##############################
            VStack(alignment: .leading){
                
                if selectedOption == .location{
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destinations", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingsForLocaiton()
                                show.toggle()
                            }
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else{
                    CollapsedPickerView( title: "Where", description: "Add destination")
                }
                
            }
            .modifier(CollapsibleDestinationViewModifier())
            
            // this will resize the frame if it is the selected option.
            .frame(height: selectedOption == .location ? 120: 64)

            .onTapGesture {
                withAnimation(.snappy) { selectedOption = .location}
            }
            
            
            // date selection view
            // ##############################
            VStack(alignment: .leading){
                
                if selectedOption == .dates{
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    VStack{
                        
                        DatePicker(
                            "From", selection: $startDate, displayedComponents: .date)
                        
                        
                        Divider()
                        
                        DatePicker("To", selection: $endtDate, displayedComponents: .date )
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    
                    
                } else {
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            
            
            // this will resize the frame if it is the selected option.
            .frame(height: selectedOption == .dates ? 180: 64)
            .modifier(CollapsibleDestinationViewModifier())
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .dates}
            }

            
            // num guests view
            // ########################################
            
            VStack(alignment: .leading){
                if selectedOption == .guests{
                    Text("Who's coming? ")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(numGuests) Adults")
                    } onIncrement: {
                    
                        numGuests += 1
                        
                    } onDecrement: {
                        
                        // This will prevent the number of guests from going below 0
                        guard numGuests > 0 else {return}
                        numGuests -= 1
                        
                    }
                    
                    
                } else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                        .onTapGesture {
                            selectedOption = .guests
                        }
                    
                }
            }
            .frame(height: selectedOption == .guests ? 120 : 64)
            .modifier(CollapsibleDestinationViewModifier())
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .guests}
            }

        }
        Spacer()
    }
}

#Preview {
    DestinationSearchView(show: .constant(false), viewModel: ExploreViewModel(service: ExploreService()))
}

struct CollapsibleDestinationViewModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}



struct CollapsedPickerView: View {
    
    let title: String
    let description: String
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}

