<template>
    <div class="p-2">
        <h2 class="text-lg font-bold mt-4">offene Kisten</h2>
        <div v-if="kader" class="flex flex-col gap-2 mt-2">
            
            <div class="" v-for="row in kader?.kader" :key="row.id">
                <div class="p-3 rounded bg-slate-100 flex items-center justify-between">
                    <p class="font-semibold"> {{ row?.name }}</p>

                    <div class="flex items-center justify-between">  
                        <div class="mr-2 p-2  w-[60px] font-semibold text-white text-center rounded bg-blue-500">
                            {{ row?.kiste }}<br>
                        </div>
                        <div>
                            <button @click="mitgenommen(row)" class="p-2 px-4 w-[60px] bg-red-500 text-white rounded hover:bg-red-400">
                                <svg width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M23.228 8.01785C23.6186 7.62741 23.6187 6.99424 23.2283 6.60363L22.5213 5.89638C22.1309 5.50577 21.4977 5.50563 21.1071 5.89607L10.0862 16.9122C9.69563 17.3027 9.6955 17.9359 10.0859 18.3265L10.7929 19.0337C11.1833 19.4243 11.8165 19.4245 12.2071 19.034L23.228 8.01785Z" fill="#FFFFFF"/><path d="M17.2285 8.01777C17.619 7.62724 17.619 6.99408 17.2285 6.60356L16.5214 5.89645C16.1309 5.50592 15.4977 5.50592 15.1072 5.89645L5.54542 15.4582L2.76773 12.6805C2.37721 12.29 1.74404 12.29 1.35352 12.6805L0.646409 13.3876C0.255884 13.7782 0.255885 14.4113 0.646409 14.8019L4.83831 18.9938C5.22883 19.3843 5.862 19.3843 6.25252 18.9938L17.2285 8.01777Z" fill="#FFFFFF"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="flex mt-2 flex-col items-center">
                <RouterLink to="/bier">
                    <button class="inline-flex items-center border border-blue-300 px-3 py-1.5 rounded-md text-blue-500 hover:bg-blue-50">Zurück</button>
                </RouterLink>        
            </div>
        </div>
    </div>
</template>
<script setup lang="ts">

    const kader = ref<any>([]);
    kader.value = await $fetch('/api/bier-spieler-show')

    let showDetails = ref<any>([]);
    showDetails.value = false;

    async function mitgenommen(spieler: any) {
        const res = await $fetch('/api/bier-mitgenommen', {
            method: "POST",
            body: {
                spieler: spieler
            }
        }).then( async () => {
            kader.value = await $fetch('/api/bier-spieler-show')
        })
    }
    
</script>