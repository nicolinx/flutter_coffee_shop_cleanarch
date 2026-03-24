# ☕️ Pragmatic Coffee Shop

A Flutter boilerplate designed for startups that value **speed, maintainability, and testability** over textbook complexity. This project demonstrates a "Pragmatic Architecture"—a streamlined version of Clean Architecture optimized for modern mobile clients.

## 🚀 The Philosophy

Stop writing boilerplate and start building features. This project eliminates the redundant layers often found in "Strict Clean Architecture" (DTOs, Mappers, UseCases) to achieve:

  - **40% Less Code:** Reduced friction between the API and the UI.

  - **Feature-First Organization:** Folders organized by user intent, not technical layers.

  - **100% Testability:** High-coverage unit tests for BLoCs and Repositories.

## 🏗️ Architecture Overview
### 🟢 The Simple Flow (90% of the app)

For standard data fetching, we use a direct pipeline:
**UI ➔ BLoC ➔ Repository ➔ Provider (JSON ➔ Freezed Model)**

  - **No DTOs:** We map JSON directly to immutable Freezed models in the Repository.

  - **No UseCases:** The BLoC communicates directly with the Repository for CRUD operations.

### 🟡 The Orchestrated Flow (Complex Logic)

For features requiring multiple data sources (e.g., Checkout), we introduce an **Orchestrator (Manager)**.
**UI ➔ BLoC ➔ Manager ➔ Multiple Repositories/Services**

  - The Manager coordinates cross-feature logic (e.g., Stripe Payment + Clearing Local Cart DB) to keep BLoCs and Repositories lean.

## 📂 Project Structure

Organized by **Feature**, making the codebase easy to navigate as the team scales.
Plaintext

```
  lib/
  ├── core/                # Shared clients (Dio, SharedPrefs, Theme)
  ├── features/
  │   ├── catalog/         # Everything related to browsing coffee
  │   │   ├── bloc/
  │   │   ├── models/      # Freezed models with direct JSON mapping
  │   │   ├── repositories/
  │   │   └── ui/
  │   ├── cart/            # Local cart management
  │   └── checkout/        # Complex flow involving Managers & Services
  └── main.dart
```

## 🛠️ Tech Stack

  - **State Management:** flutter_bloc

  - **Data Modeling:** freezed & json_serializable

  - **Testing:** bloc_test & mocktail

## 🧪 Testing Strategy

Despite the reduced boilerplate, the app maintains full test coverage:

  - **Repository Tests:** Validating JSON parsing and API error handling.

  - **BLoC Tests:** Ensuring correct state sequences (Loading ➔ Loaded/Error).

  - **Manager Tests:** Verifying the coordination of multiple services.

## 👨‍💻 Author

### **Nicodemus Lin**

_Mobile Engineer | Flutter Specialist | Full-Stack Engineer_

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/nicodemus-lin/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/nicolinx)
