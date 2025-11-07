# Kiptra Sri Lanka

This is a Progressive Web App (PWA) travel directory for Sri Lanka.

## Setup

1.  **Clone the repository.**
2.  **Run the setup script.** This will create the SQLite database, set up the tables, and insert the initial data.
    ```bash
    php setup.php
    ```
3.  **Start the development server.**
    ```bash
    php -S localhost:8080 -t public router.php
    ```
4.  **Access the application** by navigating to `http://localhost:8080` in your web browser.

## API Endpoints

You can use a tool like [Postman](https://www.postman.com/) or `curl` to test the API endpoints.

### Get All Listings

*   **URL:** `http://localhost:8080/api/listings`
*   **Method:** `GET`

### Get All Categories

*   **URL:** `http://localhost:8080/api/categories`
*   **Method:** `GET`

### Get Reviews for a Listing

*   **URL:** `http://localhost:8080/api/reviews?listing_id=<LISTING_ID>`
*   **Method:** `GET`

### Create a New Review

*   **URL:** `http://localhost:8080/api/reviews`
*   **Method:** `POST`
*   **Body:**
    ```json
    {
        "listing_id": 1,
        "user_id": 2,
        "rating": 5,
        "comment": "This is a great place!"
    }
    ```
