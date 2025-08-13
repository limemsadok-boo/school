@php
    $imageUrl = $record->image ? Storage::url($record->image) : null;
@endphp

@if ($imageUrl)
    <div x-data="{ open: false }" class="flex justify-center">
        <img
            src="{{ $imageUrl }}"
            alt="Image"
            class="w-10 h-10 rounded-full cursor-pointer"
            @click="open = true"
        />

        <!-- Modal -->
        <div
            x-show="open"
            x-transition
            @click.outside="open = false"
            class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50"
        >
            <div class="relative bg-white rounded-lg p-4 max-w-lg w-full">
                
                <!-- Close Icon (Top Right) -->
                <button
                    class="absolute top-2 right-2 text-gray-500 hover:text-gray-700 text-2xl leading-none"
                    @click="open = false"
                    aria-label="Close"
                >
                    &times;
                </button>

                <img src="{{ $imageUrl }}" alt="Large Image" class="w-full h-auto rounded" />

                <!-- Optional: Keep the bottom "Close" button too -->
                <button
                    class="mt-4 px-4 py-2 bg-gray-800 text-white rounded hover:bg-gray-700"
                    @click="open = false"
                >
                    Close
                </button>
            </div>
        </div>
    </div>
@endif
