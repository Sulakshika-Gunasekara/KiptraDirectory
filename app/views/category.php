<div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4" x-show="currentView === 'categories'">
    <template x-for="category in categories" :key="category.id">
        <div class="bg-white rounded-lg shadow-md p-4 text-center">
            <i :class="`fas fa-${category.icon} fa-2x text-gray-600`"></i>
            <h3 class="mt-2 text-lg font-semibold" x-text="category.name"></h3>
        </div>
    </template>
</div>
