
<template>
    <div class="grid max-w-4xl lg:max-w-6xl grid-cols-1 mx-auto mt-8 text-center gap-y-4 sm:gap-x-8 sm:grid-cols-2 lg:grid-cols-3 sm:mt-12 lg:mt-20 sm:text-left">
        <div class="relative">
            <div class="absolute -inset-1">
                <div
                    class="w-full h-full rotate-180 opacity-30 blur-lg filter bg-gradient-to-r from-blue-400 via-blue-500 to-blue-600">
                </div>
            </div>
            <RouterLink to ="/material/verteilen">
                <div class="relative overflow-hidden bg-white shadow-md rounded-xl h-full cursor-pointer">
                    <div class="p-9">
                        <svg fill="#000000" width="48px" height="48px" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M8 4.67a2.14 2.14 0 0 0 2.19-2.09A2.14 2.14 0 0 0 8 .5a2.14 2.14 0 0 0-2.24 2.08 1.93 1.93 0 0 0 .22.9L3.3 6.16a2.19 2.19 0 0 0-1.11-.3A2.14 2.14 0 0 0 0 8a2.14 2.14 0 0 0 2.19 2 2.14 2.14 0 0 0 1-.23l2.77 2.78a2.06 2.06 0 0 0-.18.83A2.14 2.14 0 0 0 8 15.5a2.09 2.09 0 1 0 0-4.17 2.25 2.25 0 0 0-1.18.33L4.09 9a1.77 1.77 0 0 0 .15-.31h7.52A2.19 2.19 0 0 0 13.81 10 2.14 2.14 0 0 0 16 8a2.2 2.2 0 0 0-4.3-.52H4.3a1.74 1.74 0 0 0-.14-.38l2.67-2.72A2.33 2.33 0 0 0 8 4.67zm0-1.24a.89.89 0 0 0 .94-.85.89.89 0 0 0-.94-.84.89.89 0 0 0-1 .84.89.89 0 0 0 1 .85zM2.19 8.8a.9.9 0 0 0 .94-.8.9.9 0 0 0-.94-.84.9.9 0 0 0-.95.84.91.91 0 0 0 .95.8zM14.76 8a1 1 0 0 1-1.89 0 1 1 0 0 1 1.89 0zm-5.87 5.42a.89.89 0 0 1-.94.84.85.85 0 1 1 0-1.69.89.89 0 0 1 .94.85z"/>
                        </svg>
                        <h3 class="mt-6 text-2xl font-bold text-gray-900 sm:mt-10">Verteilen</h3>
                        <p class="mt-6 text-base text-gray-600">Hier wird die Vergabe generiert</p>
                    </div>
                </div>
            </RouterLink>
        </div>
        <RouterLink to ="/material/eintragen">
            <div class="overflow-hidden bg-white shadow-md rounded-xl cursor-pointer">
                <div class="p-9">
                    <svg fill="#000000" width="48px" height="48px" viewBox="0 0 16 16" id="register-16px" xmlns="http://www.w3.org/2000/svg">
                        <path id="Path_184" data-name="Path 184" d="M57.5,41a.5.5,0,0,0-.5.5V43H47V31h2v.5a.5.5,0,0,0,.5.5h5a.5.5,0,0,0,.5-.5V31h2v.5a.5.5,0,0,0,1,0v-1a.5.5,0,0,0-.5-.5H55v-.5A1.5,1.5,0,0,0,53.5,28h-3A1.5,1.5,0,0,0,49,29.5V30H46.5a.5.5,0,0,0-.5.5v13a.5.5,0,0,0,.5.5h11a.5.5,0,0,0,.5-.5v-2A.5.5,0,0,0,57.5,41ZM50,29.5a.5.5,0,0,1,.5-.5h3a.5.5,0,0,1,.5.5V31H50Zm11.854,4.646-2-2a.5.5,0,0,0-.708,0l-6,6A.5.5,0,0,0,53,38.5v2a.5.5,0,0,0,.5.5h2a.5.5,0,0,0,.354-.146l6-6A.5.5,0,0,0,61.854,34.146ZM54,40V38.707l5.5-5.5L60.793,34.5l-5.5,5.5Zm-2,.5a.5.5,0,0,1-.5.5h-2a.5.5,0,0,1,0-1h2A.5.5,0,0,1,52,40.5Zm0-3a.5.5,0,0,1-.5.5h-2a.5.5,0,0,1,0-1h2A.5.5,0,0,1,52,37.5ZM54.5,35h-5a.5.5,0,0,1,0-1h5a.5.5,0,0,1,0,1Z" transform="translate(-46 -28)"/>
                    </svg>
                    <h3 class="mt-6 text-2xl font-bold text-gray-900 sm:mt-10">Eintragen</h3>
                    <p class="mt-6 text-base text-gray-600">Hier wird eingetragen, wer was am Ende mitgenommen hat</p>
                </div>
            </div>
        </RouterLink>
       
    </div>
</template>

<script setup lang="ts">

</script>
