<div class="container mx-auto px-4 py-8">
    <header class="flex items-center mb-8">
        <button @click="view = 'home'" class="mr-4">
            <i class="fas fa-arrow-left text-2xl"></i>
        </button>
        <h2 class="text-2xl font-bold" x-text="categories.find(c => c.id === listings[0]?.category_id)?.name || 'Listings'"></h2>
    </header>

    <div class="mb-8">
        <input type="text" placeholder="Search here..." class="w-full px-4 py-2 border rounded-full">
    </div>

    <div class="flex space-x-4 mb-8 overflow-x-auto">
        <template x-for="subcategory in ['Hotels', 'Hostels', 'Eco Lodges']" :key="subcategory">
            <button class="bg-gray-200 px-4 py-2 rounded-full" x-text="subcategory"></button>
        </template>
    </div>

    <main>
        <h3 class="text-xl font-semibold mb-4">Recommended</h3>
        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <template x-for="listing in listings" :key="listing.id">
                <a href="#" @click.prevent="loadHotel(listing.id)" class="bg-white p-4 rounded-lg shadow-md">
                    <img :src="listing.image_url" :alt="listing.title" class="w-full h-32 object-cover rounded-lg mb-4">
                    <h4 class="font-semibold" x-text="listing.title"></h4>
                    <div class="flex items-center">
                        <span class="text-yellow-500" x-html="'★'.repeat(Math.round(listing.rating_avg))"></span>
                        <span class="ml-2 text-gray-600 text-sm" x-text="listing.rating_avg"></span>
                    </div>
                </a>
            </template>
        </div>
    </main>
</div>
