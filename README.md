# PashuMitra

**Development of a Digital Farm Management Portal for Implementing Biosecurity Measures in Pig and Poultry Farms**

---

## Project Overview

PashuMitra is a mobile-first digital farm management portal designed to help pig and poultry farmers implement and maintain effective biosecurity practices. The app centralizes farm data management, animal health monitoring, feed and resource tracking, compliance checklists, training materials and real-time alerts to reduce disease risk and improve productivity. It targets small and rural farms and emphasizes simplicity, traceability and practical decision support.

> Abstract
>
> The project titled “Development of a Digital Farm Management Portal for Implementing Biosecurity Measures in Pig and Poultry Farms” focuses on creating a comprehensive digital platform that assists farmers in managing their farms efficiently while ensuring strong biosecurity practices. The portal integrates key modules for farm data management, animal health monitoring, feed and resource tracking, and biosecurity compliance, helping reduce disease outbreaks and improve overall productivity. It aims to empower pig and poultry farmers, especially in rural areas, through real-time data access, alerts, and guidelines for maintaining farm hygiene and safety. By utilizing modern web technologies and cloud-based tools, the system enhances transparency, traceability, and decision-making in farm operations. This initiative aligns with the national goals of Agriculture, FoodTech, and Rural Development, promoting sustainable and technology-driven farming practices. Overall, the project provides an innovative digital solution to strengthen biosecurity and improve the livelihoods of livestock farmers through effective digital farm management.

---

## Key Features

- **User Authentication**: Email/password sign in and Google sign-in (placeholder in UI).
- **Persistent Authentication**: Designed to support persistent login/session management so users do not have to re-login repeatedly.
- **Farm Dashboard**: Quick summary including a biosecurity score, alerts preview and fast access to major actions such as risk assessment and training.
- **Alert System**: System-generated or admin-generated alerts (e.g., disease outbreaks, vaccination reminders) with prioritized display.
- **Compliance Tracker**: Biosecurity checklist with item statuses and overall progress to help farms meet standard operating procedures.
- **Training Hub**: Categorized training modules and short lessons on best practices for animal health, housing, feed, waste disposal and vaccination.
- **Reports & Analytics**: Basic charts that visualize farm health, compliance metrics and performance trends to assist decision making.
- **Document Upload**: Support for uploading vaccination records and other farm documents in farm profile (UI and backend-ready).
- **Modular Design**: App organized into modules so new features (inventory, feed tracking, traceability) can be added later.

---

## Screens and Screenshots

Below are the main screens available in the app along with screenshots. (Files in the project container are referenced below.)

1. **Login / Welcome**
   - Prominent welcome message, email & password fields, "Forgot Password?", primary Login button and Google sign-in option. Also link to Register.
   - Screenshot: <img width="421" height="913" alt="Screenshot 2025-11-25 140304" src="https://github.com/user-attachments/assets/13d71e94-ab21-4952-9131-ac9d7ff62255" />


2. **Register / Sign Up**
   - Simplified account creation with email and password fields and a large Sign Up button.
   - Screenshot: <img width="420" height="908" alt="Screenshot 2025-11-25 140456" src="https://github.com/user-attachments/assets/5b46577a-c439-4938-a9fa-aa416e35c352" />


3. **Home / Dashboard**
   - Shows the farm name, biosecurity score card, brief alerts preview and quick action tiles (Risk Assessment, Training etc.).
   - Screenshot: <img width="420" height="910" alt="Screenshot 2025-11-25 140548" src="https://github.com/user-attachments/assets/b0aac849-20c3-46c6-9902-5aae04ca4a6f" />
   
4. **Alerts List**

   - Dedicated alerts screen listing recent alerts with clear categorization and descriptions (e.g., Disease Outbreak, Vaccination Reminder).
   - Screenshot: <img width="419" height="903" alt="Screenshot 2025-11-25 140556" src="https://github.com/user-attachments/assets/dd7f1abd-a273-4999-9424-782d25e78b6b" />


5. **Compliance Tracker**
   - Progress bar and checklist of biosecurity tasks with states (Completed, Pending). Each checklist item can be checked off.
   - Screenshot: <img width="418" height="904" alt="Screenshot 2025-11-25 140603" src="https://github.com/user-attachments/assets/76377b0e-c86d-4499-8c16-89e77e92434a" />

6. **Training Hub**
   - Categories (Waste Disposal, Housing, Feeding) and a scrollable list of training modules and short course descriptions.
   - Screenshot: <img width="420" height="907" alt="Screenshot 2025-11-25 140610" src="https://github.com/user-attachments/assets/c443307e-2daf-45f3-9f5a-0e655daf97cb" />

7. **Reports**
   - Charts and performance indicators visualizing farm health, compliance metrics and trend numbers.
   - Screenshot: <img width="425" height="911" alt="Screenshot 2025-11-25 140616" src="https://github.com/user-attachments/assets/e9e11cf3-912c-476a-8b98-442e230352a2" />

---

## 🛠 Tech Stack

<p align="left">
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg" width="50" height="50"/>
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/dart/dart-original.svg" width="50" height="50"/>
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/firebase/firebase-plain.svg" width="50" height="50"/>
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nodejs/nodejs-original.svg" width="50" height="50"/>
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" width="50" height="50"/>
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" width="50" height="50"/>
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg" width="50" height="50"/>
</p>


> Note: The repository UI is implemented with a consistent design language to allow easy connection to cloud services (Firebase or custom backend).

---

## Installation & Running (mobile app)

> These steps assume a Flutter-based project. Adjust accordingly for other frameworks.

1. Install Flutter SDK and required platform tools.
2. Clone the repository.
3. Run `flutter pub get` to fetch dependencies.
4. Configure Firebase (if used):
   - Add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) to the project.
   - Enable Firestore, Authentication and Cloud Storage in your Firebase console.
5. Run on a connected device or emulator:
   ```bash
   flutter run
   ```


---

## Contribution

Contributions are welcome. Suggested workflow:

1. Fork the repository.
2. Create a feature branch: `git checkout -b feature/your-feature`.
3. Implement changes and add tests if applicable.
4. Create a pull request with a clear description of changes.




