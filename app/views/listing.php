<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8" x-show="currentView === 'home'">
    <template x-for="listing in listings" :key="listing.id">
        <div class="bg-white rounded-lg shadow-md overflow-hidden">
            <img src="https://via.placeholder.com/300" :alt="listing.title" class="w-full h-48 object-cover">
            <div class="p-4">
                <h3 class="text-lg font-semibold" x-text="listing.title"></h3>
                <p class="text-gray-600" x-text="listing.location"></p>
                <div class="flex items-center mt-2">
                    <span class="text-yellow-500" x-html="'★'.repeat(Math.round(listing.rating_avg))"></span>
                    <span class="ml-2 text-gray-600" x-text="listing.rating_avg"></span>
                </div>
            </div>
        </div>
    </template>
</div>
