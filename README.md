# oruphones# Flutter Project - Home Page UI with Search, Filter, and Infinite Scrolling

This Flutter project demonstrates a Home Page UI with search, filter, and infinite scrolling functionalities, all integrated with an API. The project follows the MVC architecture for organized code structure, and GetX framework for state management.

## Features

- **MVC Architecture**: The project is organized using the Model-View-Controller (MVC) architecture, separating concerns and making it easier to maintain and extend the codebase.

- **GetX State Management**: The GetX framework is used for state management. GetX automatically disposes of Observables when the associated widget is removed from the widget tree, ensuring memory optimization and avoiding memory leaks.

- **Image Cache Optimization**: Images from URLs are efficiently displayed using the `cached_network_image` package. This package automatically caches network images, reducing unnecessary network requests and improving app performance. Placeholder and error widgets provide a smooth user experience during image loading.

- **Lazy Loading**: The project implements lazy loading to load more data as the user scrolls down the list. This approach optimizes memory usage by fetching and displaying data only when needed.

## How to Build and Run the App

1. Clone this repository to your local machine.
2. Ensure you have Flutter installed. If not, follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install).
3. Connect a physical device or start an emulator.
4. Open a terminal and navigate to the project's root directory.
5. Run the following command to install dependencies:
   -flutter pub get
6. Run the app using the following command:
   -flutter run


By implementing the MVC architecture, utilizing GetX for state management, and incorporating image cache optimization and lazy loading, this Flutter project ensures a smooth user experience with memory-efficient operations. 

