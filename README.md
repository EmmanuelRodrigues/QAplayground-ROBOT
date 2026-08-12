## QAplayground - Robot Framework Test Automation

Automated testing project developed with Robot Framework for practicing purpose of web UI automation, functional testing, negative testing, and access control validation using the [QAplayground](https://qaplayground.com/) banking application.

This project is part of my QA automation portfolio and focuses on creating maintainable, readable, and reusable automated tests following good test automation practices.

---

### Technologies:

* **Robot Framework**
* **Python**
* **SeleniumLibrary**
* **Selenium WebDriver**
* **RobotCode**
* **Git & GitHub**

---

### Testing Scope

The project currently covers scenarios related to:

**Authentication**
* Login with valid credentials
* Login with invalid credentials
* Login with empty fields
* Validation of required fields
* Password visibility behavior
* Authentication error messages

**Access Control**
* Validation of authenticated user access
* Validation of unauthorized access
* Attempt to access administrative functionality using a standard user
* IDOR/access control scenarios

**Functional Validation**
* UI element visibility
* Button states
* Form validation
* Navigation
* Error message validation
* Positive and negative scenarios

---

### Project Structure

```text
QAplayground-ROBOT/
│
├── tests/
│   ├── login/
│   │   └── login.robot
│   │
│   └── access_control/
│       └── access_control.robot
│
├── pages/
│   ├── login_page.robot
│   └── ...
│
├── resources/
│   ├── variables.robot
│   ├── common.robot
│   └── ...
│
├── results/
│   ├── output.xml
│   ├── log.html
│   └── report.html
│
├── .vscode/
│   └── settings.json
│
├── .gitignore
├── robot.toml
├── main.robot
└── README.md
```
---

### Automation Architecture

The project follows a modular approach inspired by the Page Object Model (POM).

The main responsibilities are separated into different layers:

**Tests**

Contains the test cases and scenarios that validate the application's behavior.

**Pages**

Contains page-specific locators and interactions.

**Resources**

Contains reusable variables and common keywords shared between different tests.

**Main Resource**

The `main.robot` file works as a central resource, importing the required page objects and reusable resources used throughout the test suite.

This approach helps reduce duplication and makes the test suite easier to maintain.

---

### Running the Tests

**1. Clone the repository**

```bash
git clone https://github.com/YOUR-USERNAME/QAplayground-ROBOT.git
```

Navigate to the project directory:

```bash
cd QAplayground-ROBOT
```

---

**2. Create a virtual environment**

```bash
python -m venv .venv
```

Activate it on Windows:

```powershell
.\.venv\Scripts\Activate.ps1
```

---

**3. Install dependencies**

Install Robot Framework and the required libraries:

```bash
pip install robotframework
pip install robotframework-seleniumlibrary
pip install selenium
```

If RoboCop is used for code quality:

```bash
pip install robotframework-robocop
```

---

**4. Run the test suite**

```bash
robot .
```

Alternatively, tests can be executed using RobotCode from VSCode.

---

### Test Reports

After executing the tests, Robot Framework generates the following reports which can be used by the whole team to look for further improvements:

```text
results/
├── output.xml
├── log.html
└── report.html
```

**Report:** Overview of the test execution.

**Log:** Detailed information about each test step, keyword, variable, and assertion.

**Output:** Contains the XML execution results.

---

### Project Goals
The main objectives of this project are:

* Practice UI test automation with Robot Framework
* Develop reusable automation keywords
* Apply Page Object Model concepts
* Create positive and negative test scenarios
* Practice authentication and authorization testing
* Explore access control and IDOR vulnerabilities
* Improve test organization and maintainability
* Practice Git and GitHub workflows
* Build a professional QA automation portfolio


### 👨‍💻 Author
**Emmanuel Rodrigues**

QA Engineer | Software Testing | Test Automation


Feel free to reach out for collaborations or feedback: [LinkedIn](https://www.linkedin.com/in/emmanuelgerodrigues).

---

### Disclaimer
I'm still working on this project. This project is intended for educational and portfolio purposes.
