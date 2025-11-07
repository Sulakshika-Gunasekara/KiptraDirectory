function appState() {
    return {
        listings: [],
        categories: [],
        currentView: 'home',

        init() {
            this.loadListings();
            this.loadCategories();
        },

        loadListings() {
            fetch('/api/listings')
                .then(response => response.json())
                .then(data => {
                    this.listings = data;
                });
        },

        loadCategories() {
            fetch('/api/categories')
                .then(response => response.json())
                .then(data => {
                    this.categories = data;
                });
        },

        loadContent(view) {
            this.currentView = view;
        }
    }
}

// Initialize the app
document.addEventListener('alpine:init', () => {
    Alpine.data('appState', appState);
});
