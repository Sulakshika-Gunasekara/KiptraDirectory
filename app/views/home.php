<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kiptra Sri Lanka</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="bg-gray-100">
    <div x-data="appState()" x-init="init()">
        <!-- Home Page -->
        <template x-if="view === 'home'">
            <div class="container mx-auto px-4 py-8">
                <header class="text-center mb-8">
                    <h1 class="text-3xl font-bold">Kiptra Sri Lanka</h1>
                    <p class="text-gray-600">Your Ultimate Travel Directory</p>
                </header>

                <main>
                    <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4">
                        <template x-for="category in categories" :key="category.id">
                            <a href="#" @click.prevent="loadListings(category.id)" class="bg-white p-4 rounded-lg shadow-md flex flex-col items-center justify-center text-center">
                                <i :class="category.icon" class="text-4xl text-blue-500 mb-2"></i>
                                <span class="font-semibold" x-text="category.name"></span>
                            </a>
                        </template>
                    </div>
                </main>
            </div>
        </template>

        <!-- Listing Page -->
        <template x-if="view === 'listing'">
            <?php include 'listing.php'; ?>
        </template>

        <!-- Hotel Page -->
        <template x-if="view === 'hotel'">
            <?php include 'hotel.php'; ?>
        </template>

        <!-- Bottom Navigation -->
        <nav class="bg-white shadow-t sticky bottom-0 z-10">
            <div class="container mx-auto px-4 py-2">
                <div class="flex justify-around">
                    <a href="#" @click.prevent="view = 'home'" class="text-gray-600 hover:text-gray-900">
                        <i class="fas fa-home text-2xl"></i>
                        <span class="text-xs">Home</span>
                    </a>
                    <a href="#" @click.prevent="loadContent('categories')" class="text-gray-600 hover:text-gray-900">
                        <i class="fas fa-th-large text-2xl"></i>
                        <span class="text-xs">Categories</span>
                    </a>
                    <a href="#" class="text-gray-600 hover:text-gray-900">
                        <i class="fas fa-map-marker-alt text-2xl"></i>
                        <span class="text-xs">Map</span>
                    </a>
                    <a href="#" class="text-gray-600 hover:text-gray-900">
                        <i class="fas fa-search text-2xl"></i>
                        <span class="text-xs">Search</span>
                    </a>
                    <a href="#" class="text-gray-600 hover:text-gray-900">
                        <i class="fas fa-user-circle text-2xl"></i>
                        <span class="text-xs">Profile</span>
                    </a>
                </div>
            </div>
        </nav>
    </div>

    <script src="js/script.js"></script>
</body>
</html>
