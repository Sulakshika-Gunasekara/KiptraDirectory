# Kiptra API Postman Guide

This guide will walk you through running the Kiptra application locally and testing the API endpoints with Postman.

## Step 1: Run the Application Locally

1.  **Set up your MySQL database:**
    *   Follow the instructions in `DEPLOY_GUIDE.md` to create a MySQL database and user.
    *   Import the `database/schema.sql` and `database/seed.sql` files into your database.

2.  **Configure the application:**
    *   Open the `config/database.php` file and update the database credentials with your local database information.

3.  **Start the PHP development server:**
    *   Open a terminal in the root directory of the project.
    *   Run the following command:
        ```bash
        php -S localhost:8080 -t public router.php
        ```
    *   This will start the server at `http://localhost:8080`.

## Step 2: Test the API with Postman

The base URL for the API is `http://localhost:8080/api`.

### Endpoints

Here are the available API endpoints:

#### Listings

*   **Get all listings:**
    *   **Method:** `GET`
    *   **URL:** `http://localhost:8080/api/listings`

*   **Get a single listing:**
    *   **Method:** `GET`
    *   **URL:** `http://localhost:8080/api/listings/{id}`
    *   Replace `{id}` with the ID of the listing you want to retrieve.

*   **Search for listings:**
    *   **Method:** `GET`
    *   **URL:** `http://localhost:8080/api/listings/search?q={query}`
    *   Replace `{query}` with your search term.

#### Categories

*   **Get all top-level categories:**
    *   **Method:** `GET`
    *   **URL:** `http://localhost:8080/api/categories`

*   **Get sub-categories for a parent category:**
    *   **Method:** `GET`
    *   **URL:** `http://localhost:8080/api/categories?parent_id={id}`
    *   Replace `{id}` with the ID of the parent category.

#### Reviews

*   **Get reviews for a listing:**
    *   **Method:** `GET`
    *   **URL:** `http://localhost:8080/api/reviews?listing_id={id}`
    *   Replace `{id}` with the ID of the listing.

*   **Create a new review:**
    *   **Method:** `POST`
    *   **URL:** `http://localhost:8080/api/reviews`
    *   **Body (JSON):**
        ```json
        {
          "listing_id": 1,
          "user_id": 3,
          "rating": 5,
          "comment": "This is a great place!"
        }
        ```

#### Users

*   **Get a single user:**
    *   **Method:** `GET`
    *   **URL:** `http://localhost:8080/api/users/{id}`
    *   Replace `{id}` with the ID of the user.
