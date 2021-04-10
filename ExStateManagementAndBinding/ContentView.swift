//
//  ContentView.swift
//  ExStateManagementAndBinding
//
//  Created by Aditya Singh on 10/04/21.
//

import SwiftUI

struct ContentView: View {
	@State var firstName = "";
	@State var lastName = "";
	
	@State var users = [String]() // Blank users string array
	
    var body: some View {
		NavigationView
		{
			VStack
			{
				VStack
				{
					VStack
					{
						Group
						{
							TextField("First Name", text: $firstName)
								.padding(12)
						}
						.background(Color.white)
						.clipShape(RoundedRectangle(cornerRadius: 5))
						.shadow(radius: 5)
						Group
						{
							TextField("Last Name", text: $lastName)
								.padding(12)
						}
						.background(Color.white)
						.clipShape(RoundedRectangle(cornerRadius: 5))
						.shadow(radius: 5)
						HStack
						{
							Button(
								action: {
									let fullName = self.firstName + " " + self.lastName
									self.users.append(fullName)
									self.firstName = ""
									self.lastName = ""
								}
							){
								Group
								{
									Text("Create User")
										.foregroundColor(.white)
										.padding(12)
								}.background(self.firstName.count + self.lastName.count > 0 ?
												Color.blue : Color.gray)
								.clipShape(RoundedRectangle(cornerRadius: 5))
								.shadow(radius: 5)
							}
							
							Spacer()
							
							Button(
								action: {
									if (users.count > 0)
									{
										self.users.removeLast()
									}
								}
							){
								Group
								{
									Text("Delete User")
										.foregroundColor(.white)
										.padding(12)
								}.background(Color.red)
								.clipShape(RoundedRectangle(cornerRadius: 5))
								.shadow(radius: 5)
							}
						}
					}.padding(12)
				}
				.background(Color.gray)
				List{
					ForEach(users, id: \.self) { user in
						Text(user)
					}
				}
			}.navigationTitle(Text("Credit Card Form"))
			.navigationBarItems(leading: HStack
			{
				Group
				{
					Text("First name:")
					Text(firstName)
						.foregroundColor(Color.green)
				}
				
				Spacer()
				
				Group
				{
					Text("Last name:")
					Text(lastName)
						.foregroundColor(Color.green)
				}
			})
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView()
			.previewDevice("iPhone 12 Pro Max")
    }
}
