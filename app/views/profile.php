<div class="container mx-auto px-4 py-8">
    <header class="flex items-center mb-8">
        <button @click="view = 'home'" class="mr-4">
            <i class="fas fa-arrow-left text-2xl"></i>
        </button>
        <h2 class="text-2xl font-bold">Profile</h2>
    </header>

    <main>
        <div class="bg-white p-4 rounded-lg shadow-md">
            <div class="flex items-center mb-4">
                <i class="fas fa-user-circle text-6xl text-gray-400 mr-4"></i>
                <div>
                    <h3 class="text-xl font-semibold" x-text="user.name"></h3>
                    <p class="text-gray-600" x-text="user.email"></p>
                </div>
            </div>
            <div class="border-t pt-4">
                <p class="text-gray-700"><span class="font-semibold">Role:</span> <span x-text="user.role"></span></p>
                <p class="text-gray-700"><span class="font-semibold">Member since:</span> <span x-text="new Date(user.created_at).toLocaleDateString()"></span></p>
            </div>
        </div>
    </main>
</div>
