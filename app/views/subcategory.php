<div class="container mx-auto px-4 py-8">
    <header class="text-center mb-8">
        <h1 class="text-3xl font-bold" x-text="selectedCategory.name"></h1>
        <p class="text-gray-600">Choose a sub-category</p>
    </header>

    <main>
        <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4">
            <template x-for="category in subCategories" :key="category.id">
                <a href="#" @click.prevent="loadListings(category.id)" class="bg-white p-4 rounded-lg shadow-md flex flex-col items-center justify-center text-center">
                    <span class="font-semibold" x-text="category.name"></span>
                </a>
            </template>
        </div>
    </main>
</div>
