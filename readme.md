# Example Middle School Database

## Description

This project is a simple database system designed for managing information related to a middle school. It allows users to store and retrieve data about students, teachers, classes, and grades, enabling more efficient management of school operations. The system also includes a **Streamlit GUI** for easy interaction with the database, allowing users to perform CRUD (Create, Read, Update, Delete) operations via a web interface.

## Features

- **Student Management**: Add, update, and delete student records.
- **Faculty Management**: Manage Faculty information.
- **Enrollment Management**: Organize enrollments with details on rooms and teachers.
- **Streamlit GUI**: A web-based interface that simplifies interaction with the database, making it user-friendly and intuitive.

---

## Getting Started

### Prerequisites

To run this project, you'll need the following software and tools installed:

- **MySQL Workbench**: A visual tool for database design, querying, and management. [Download MySQL Workbench](https://dev.mysql.com/downloads/file/?id=536355)
- **Python**: A programming language for running the backend logic of the application.
- **Python Libraries**: The necessary Python libraries are listed in `requirements.txt` and can be installed via pip.
- **Streamlit**: The GUI framework used to create the web-based interface.

### Installing

#### 1. Install MySQL and MySQL Workbench
   - Download and install MySQL from the official website.
   - Ensure that you have MySQL Workbench for managing your databases and running queries.

#### 2. Install Python and Required Libraries
   - Install Python on your system if you haven’t already.
   - Install the necessary Python packages by running the following command:
     ```
     pip install -r requirements.txt
     ```

   This will install all the dependencies needed to run the project, including Streamlit.

---

## Executing the Program

Once you have everything set up, follow these steps to run the application:

1. **Start MySQL Server**: Make sure your MySQL server is running, and you have access to the database.
   
2. **Run the Python Application**:
   In your terminal, navigate to the directory where `main.py` is located, and execute the following command:
   ```
   streamlit run main.py
   ```
   There you will be able to add, delete, modify and view: Student, Faculty, Enrollments tables.

## Bugs:

1. Currently viewing does not work properly.
2. Columns are displaying a extra index

## Contributing

The DB project was developed by:

- **Christian Williams**

Feel free to provide feedback or suggest improvements. Contributions are welcome!
