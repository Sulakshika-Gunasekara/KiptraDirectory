function appState() {
    return {
        view: 'home', // home, listing, hotel
        categories: [],
        listings: [],
        selectedListing: null,
        reviews: [],

        init() {
            this.fetchCategories();
        },

        fetchCategories() {
            fetch('/api/categories')
                .then(response => response.json())
                .then(data => {
                    this.categories = data;
                });
        },

        loadListings(categoryId) {
            fetch(`/api/listings?category_id=${categoryId}`)
                .then(response => response.json())
                .then(data => {
                    this.listings = data;
                    this.view = 'listing';
                });
        },

        loadHotel(listingId) {
            fetch(`/api/listings/${listingId}`)
                .then(response => response.json())
                .then(data => {
                    this.selectedListing = data;
                    this.fetchReviews(listingId);
                    this.view = 'hotel';
                });
        },

        fetchReviews(listingId) {
            fetch(`/api/reviews?listing_id=${listingId}`)
                .then(response => response.json())
                .then(data => {
                    this.reviews = data;
                });
        }
    }
}

document.addEventListener('alpine:init', () => {
    Alpine.data('appState', appState)
})
