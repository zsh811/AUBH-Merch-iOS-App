import SwiftUI

struct ProfileView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var studentID: String = ""
    @State private var email: String = ""
    @State private var selectedCollege: String = "Select College"
    @State private var selectedDegree: String = "Select Degree"
    
    let colleges: [String] = ["Business & Management", "Engineering & Computing", "Media & Design"]
    let degrees: [String: [String]] = [
        "Business & Management": [
            " Digital Marketing & Social Media",
            " Finance",
            " Human Resource Management",
            " Management",
            "Master of Business Administration (MBA)"
        ],
        "Engineering & Computing": [
            "Civil Engineering",
            "Computer Engineering",
            "Computer Science",
            "Cybersecurity",
            "Data Science and Artificial Intelligence",
            "Industrial Engineering",
            "Mechanical Engineering",
            "Software Engineering",
            "Master of Science in Engineering Management"
        ],
        "Media & Design": [
            "Bachelor of MultiMedia",
        ]
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Profile Picture
                VStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                    
                    Text("Edit Profile Picture")
                        .font(.caption)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            // Add functionality to upload a profile picture
                        }
                }
                
                // Personal Information Form
                Form {
                    Section(header: Text("Personal Information").foregroundColor(.blue)) {
                        TextField("First Name", text: $firstName)
                            .textInputAutocapitalization(.words)
                            .autocorrectionDisabled(true)

                        TextField("Last Name", text: $lastName)
                            .textInputAutocapitalization(.words)
                            .autocorrectionDisabled(true)

                        TextField("Student ID", text: $studentID)
                            .keyboardType(.numberPad)

                        TextField("AUBH Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled(true)
                    }

                    // College and Degree Selection
                    Section(header: Text("University Information").foregroundColor(.blue)) {
                        Picker("Select College", selection: $selectedCollege) {
                            ForEach(colleges, id: \.self) { college in
                                Text(college)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        
                        if let degreeOptions = degrees[selectedCollege] {
                            Picker("Select Degree", selection: $selectedDegree) {
                                ForEach(degreeOptions, id: \.self) { degree in
                                    Text(degree)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        } else {
                            Text("Select a college to see degree options")
                                .foregroundColor(.gray)
                                .italic()
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.blue.opacity(0.1))
                
                Spacer()
                
                // Save Button
                Button(action: {
                    // Save profile changes
                    print("Profile saved")
                }) {
                    Text("Save Changes")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                // Footer Message
                Text("“Lifetime of Success” - AUBH")
                    .font(.footnote)
                    .foregroundColor(.blue)
                    .padding(.bottom, 20)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.white)
        }
    }
}

#Preview {
    ProfileView()
}
