function appState() {
    return {
        view: 'home', // home, subcategory, listing, hotel
        categories: [],
        subCategories: [],
        listings: [],
        selectedCategory: null,
        selectedListing: null,
        reviews: [],
        searchQuery: '',
        filteredListings: [],

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

        loadSubCategories(category) {
            this.selectedCategory = category;
            fetch(`/api/categories?parent_id=${category.id}`)
                .then(response => response.json())
                .then(data => {
                    if (data.length > 0) {
                        this.subCategories = data;
                        this.view = 'subcategory';
                    } else {
                        this.loadListings(category.id);
                    }
                });
        },

        loadListings(categoryId) {
            fetch(`/api/listings?category_id=${categoryId}`)
                .then(response => response.json())
                .then(data => {
                    this.listings = data;
                    this.filteredListings = data;
                    this.view = 'listing';
                });
        },

        filterListings() {
            if (this.searchQuery.trim() === '') {
                this.filteredListings = this.listings;
                return;
            }
            this.filteredListings = this.listings.filter(listing =>
                listing.title.toLowerCase().includes(this.searchQuery.toLowerCase())
            );
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
        },

        search() {
            if (this.searchQuery.trim() === '') return;
            fetch(`/api/listings/search?q=${this.searchQuery}`)
                .then(response => response.json())
                .then(data => {
                    this.listings = data;
                    this.view = 'listing';
                });
        }
    }
}

document.addEventListener('alpine:init', () => {
    Alpine.data('appState', appState)
})
