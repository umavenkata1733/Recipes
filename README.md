# Recipe App

## Steps to Run the App

1. **Clone the Repository**: 
   ```bash
   git clone https://github.com/umavenkata1733/Recipes.git
   cd recipe-app
   ```

2. **Open the Project**:
   - Open the `Recipes.xcodeproj` file in Xcode.

3. **Run the App**:
   - Select the desired simulator or device.
   - Press the "Run" button (or `Cmd + R`) to build and run the app.

4. **Run Tests**:
   - Open the Test Navigator in Xcode.
   - Select the test suite and press the "Run" button (or `Cmd + U`) to run the unit tests.

## Focus Areas

### Architecture
I prioritized a clean and scalable architecture using the MVVM (Model-View-ViewModel) pattern. This approach separates concerns, making the codebase easier to maintain and test. The ViewModel handles the business logic and data manipulation, while the View (UI) is responsible for displaying the data.

### Concurrency
I utilized Swift Concurrency (`async/await`) to handle asynchronous tasks efficiently. This ensures that the app remains responsive while fetching data from the network and loading images.

### UI/UX
The UI is designed to be clean and intuitive. The main screen displays a list of recipes with their names, photos, and cuisine types. Users can refresh the list by pulling down on the table view. The app also handles empty states gracefully, informing users when no recipes are available.

### Performance Optimization
To optimize performance, I implemented a disk-based image caching solution using `NSCache` and `FileManager`. This ensures that images are loaded efficiently and network usage is minimized.

## Time Spent

I spent approximately 4-5 hours on this project. Here's how I allocated my time:

- **Initial Setup and Architecture**: 0.5 hour
- **Network Layer and Data Fetching**: 0.5 hours
- **UI Implementation**: 0.5 hour
- **Image Caching and Performance Optimization**: 0.5 hours
- **Unit Testing**: 0.5 hour

## Trade-offs and Decisions

### Trade-offs
- **Image Caching**: I chose to implement a custom disk-based image caching solution instead of using an external library like `Kingfisher`. This decision was made to demonstrate my ability to handle complex tasks and optimize performance.
- **Error Handling**: I decided to disregard the entire list of recipes if any recipe is malformed. This ensures data integrity and prevents the app from displaying potentially incorrect or incomplete data.

### Decisions
- **MVVM Architecture**: I chose MVVM over other architectures like MVC or VIPER because it provides a good balance between simplicity and separation of concerns. It also makes the codebase easier to test.
- **Swift Concurrency**: I opted to use `async/await` for handling asynchronous tasks because it simplifies the code and makes it more readable compared to traditional completion handlers.

## Weakest Part of the Project

The weakest part of the project is the error handling for network requests. While I have implemented basic error handling, it could be improved by providing more detailed error messages to the user and offering retry mechanisms.

## External Code and Dependencies

I did not use any external code, libraries, or dependencies for this project. All components, including the image caching solution, were implemented from scratch to demonstrate my skills and understanding of the underlying technologies.

## Additional Information

This project was a great opportunity to showcase my skills in iOS development, particularly in areas like architecture, concurrency, and performance optimization. I focused on creating a clean, maintainable, and efficient codebase while ensuring a good user experience. I hope this project demonstrates my ability to contribute effectively to a team and deliver high-quality iOS applications.
