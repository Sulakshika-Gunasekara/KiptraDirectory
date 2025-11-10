# Kiptra cPanel Deployment Guide

This guide will walk you through deploying the Kiptra application to a cPanel hosting environment.

## Step 1: Create a MySQL Database and User

1.  **Log in to your cPanel account.**
2.  Navigate to the **MySQL® Database Wizard** under the **Databases** section.
3.  **Create a New Database:** Enter a database name (e.g., `kiptra_db`) and click **Next Step**.
4.  **Create a Database User:** Enter a username (e.g., `kiptra_user`) and a strong password. Click **Create User**.
5.  **Add User to the Database:** On the **Add user to the database** page, select the user and database you just created.
6.  **Assign Privileges:** Check the **ALL PRIVILEGES** checkbox and click **Next Step**.
7.  **Complete the task:** You should see a "Task Complete" message. Make a note of the database name, username, and password.

## Step 2: Configure the Application

1.  **Upload the application files** to your cPanel's `public_html` directory (or a subdirectory). You can do this using the cPanel File Manager or an FTP client.
2.  Open the `config/database.php` file and update the following lines with the database credentials you created in Step 1:

    ```php
    define('DB_DATABASE', 'your_database_name');
    define('DB_USERNAME', 'your_database_user');
    define('DB_PASSWORD', 'your_database_password');
    ```

    Replace `your_database_name`, `your_database_user`, and `your_database_password` with the actual values.

## Step 3: Import the Database Schema and Data

1.  **Open phpMyAdmin** from the cPanel dashboard.
2.  **Select your database** from the left-hand menu.
3.  Click the **Import** tab.
4.  **Choose the `database/schema.sql` file** from your local computer and click **Go**.
5.  After the schema is imported, click the **Import** tab again.
6.  **Choose the `database/seed.sql` file** from your local computer and click **Go**.

## Step 4: Verify the Deployment

Open your website in a browser. If everything is configured correctly, you should see the Kiptra application.

## Troubleshooting

*   **500 Internal Server Error:** This is often caused by incorrect file permissions or a syntax error in your PHP code. Check the cPanel error logs for more information.
*   **Database Connection Error:** Double-check the database credentials in `config/database.php`. Make sure the database user has the correct privileges.
*   **"File not found" errors:** Ensure that all files were uploaded correctly and that the `.htaccess` file is present.
