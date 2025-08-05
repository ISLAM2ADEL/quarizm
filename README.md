# quarizm

Flutter Application For reservation a doctor for Code Quests:

[Code Quests Link](https://app.code-quests.com/quest-view/41)

## Setup Instructions

You can cownload quarizm application through this link:
[Quarizm applicaation link](https://drive.google.com/file/d/10WkwWG9B0Gs9qkDyQCP9WrddLLDP-biN/view?usp=drive_link)

Installation steps:

1) Download Application

<img src="https://github.com/user-attachments/assets/030d5772-6b48-44ee-8759-21b4337e25eb" width="350" height="auto" />

2) Install Application (Allow installation from unknown sources)

<img src="https://github.com/user-attachments/assets/a9f66b65-fdb8-4183-b3ef-df9319154c30" width="350" height="auto" />


## App Architecture with Cubit

This app follows the **Cubit (a simpler form of BLoC)** architecture for state management.

### Key Components:
- **Cubit:** Manages the app's state and handles business logic by emitting new states in response to actions.
- **View:** The Flutter UI listens to changes in the Cubit state and rebuilds the necessary widgets.
- **State:** The data that the UI listens to and displays to the user.

### Flow:
1. The UI interacts with the Cubit to trigger actions (like fetching data).
2. The Cubit processes the action and emits a new state.
3. The UI listens for the state changes and updates the screen accordingly.

## Business Understanding answers

### Question 1: **Business Requirements Understanding**
1. The Application needs to make an easy **authentication and access app quickly.**
2. The Application needs to **fetch data added to firebase** (categories, doctors " with all specialists like: surgeon or dermatologist ").
3. User can search for **doctors or categories** by name or sorting them.
4. User can book an appointment for any doctor if there is a **free time slots** appears.
5. User can delete or schedule **upcoming appointments only.**

### Question 2: **User Experience Thought Process**
- **Make an aoutomatic reminder** or **Make a pre-booking feature**
1. The automatic reminder helps users to remember thier appointments
2. The pre-booking feature allows user to automatically book upcoming appointments with the same doctor.

## Known Limitations
1. **No notifications:** send notification, If doctor will cancel his appointments for the day or will be late.
2. **No Offline Usage:** users can't access their upcoming appointments without internet


## video walkthrough of your app

Watch the video on youtube through [this link:](https://youtu.be/XF2G1nmK_cU)

## Application screenshots

### 1. **Onboarding Screens**
<img src="https://github.com/user-attachments/assets/66733faa-297d-40d4-8575-bba8327fdb13" width="300" height="auto" />
<img src="https://github.com/user-attachments/assets/b74ace7a-5220-4e71-b6f8-be8c647348d1" width="300" height="auto" />
<img src="https://github.com/user-attachments/assets/c1294f92-1dcf-4d79-8103-99a7ba0ff2ee" width="300" height="auto" />

### 2. **Authentication Screens**
<img src="https://github.com/user-attachments/assets/4e3ebda5-d954-4c28-aa90-0a02f0684a31" width="300" height="auto" />
<img src="https://github.com/user-attachments/assets/0b2f0979-49a8-4d3b-b3c2-72cdec137678" width="300" height="auto" />
<img src="https://github.com/user-attachments/assets/4a219d53-4c79-4656-ada7-d9e9c5ef8eed" width="300" height="auto" />

### 3. **Home Screen**
<img src="https://github.com/user-attachments/assets/037d2246-4644-426c-987a-138f8f9796cc" width="300" height="auto" />

### 3.1. **Category Section**
<img src="https://github.com/user-attachments/assets/6f8d031a-2578-4063-941e-305f67136df0" width="300" height="auto" />

### 3.2. **Doctor Section**
<img src="https://github.com/user-attachments/assets/bffa61ed-2357-4a42-bbf6-ad16615cfb35" width="300" height="auto" />

### 4. **Doctor Page**
<img src="https://github.com/user-attachments/assets/80f64948-f367-47c1-8314-c17652e954f3" width="300" height="auto" />

### 5. **Favorite Doctors Page**
<img src="https://github.com/user-attachments/assets/332aa57c-27a7-48dc-8dd9-e2bdb038b240" width="300" height="auto" />

### 6. **Book Appointment**
<img src="https://github.com/user-attachments/assets/6377e36f-0696-4ac6-8837-dccba3c6ce10" width="300" height="auto" />

### 7. **Show Appointments (past, upcoming) and Cancel or Schedule Appointments**
<img src="https://github.com/user-attachments/assets/01a2cc14-030a-45ce-bc25-42ea795a0317" width="300" height="auto" />

## Firebase screenshots

### 1. **Authentication**
<img src="https://github.com/user-attachments/assets/1ff63495-1954-40da-818f-567d81c877ff" width="auto" height="350" />

### 2. **User Favorite Doctors**
<img src="https://github.com/user-attachments/assets/c465e1b8-46d7-412f-b451-f48ba23e3475" width="auto" height="350" />

### 3. **Doctors**
<img src="https://github.com/user-attachments/assets/4b884ffe-248f-41cf-86d9-0aef2d5b6c26" width="auto" height="350" />

### 4. **Categories**
<img src="https://github.com/user-attachments/assets/ad230652-cded-4598-9135-18c67a597150" width="auto" height="350" />

### 5. **User Appointments**
<img src="https://github.com/user-attachments/assets/4b91ba4a-d908-4053-a167-89d0072d729b" width="auto" height="350" />
<img src="https://github.com/user-attachments/assets/97638236-f1f5-4f6b-8f61-b67b457d3631" width="auto" height="350" />
