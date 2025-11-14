<x-admin::layouts>
    <x-slot:title>
        {{ $title ?? 'NDIS Feature' }}
    </x-slot>

    <div class="flex flex-col gap-4">
        <div class="flex items-center justify-between rounded-lg border border-gray-200 bg-white px-4 py-2 dark:border-gray-800 dark:bg-gray-900">
            <div class="flex flex-col gap-2">
                <div class="flex items-center gap-2">
                    <span class="text-xl font-bold text-gray-800 dark:text-white">
                        {{ $title ?? 'NDIS Feature' }}
                    </span>
                </div>
            </div>
        </div>

        <div class="flex flex-col gap-4 rounded-lg border border-gray-200 bg-white p-8 dark:border-gray-800 dark:bg-gray-900">
            <div class="flex flex-col items-center justify-center gap-4 py-12">
                <div class="text-center">
                    <svg class="mx-auto h-24 w-24 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M19.5 14.25v-2.625a3.375 3.375 0 00-3.375-3.375h-1.5A1.125 1.125 0 0113.5 7.125v-1.5a3.375 3.375 0 00-3.375-3.375H8.25m0 12.75h7.5m-7.5 3H12M10.5 2.25H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 00-9-9z" />
                    </svg>
                    <h3 class="mt-4 text-2xl font-semibold text-gray-800 dark:text-white">
                        Coming Soon
                    </h3>
                    <p class="mt-2 text-gray-600 dark:text-gray-400">
                        This feature is currently under development and will be available soon.
                    </p>
                </div>

                <div class="mt-6 flex flex-col gap-3 rounded-lg bg-blue-50 p-6 dark:bg-gray-800">
                    <div class="flex items-start gap-3">
                        <svg class="h-6 w-6 flex-shrink-0 text-blue-600 dark:text-blue-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                        <div>
                            <h4 class="font-semibold text-gray-800 dark:text-white">Feature Information</h4>
                            <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">
                                The <strong>{{ $title }}</strong> module is being developed as part of the NDIS Support Coordination system.
                                This will include full functionality for managing NDIS participants, plans, service requests, and more.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="mt-4">
                    <a href="{{ route('admin.dashboard.index') }}" class="inline-flex items-center gap-2 rounded-lg bg-blue-600 px-4 py-2 text-white hover:bg-blue-700">
                        <svg class="h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                        </svg>
                        Back to Dashboard
                    </a>
                </div>
            </div>
        </div>
    </div>
</x-admin::layouts>
