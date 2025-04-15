<template>
    <div class="p-2">
        <h2 class="text-lg font-bold mt-4">Flaschen</h2>
        <div class="flex flex-row gap-2 mr-2">
            <select class="dropdown p-2" v-model="selectedFlaschen">
                <option v-for="spieler in kader?.kader" :value="spieler">
                    {{ spieler.name }}
                </option>
            </select>
            <button @click="addFlaschen" class="p-2 px-4 bg-blue-500 text-white rounded hover:bg-blue-400">
                <svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M23.228 8.01785C23.6186 7.62741 23.6187 6.99424 23.2283 6.60363L22.5213 5.89638C22.1309 5.50577 21.4977 5.50563 21.1071 5.89607L10.0862 16.9122C9.69563 17.3027 9.6955 17.9359 10.0859 18.3265L10.7929 19.0337C11.1833 19.4243 11.8165 19.4245 12.2071 19.034L23.228 8.01785Z" fill="#FFFFFF"/><path d="M17.2285 8.01777C17.619 7.62724 17.619 6.99408 17.2285 6.60356L16.5214 5.89645C16.1309 5.50592 15.4977 5.50592 15.1072 5.89645L5.54542 15.4582L2.76773 12.6805C2.37721 12.29 1.74404 12.29 1.35352 12.6805L0.646409 13.3876C0.255884 13.7782 0.255885 14.4113 0.646409 14.8019L4.83831 18.9938C5.22883 19.3843 5.862 19.3843 6.25252 18.9938L17.2285 8.01777Z" fill="#FFFFFF"/>
                </svg>
            </button>
        </div>
        <h2 class="text-lg font-bold mt-4">Musikbox</h2>
        <div class="flex flex-row gap-2 mr-2">
            <select class="dropdown p-2" v-model="selectedMusikbox">
                <option v-for="spieler in kader?.kader" :value="spieler">
                    {{ spieler.name }}
                </option>
            </select>
            <button @click="addMusikbox" class="p-2 px-4 bg-blue-500 text-white rounded hover:bg-blue-400">
                <svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M23.228 8.01785C23.6186 7.62741 23.6187 6.99424 23.2283 6.60363L22.5213 5.89638C22.1309 5.50577 21.4977 5.50563 21.1071 5.89607L10.0862 16.9122C9.69563 17.3027 9.6955 17.9359 10.0859 18.3265L10.7929 19.0337C11.1833 19.4243 11.8165 19.4245 12.2071 19.034L23.228 8.01785Z" fill="#FFFFFF"/><path d="M17.2285 8.01777C17.619 7.62724 17.619 6.99408 17.2285 6.60356L16.5214 5.89645C16.1309 5.50592 15.4977 5.50592 15.1072 5.89645L5.54542 15.4582L2.76773 12.6805C2.37721 12.29 1.74404 12.29 1.35352 12.6805L0.646409 13.3876C0.255884 13.7782 0.255885 14.4113 0.646409 14.8019L4.83831 18.9938C5.22883 19.3843 5.862 19.3843 6.25252 18.9938L17.2285 8.01777Z" fill="#FFFFFF"/>
                </svg>
            </button>
        </div>
        <h2 class="text-lg font-bold mt-4">Bälle</h2>
        <div class="flex flex-row gap-2 mr-2">
            <select class="dropdown p-2" v-model="selectedBälle">
                <option v-for="spieler in kader?.kader" :value="spieler">
                    {{ spieler.name }}
                </option>
            </select>
            <button @click="addBälle" class="p-2 px-4 bg-blue-500 text-white rounded hover:bg-blue-400">
                <svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M23.228 8.01785C23.6186 7.62741 23.6187 6.99424 23.2283 6.60363L22.5213 5.89638C22.1309 5.50577 21.4977 5.50563 21.1071 5.89607L10.0862 16.9122C9.69563 17.3027 9.6955 17.9359 10.0859 18.3265L10.7929 19.0337C11.1833 19.4243 11.8165 19.4245 12.2071 19.034L23.228 8.01785Z" fill="#FFFFFF"/><path d="M17.2285 8.01777C17.619 7.62724 17.619 6.99408 17.2285 6.60356L16.5214 5.89645C16.1309 5.50592 15.4977 5.50592 15.1072 5.89645L5.54542 15.4582L2.76773 12.6805C2.37721 12.29 1.74404 12.29 1.35352 12.6805L0.646409 13.3876C0.255884 13.7782 0.255885 14.4113 0.646409 14.8019L4.83831 18.9938C5.22883 19.3843 5.862 19.3843 6.25252 18.9938L17.2285 8.01777Z" fill="#FFFFFF"/>
                </svg>
            </button>
        </div>
        <h2 class="text-lg font-bold mt-4">Jacken</h2>
        <div class="flex flex-row gap-2 mr-2">
            <select class="dropdown p-2" v-model="selectedJacken">
                <option v-for="spieler in kader?.kader" :value="spieler">
                    {{ spieler.name }}
                </option>
            </select>
            <button @click="addJacken" class="p-2 px-4 bg-blue-500 text-white rounded hover:bg-blue-400">
                <svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M23.228 8.01785C23.6186 7.62741 23.6187 6.99424 23.2283 6.60363L22.5213 5.89638C22.1309 5.50577 21.4977 5.50563 21.1071 5.89607L10.0862 16.9122C9.69563 17.3027 9.6955 17.9359 10.0859 18.3265L10.7929 19.0337C11.1833 19.4243 11.8165 19.4245 12.2071 19.034L23.228 8.01785Z" fill="#FFFFFF"/><path d="M17.2285 8.01777C17.619 7.62724 17.619 6.99408 17.2285 6.60356L16.5214 5.89645C16.1309 5.50592 15.4977 5.50592 15.1072 5.89645L5.54542 15.4582L2.76773 12.6805C2.37721 12.29 1.74404 12.29 1.35352 12.6805L0.646409 13.3876C0.255884 13.7782 0.255885 14.4113 0.646409 14.8019L4.83831 18.9938C5.22883 19.3843 5.862 19.3843 6.25252 18.9938L17.2285 8.01777Z" fill="#FFFFFF"/>
                </svg>
            </button>
        </div>
    </div>
    <div class="flex mt-4 flex-col items-center">
        <RouterLink to="/material">
            <button class="inline-flex items-center border border-blue-300 px-3 py-1.5 rounded-md text-blue-500 hover:bg-blue-50">Zurück</button>
        </RouterLink>        
    </div>
</template>
<script setup lang="ts">

    const kader = ref<any>([]);
    kader.value = await $fetch('/api/kader-show')

    const selectedFlaschen = ref('');
    const selectedMusikbox = ref('');
    const selectedBälle = ref('');
    const selectedJacken = ref('');

    async function addFlaschen() {
        const res = await $fetch('/api/material-add-flaschen', {
            method: "POST",
            body: {
                spieler: selectedFlaschen.value
            }
        }).then( async () => {
            kader.value = await $fetch('/api/kader-show')
        })
    }

    async function addMusikbox() {
        const res = await $fetch('/api/material-add-musikbox', {
            method: "POST",
            body: {
                spieler: selectedMusikbox.value
            }
        }).then( async () => {
            kader.value = await $fetch('/api/kader-show')
        })
    }

    async function addBälle() {
        const res = await $fetch('/api/material-add-bälle', {
            method: "POST",
            body: {
                spieler: selectedBälle.value
            }
        }).then( async () => {
            kader.value = await $fetch('/api/kader-show')
        })
    }

    async function addJacken() {
        const res = await $fetch('/api/material-add-jacken', {
            method: "POST",
            body: {
                spieler: selectedJacken.value
            }
        }).then( async () => {
            kader.value = await $fetch('/api/kader-show')
        })
    }
</script>