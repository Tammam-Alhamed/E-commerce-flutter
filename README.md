# 🛒 Scalable E-Commerce Ecosystem (Flutter & Laravel)

A comprehensive, high-performance digital commerce mobile application built with **Flutter**, designed to seamlessly interface with a robust **Laravel** RESTful API. This project demonstrates end-to-end e-commerce architecture, from dynamic product discovery to secure checkout and real-time order management.

## 🚀 Core Engineering Features

* **Advanced State Management:** Leveraged **GetX** for reactive state management, efficient dependency injection, and centralized routing, ensuring a jank-free 60 FPS experience across all devices.
* **Clean & Modular Architecture:** Implemented a strictly decoupled folder structure (`Controllers`, `Core`, `Data`, `View`), completely isolating business logic from UI components to maximize scalability and testability.
* **Dynamic Cart & Checkout Engine:** Engineered a complex cart system featuring real-time price calculation, coupon code application, and a multi-step checkout process (Address Selection, Delivery Type, Payment Method).
* **Order Lifecycle & Tracking:** Built a comprehensive order management system (Pending, Details, Archived) synchronized with real-time push notifications via **Firebase Cloud Messaging (FCM)**.
* **Robust Networking & Error Handling:** Developed custom `CRUD` classes and `HandlingDataView` widgets to manage API calls, network states, and graceful error handling automatically.
* **Localization & Theming:** Integrated dynamic multi-language support and custom app themes globally.

## 🛠 Technical Stack

* **Frontend Framework:** Flutter & Dart
* **State Management:** GetX
* **Backend API:** Laravel / MySQL (RESTful Integration)
* **Networking:** HTTP (with custom error/status handling)
* **Notifications:** Firebase Cloud Messaging (FCM)
* **Assets & Animations:** Lottie (for dynamic empty/loading states) & Custom Fonts (Cairo, Playfair).

## 📂 Architectural Overview

The codebase is structured for Enterprise-level maintainability:
- `lib/core/` - Global constants, middleware, localization files, and core networking services.
- `lib/data/` - Remote data sources, API models, and repository layers.
- `lib/controller/` - GetX controllers orchestrating complex business logic and state.
- `lib/view/` - Reusable UI widgets, screens, and responsive layouts.

## 🤝 Contact

**Tammam Alhamed**
* **Role:** Full-Stack Mobile Engineer (Flutter) | Web3 & AI Automation Expert
* **Email:** alhamdtmam@gmail.com
* **Location:** Syria
