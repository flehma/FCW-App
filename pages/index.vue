<template>
    <div class="grid max-w-4xl lg:max-w-6xl grid-cols-1 mx-auto mt-8 text-center gap-y-4 sm:gap-x-8 sm:grid-cols-2 lg:grid-cols-3 sm:mt-12 lg:mt-20 sm:text-left">
            <div class="relative">
                <div class="absolute -inset-1">
                    <div
                        class="w-full h-full rotate-180 opacity-30 blur-lg filter bg-gradient-to-r from-blue-400 via-blue-500 to-blue-600">
                    </div>
                </div>
                <RouterLink to ="/kader">
                    <div class="relative overflow-hidden bg-white shadow-md rounded-xl h-full cursor-pointer">
                        <div class="p-9">
                            <svg fill="#000000" width="48px" height="48px" viewBox="0 0 16 16" id="group-16px" xmlns="http://www.w3.org/2000/svg">
                                <path id="Path_98" data-name="Path 98" d="M-21,2a2,2,0,0,0-2-2,2,2,0,0,0-2,2,2,2,0,0,0,2,2A2,2,0,0,0-21,2Zm-2,1a1,1,0,0,1-1-1,1,1,0,0,1,1-1,1,1,0,0,1,1,1A1,1,0,0,1-23,3Zm10-1a2,2,0,0,0-2-2,2,2,0,0,0-2,2,2,2,0,0,0,2,2A2,2,0,0,0-13,2Zm-2,1a1,1,0,0,1-1-1,1,1,0,0,1,1-1,1,1,0,0,1,1,1A1,1,0,0,1-15,3Zm1.5,1h-3a2.493,2.493,0,0,0-2.027,1.048A2.95,2.95,0,0,0-19,5a2.95,2.95,0,0,0-.473.048A2.493,2.493,0,0,0-21.5,4h-3A2.5,2.5,0,0,0-27,6.5,1.5,1.5,0,0,0-25.5,8H-22a3,3,0,0,0,3,3,3,3,0,0,0,3-3h3.5A1.5,1.5,0,0,0-11,6.5,2.5,2.5,0,0,0-13.5,4ZM-17,8a2,2,0,0,1-2,2,2,2,0,0,1-2-2,2,2,0,0,1,2-2A2,2,0,0,1-17,8Zm-8.5-1a.5.5,0,0,1-.5-.5A1.5,1.5,0,0,1-24.5,5h3a1.491,1.491,0,0,1,1.02.406A3,3,0,0,0-21.816,7Zm13,0h-3.684A3,3,0,0,0-17.52,5.406,1.491,1.491,0,0,1-16.5,5h3A1.5,1.5,0,0,1-12,6.5.5.5,0,0,1-12.5,7ZM-25,14.5A1.5,1.5,0,0,0-23.5,16h9A1.5,1.5,0,0,0-13,14.5,3.5,3.5,0,0,0-16.5,11h-5A3.5,3.5,0,0,0-25,14.5Zm8.5-2.5A2.5,2.5,0,0,1-14,14.5a.5.5,0,0,1-.5.5h-9a.5.5,0,0,1-.5-.5A2.5,2.5,0,0,1-21.5,12Z" transform="translate(27)"/>
                            </svg>
                            <h3 class="mt-6 text-2xl font-bold text-gray-900 sm:mt-10">Kader</h3>
                            <p class="mt-6 text-base text-gray-600">Hier kann der Kader verwaltet werden, sowie Spieler zum Training und zu Spielen hinzugefügt werden.</p>
                        </div>
                    </div>
                </RouterLink>
            </div>
            <div @click="clear" class="overflow-hidden bg-white shadow-md rounded-xl cursor-pointer">
                <div class="p-9">
                    <svg width="48px" height="48px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M19 9H22M19 14H22M19 19H21M16 6L15.1991 18.0129C15.129 19.065 15.0939 19.5911 14.8667 19.99C14.6666 20.3412 14.3648 20.6235 14.0011 20.7998C13.588 21 13.0607 21 12.0062 21H7.99377C6.93927 21 6.41202 21 5.99889 20.7998C5.63517 20.6235 5.33339 20.3412 5.13332 19.99C4.90607 19.5911 4.871 19.065 4.80086 18.0129L4 6M2 6H18M14 6L13.7294 5.18807C13.4671 4.40125 13.3359 4.00784 13.0927 3.71698C12.8779 3.46013 12.6021 3.26132 12.2905 3.13878C11.9376 3 11.523 3 10.6936 3H9.30643C8.47705 3 8.06236 3 7.70951 3.13878C7.39792 3.26132 7.12208 3.46013 6.90729 3.71698C6.66405 4.00784 6.53292 4.40125 6.27064 5.18807L6 6M12 10V17M8 10L7.99995 16.9998" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                    <h3 class="mt-6 text-2xl font-bold text-gray-900 sm:mt-10">Aufräumen</h3>
                    <p class="mt-6 text-base text-gray-600">Hier können die Spieler für den Spieltag, sowie das Training entfernt werden.</p>
                </div>
            </div>
            <div class="relative">
                <div class="absolute -inset-1">
                    <div
                        class="w-full h-full rotate-180 opacity-30 blur-lg filter bg-gradient-to-r from-blue-400 via-blue-500 to-blue-600">
                    </div>
                </div>
                <RouterLink to="/tunnel">
                    <div class="relative overflow-hidden bg-white shadow-md rounded-xl h-full cursor-pointer">
                        <div class="p-9"><svg fill="#000000" height="48px" width="48px" version="1.2" baseProfile="tiny" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                            viewBox="-63 65 128 128" xml:space="preserve">
                            <path d="M-14.2,148v-19.3c0-7.8,6.4-14.2,14.2-14.2s14.2,6.4,14.2,14.2V148H-14.2z M1,83.8c20.6,0,37.4,16.7,37.4,37.4v48.2H49
                                v-48.2c0-26.5-21.5-48-48-48s-48,21.5-48,48v48.2h10.6v-48.2C-36.4,100.5-19.6,83.8,1,83.8 M2.9,152.1h-5.8l-0.7,4.1h7.2L2.9,152.1z
                                M4.6,162.4h-9.3l-1.1,6.1H5.7L4.6,162.4z M7.1,176.7H-7.2l-1.3,8.1h17L7.1,176.7z"/>
                        </svg>
                            <h3 class="mt-6 text-2xl font-bold text-gray-900 sm:mt-10">Tunnel</h3>
                            <p class="mt-6 text-base text-gray-600">Hier können die Tunnel aus den Eckspielen vor Trainings- und Spielbeginn eingetragen werden.</p>
                        </div>
                    </div>
                </RouterLink>
            </div>
            <div class="overflow-hidden bg-white shadow-md rounded-xl cursor-pointer">
                <div class="p-9">
                    <svg width="48px" height="48px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M12 8L15.8043 10.7639M12 8L8.1958 10.7639M12 8V5M15.8043 10.7639L14.3512 15.2361M15.8043 10.7639L18.5 9.5M14.3512 15.2361H9.64889M14.3512 15.2361L16 17.5M9.64889 15.2361L8.1958 10.7639M9.64889 15.2361L8 17.5M8.1958 10.7639L5.5 9.5M5.5 9.5L2.04938 13M5.5 9.5L4.5 5.38544M18.5 9.5L21.9506 13M18.5 9.5L19.5 5.38544M12 5L8.62434 2.58409M12 5L15.3757 2.58409M8 17.5L3.33782 17M8 17.5L10.5 21.8883M16 17.5L20.6622 17M16 17.5L13.5 21.8883M22 12C22 17.5228 17.5228 22 12 22C6.47715 22 2 17.5228 2 12C2 6.47715 6.47715 2 12 2C17.5228 2 22 6.47715 22 12Z" stroke="#000000" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                    <h3 class="mt-6 text-2xl font-bold text-gray-900 sm:mt-10">Material</h3>
                    <p class="mt-6 text-base text-gray-600">Hier wird das Material unter den Spielern verteilt.</p>
                </div>
            </div>
            <div class="relative">
                <div class="absolute -inset-1">
                    <div
                        class="w-full h-full rotate-180 opacity-30 blur-lg filter bg-gradient-to-r from-blue-400 via-blue-500 to-blue-600">
                    </div>
                </div>
                <div class="relative overflow-hidden bg-white shadow-md rounded-xl h-full cursor-pointer">
                    <div class="p-9">
                        <svg width="48px" height="48px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M6.95241 3.99892C4.9031 3.90133 4.09035 4.0041 3.44432 4.65013C3.24959 4.84486 3.11126 5.17553 3.04045 5.62668C2.98102 6.00527 2.98343 6.35666 2.98538 6.64134C2.98572 6.68996 2.98604 6.73664 2.98603 6.78117C2.98601 7.05512 2.99749 7.43367 3.11176 7.72577C3.16322 7.85732 3.21547 7.91597 3.24771 7.94126C3.26667 7.95613 3.32582 8.00003 3.5 8.00003C3.62915 8.00003 3.67423 7.96554 3.70281 7.94013C3.75203 7.89638 3.81703 7.80657 3.87615 7.64893C3.93371 7.49544 3.96687 7.32768 3.98426 7.18851C3.99264 7.12153 3.99662 7.06721 3.99848 7.03249C3.9994 7.01527 3.99978 7.00331 3.99992 6.99752L3.99998 6.99867L3.99998 6.99746L3.99992 6.99752L3.99999 6.99436C4.00305 6.44469 4.44959 6.00005 4.99998 6.00005H16.1496C16.1678 5.6982 16.1364 5.50892 16.1055 5.44726C15.9777 5.19156 15.8767 5.0923 15.4855 4.85754C15.0709 4.60876 14.7407 4.5947 14.2492 4.67599C14.1373 4.69449 13.9993 4.72355 13.8411 4.75685C13.3575 4.85866 12.686 5.00005 12 5.00005C11.0332 5.00005 10.0524 4.72509 9.22643 4.49082L9.16552 4.47354C8.30795 4.23023 7.60165 4.02983 6.95241 3.99892ZM16 8.00005H5.99998V20C5.99998 20.5523 6.44769 21 6.99998 21H15C15.5523 21 16 20.5523 16 20V18V9.00005V8.00005ZM3.99998 9.95047C3.84184 9.98291 3.67501 10 3.49995 10C2.92413 10 2.41903 9.83305 2.0135 9.51501C1.62125 9.20739 1.38874 8.81107 1.24921 8.45441C0.985687 7.78078 0.985935 7.06201 0.986028 6.79346L0.986031 6.781C0.986034 6.7522 0.985692 6.71736 0.985297 6.67718C0.982584 6.40096 0.977393 5.87237 1.06464 5.31654C1.16334 4.68775 1.40058 3.86544 2.03011 3.23592C3.38421 1.88181 5.11878 1.90933 7.04754 2.00118C7.93431 2.04341 8.84472 2.30267 9.62354 2.52445L9.77216 2.56672C10.6416 2.8133 11.3566 3.00005 12 3.00005C12.4655 3.00005 12.8092 2.92695 13.2222 2.83914C13.4301 2.79494 13.6555 2.747 13.9229 2.70279C14.6837 2.57697 15.5484 2.56291 16.5145 3.14256C17.0704 3.47609 17.5283 3.82058 17.8944 4.55284C18.2078 5.17971 18.1711 5.93529 18.1254 6.36723C18.0993 6.61379 18.0606 6.83131 18.0287 6.98689C18.0183 7.03717 18.0086 7.08168 18 7.11937V8.00005H19C20.6568 8.00005 22 9.34319 22 11V16C22 17.6569 20.6568 19 19 19H18V20C18 21.6569 16.6568 23 15 23H6.99998C5.34312 23 3.99998 21.6569 3.99998 20V9.95047ZM18 17H19C19.5523 17 20 16.5523 20 16V11C20 10.4478 19.5523 10 19 10H18V17ZM13 12C13 12.5523 12.5523 13 12 13C11.4477 13 11 12.5523 11 12C11 11.4477 11.4477 11 12 11C12.5523 11 13 11.4477 13 12ZM8.49998 12C9.3284 12 9.99998 11.3284 9.99998 10.5C9.99998 9.67157 9.3284 9 8.49998 9C7.67155 9 6.99998 9.67157 6.99998 10.5C6.99998 11.3284 7.67155 12 8.49998 12ZM9.99998 15C9.99998 15.5523 9.55226 16 8.99998 16C8.44769 16 7.99998 15.5523 7.99998 15C7.99998 14.4477 8.44769 14 8.99998 14C9.55226 14 9.99998 14.4477 9.99998 15ZM13 18C13.5523 18 14 17.5523 14 17C14 16.4477 13.5523 16 13 16C12.4477 16 12 16.4477 12 17C12 17.5523 12.4477 18 13 18Z" fill="#000000"/>
                        </svg>
                        <h3 class="mt-6 text-2xl font-bold text-gray-900 sm:mt-10">Bier
                        </h3>
                        <p class="mt-6 text-base text-gray-600">Hier kann anhand der Erfolgen und sonstigen Ereignissen der Saison das Bier für die Woche verteilt werden.</p>
                    </div>
                </div>
            </div>
            <div class="overflow-hidden bg-white shadow-md rounded-xl">
                <div class="p-9"><svg class="w-12 h-12 mx-auto text-gray-400 sm:mx-0" viewBox="0 0 24 24" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <rect x="13" y="14" width="2" height="2" rx="1" fill="#111827"></rect>
                        <rect x="7" y="11" width="2" height="6" rx="1" fill="#111827"></rect>
                        <rect x="11" y="13" width="2" height="6" rx="1" transform="rotate(90 11 13)" fill="#111827">
                        </rect>
                        <rect x="16" y="12" width="2" height="2" rx="1" fill="#111827"></rect>
                        <path
                            d="M14 8V8C14 7.58326 14 7.37488 13.9655 7.19144C13.8455 6.5546 13.4245 6.01534 12.8358 5.74455C12.6662 5.66654 12.464 5.616 12.0597 5.51493L12 5.5C11.5388 5.3847 11.3082 5.32706 11.1171 5.233C10.5686 4.96315 10.1737 4.45731 10.0449 3.85979C10 3.65151 10 3.41382 10 2.93845V2"
                            stroke="#111827" stroke-width="2" stroke-linecap="round"></path>
                        <path
                            d="M3 14C3 11.4412 3 10.1618 3.61994 9.28042C3.77954 9.05351 3.96572 8.85041 4.17372 8.6763C4.98164 8 6.15442 8 8.5 8H15.5C17.8456 8 19.0184 8 19.8263 8.6763C20.0343 8.85041 20.2205 9.05351 20.3801 9.28042C21 10.1618 21 11.4412 21 14C21 16.5588 21 17.8382 20.3801 18.7196C20.2205 18.9465 20.0343 19.1496 19.8263 19.3237C19.0184 20 17.8456 20 15.5 20H8.5C6.15442 20 4.98164 20 4.17372 19.3237C3.96572 19.1496 3.77954 18.9465 3.61994 18.7196C3 17.8382 3 16.5588 3 14Z"
                            stroke="#111827" stroke-width="2"></path>
                    </svg>
                    <h3 class="mt-6 text-2xl font-bold text-gray-900 sm:mt-10">TBD</h3>
                    <p class="mt-6 text-base text-gray-600">Hier ist noch Platz für ein weiteres Feature. :)</p>
                </div>
            </div>
        </div>
</template>

<script setup lang="ts">

async function clear() {
        const resS = await $fetch('/api/spieltag-clear')
        const resT = await $fetch('/api/training-clear')
    }

</script>