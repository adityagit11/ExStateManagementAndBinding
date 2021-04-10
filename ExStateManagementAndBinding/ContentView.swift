//
//  ContentView.swift
//  ExStateManagementAndBinding
//
//  Created by Aditya Singh on 10/04/21.
//

import SwiftUI

struct ContentView: View {
	@State var firstName = "";
	
    var body: some View {
		NavigationView
		{
			VStack
			{
				TextField("User Name (email address)", text: $firstName)
				List
				{
					Text("EMPTY ROW");
				}
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
