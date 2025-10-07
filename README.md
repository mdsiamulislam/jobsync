# JobSync

JobSync is a mobile application that helps users find and manage job applications. It allows users to browse job listings, save jobs, and track their application status.

## Features

- Browse a list of job postings.
- Search for jobs based on keywords.
- Save jobs for later.
- Apply for jobs.
- Track saved and applied jobs in the profile.
- Logout and delete account.

## Technology

- **Flutter:** The application is built using the Flutter framework, allowing for a cross-platform codebase for both Android and iOS.
- **GetX:** GetX is used for state management, routing, and dependency injection.
- **GetStorage:** GetStorage is used for local storage to persist user data.
- **http:** The http package is used to make API calls to fetch job data.
- **flutter_staggered_animations:** This package is used to add animations to the application.

## Limitations

- The application currently uses a dummy API to fetch job data. In a real-world scenario, this would be replaced with a proper backend service.
- The user authentication is simulated and does not involve a real authentication server.
- The delete account functionality only removes the user data from the local storage and does not make an API call to a backend to delete the user's data from the server.

## Disclaimer

This project was developed with the assistance of an AI-powered code assistant. The AI helped with code generation, debugging, and overall development to speed up the process.