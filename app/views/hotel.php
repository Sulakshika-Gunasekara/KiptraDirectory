<div class="container mx-auto px-4 py-8">
    <header class="flex items-center mb-8">
        <button @click="view = 'listing'" class="mr-4">
            <i class="fas fa-arrow-left text-2xl"></i>
        </button>
        <h2 class="text-2xl font-bold" x-text="selectedListing?.title"></h2>
    </header>

    <main>
        <div class="bg-white p-4 rounded-lg shadow-md">
            <img :src="selectedListing?.image_url" :alt="selectedListing?.title" class="w-full h-48 object-cover rounded-lg mb-4">
            <div class="flex items-center mb-4">
                <span class="text-yellow-500" x-html="'★'.repeat(Math.round(selectedListing?.rating_avg))"></span>
                <span class="ml-2 text-gray-600 text-sm" x-text="selectedListing?.rating_avg"></span>
            </div>
            <p class="text-gray-600 mb-4" x-text="selectedListing?.description"></p>
            <div class="flex justify-around py-4 border-t border-b">
                <button class="text-blue-500"><i class="fas fa-phone-alt text-2xl"></i></button>
                <a :href="'https://www.google.com/maps/search/?api=1&query=' + encodeURIComponent(selectedListing?.location)" target="_blank" class="text-blue-500"><i class="fas fa-map-marker-alt text-2xl"></i></a>
                <a :href="selectedListing?.website" target="_blank" class="text-blue-500" :class="{ 'hidden': !selectedListing?.website }"><i class="fas fa-globe text-2xl"></i></a>
            </div>
        </div>

        <div class="mt-8">
            <h3 class="text-xl font-semibold mb-4">Reviews</h3>
            <div class="space-y-4">
                <template x-for="review in reviews" :key="review.id">
                    <div class="bg-white p-4 rounded-lg shadow-md">
                        <div class="flex items-center mb-2">
                            <img src="https://via.placeholder.com/40" alt="Reviewer" class="w-10 h-10 rounded-full mr-4">
                            <div>
                                <h4 class="font-semibold" x-text="review.reviewer_name"></h4>
                                <div class="text-yellow-500" x-html="'★'.repeat(review.rating)"></div>
                            </div>
                        </div>
                        <p class="text-gray-600" x-text="review.comment"></p>
                    </div>
                </template>
            </div>
        </div>
    </main>
</div>
