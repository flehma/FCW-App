<template>
    <div class="p-2">
        <h2 class="text-lg font-bold mt-4">Kader</h2>
        <div class="flex flex-row gap-2 mr-2">
            <input type="text" v-model="spielerInput" placeholder="Vorname Nachname" class="p-2"/>
            <button @click="addSpieler" class="p-2 px-4 bg-blue-500 text-white rounded hover:bg-blue-400">Hinzufügen</button>
        </div>
        <div v-if="kader" class="flex flex-col gap-2 mt-2">
            
            <div class="" v-for="row in kader?.kader" :key="row.id">
                <div class="p-3 rounded bg-slate-100 flex items-center justify-between">
                    <div class="" @click="openDetails(row?.id)">
                        <p class="font-semibold"> {{ row?.name }}</p>
                    </div>

                    <div class="justify-between min-w-[184px]">              
                        <button v-if="!row?.training" @click="trainingAddSpieler(row)" class="mr-2 p-2 px-4 bg-green-500 text-white rounded hover:bg-green-400">
                            <svg fill="#000000" height="24px" width="24px" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512 512" xml:space="preserve"><g><g><path d="M435.2,409.6h-6.775L306.031,17.963C302.694,7.279,292.796,0,281.6,0h-51.2c-11.196,0-21.094,7.279-24.431,17.963 L83.575,409.6H76.8c-28.228,0-51.2,22.963-51.2,51.2c0,28.228,22.972,51.2,51.2,51.2h358.4c28.237,0,51.2-22.972,51.2-51.2 C486.4,432.563,463.437,409.6,435.2,409.6z M230.4,25.6h51.2l23.996,76.8h-99.2L230.4,25.6z M198.4,128h115.2l23.996,76.8h-163.2 L198.4,128z M166.4,230.4h179.2l23.996,76.8h-227.2L166.4,230.4z M134.4,332.8h243.2l23.996,76.8h-291.2L134.4,332.8z C460.8,474.94,449.34,486.4,435.2,486.4z"/></g></g></svg>
                        </button>
                        <button v-if="row?.training" class="mr-2 p-2 px-4 bg-green-500 text-white rounded hover:bg-green-400">
                            <svg width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M4 12.6111L8.92308 17.5L20 6.5" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg>
                        </button>
                        <button v-if="!row?.spieltag" @click="spieltagAddSpieler(row)" class="mr-2 p-2 px-4 bg-blue-500 text-white rounded hover:bg-blue-400">
                            <svg fill="#000000" height="24px" width="24px" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512.044 512.044" xml:space="preserve"><g><g><g><path d="M261.613,93.241c1.075,0.452,2.202,0.674,3.302,0.674c3.337,0,6.494-1.971,7.868-5.231l23.125-54.938 c1.826-4.335-0.213-9.344-4.557-11.17c-4.343-1.826-9.352,0.213-11.179,4.557L257.056,82.07 C255.23,86.405,257.27,91.414,261.613,93.241z"/><path d="M217.786,87.156c1.502,2.978,4.506,4.693,7.629,4.693c1.289,0,2.603-0.29,3.831-0.913 c4.207-2.125,5.896-7.253,3.772-11.46L203.928,21.8c-2.125-4.215-7.27-5.897-11.46-3.78c-4.207,2.125-5.905,7.262-3.78,11.46 L217.786,87.156z"/><path d="M143.324,80.304l52.318,37.598c1.502,1.084,3.243,1.604,4.966,1.604c2.654,0,5.274-1.229,6.938-3.55 c2.756-3.823,1.886-9.165-1.946-11.913l-52.318-37.598c-3.814-2.739-9.156-1.877-11.904,1.954 C138.631,72.223,139.501,77.556,143.324,80.304z"/><path d="M511.606,118.474l-17.067-51.2c-1.468-4.386-6.153-6.793-10.581-5.47l-216.132,65.63 c-2.244,0.683-4.105,2.253-5.154,4.352c-1.05,2.099-1.186,4.531-0.393,6.733l10.65,29.252c1.613,4.437-0.674,9.353-5.086,10.957 c-4.437,1.579-9.344-0.691-10.948-5.103l-11.008-30.259c-1.579-4.335-6.306-6.63-10.692-5.188l-128.427,42.266 c-40.695,14.814-73.182,44.578-91.486,83.831s-20.233,83.277-5.419,123.972c23.936,65.766,86.272,106.692,152.525,106.692 c18.372,0,37.043-3.149,55.287-9.788c40.695-14.805,73.19-44.587,91.486-83.831c17.809-38.204,20.113-80.939,6.562-120.713 c-0.051-0.785-0.205-1.57-0.486-2.347c-6.127-17.135-15.053-33.024-26.53-47.232c-2.961-3.669-8.337-4.233-11.998-1.28 c-3.669,2.961-4.241,8.337-1.28,11.998c9.591,11.878,17.195,25.062,22.622,39.236c0.06,0.742,0.222,1.476,0.486,2.202 c13.252,36.412,11.537,75.802-4.838,110.916c-16.375,35.123-45.457,61.764-81.86,75.017 c-75.187,27.366-158.583-11.546-185.941-86.707c-13.252-36.412-11.529-75.802,4.847-110.916 c16.375-35.123,45.449-61.764,81.613-74.923l120.311-39.603l8.183,22.494c4.838,13.244,19.558,20.122,32.819,15.309 c13.261-4.83,20.122-19.55,15.3-32.828l-7.569-20.796l199.569-60.595l12.186,36.548l-146.722,80.111 c-18.697,9.344-30.31,28.621-30.31,50.295c0,4.71,3.814,8.533,8.533,8.533c4.71,0,8.533-3.823,8.533-8.533 c0-15.172,7.996-28.587,21.154-35.174l153.25-83.669C511.222,126.683,512.911,122.39,511.606,118.474z"/><path d="M162.524,240.637c-51.763,0-93.867,42.112-93.867,93.867c0,51.755,42.104,93.867,93.867,93.867 c51.755,0,93.867-42.112,93.867-93.867C256.391,282.749,214.279,240.637,162.524,240.637z M162.524,411.304 c-42.351,0-76.8-34.458-76.8-76.8c0-42.342,34.449-76.8,76.8-76.8c42.342,0,76.8,34.458,76.8,76.8 C239.324,376.846,204.866,411.304,162.524,411.304z"/></g></g></g></svg>
                        </button>
                        <button v-if="row?.spieltag" class="mr-2 p-2 px-4 bg-blue-500 text-white rounded hover:bg-blue-400">
                            <svg width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M4 12.6111L8.92308 17.5L20 6.5" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg>
                        </button>
                        <button @click="rmSpieler(row)" class="p-2 px-4 bg-red-500 text-white rounded hover:bg-red-400">
                            <svg fill="#000000" width="24px" height="24px" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M2,21h8a1,1,0,0,0,0-2H3.071A7.011,7.011,0,0,1,10,13a5.044,5.044,0,1,0-3.377-1.337A9.01,9.01,0,0,0,1,20,1,1,0,0,0,2,21ZM10,5A3,3,0,1,1,7,8,3,3,0,0,1,10,5ZM23,16a1,1,0,0,1-1,1H15a1,1,0,0,1,0-2h7A1,1,0,0,1,23,16Z"/></svg>
                        </button>
                    </div>
                </div>
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 mt-2 ml-2 p-2 bg-blue-50 rounded" v-if="row?.showDetails">
                    <table>
                        <tbody>
                            <tr>
                                <td class="font-bold">Flaschen:</td>
                                <td>{{ row?.flaschen }}</td>
                            </tr>
                            <tr>
                                <td class="font-bold">Jacken:</td>
                                <td>{{ row?.jacken }}</td>
                            </tr>
                            <tr>
                                <td class="font-bold">Bälle:</td>
                                <td>{{ row?.bälle }}</td>
                            </tr>
                            <tr>
                                <td class="font-bold">Musikbox:</td>
                                <td>{{ row?.musikbox }}</td>
                            </tr>
                    </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</template>
<script setup lang="ts">

    const kader = ref<any>([]);
    kader.value = await $fetch('/api/kader-show')

    const spielerInput = ref('');
    let showDetails = ref<any>([]);
    showDetails.value = false;

    async function addSpieler() {
        const res = await $fetch('/api/kader-add-spieler', {
            method: "POST",
            body: {
            name: spielerInput.value
            }
        }).then( async () => {
            kader.value = await $fetch('/api/kader-show')
        })
    }

    async function rmSpieler(spieler: any) {
        const res = await $fetch('/api/kader-rm-spieler', {
            method: "POST",
            body: {
            spieler: spieler
            }
        }).then( async () => {
            kader.value = await $fetch('/api/kader-show')
        })
    }
    async function spieltagAddSpieler(spieler: any) {
        const res = await $fetch('/api/spieltag-add-spieler', {
            method: "POST",
            body: {
            spieler: spieler
            }
        })
    }
    async function trainingAddSpieler(spieler: any) {
        const res = await $fetch('/api/training-add-spieler', {
            method: "POST",
            body: {
            spieler: spieler
            }
        })
    }
    function openDetails(id: any) {
        if(kader.value.kader[id-1].showDetails) {
            kader.value.kader[id-1].showDetails = !kader.value.kader[id-1].showDetails;
        } else {
            kader.value.kader[id-1].showDetails = true;
        }
        
    }
</script>