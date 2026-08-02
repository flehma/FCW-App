<template>
    <div class="p-2">
        <h2 class="text-lg font-bold mt-4">Katalog</h2>

        <!-- Buttons oben -->
        <div class="flex mt-2 mb-4 flex-row flex-wrap items-center gap-2">
            <RouterLink to="/bier/add">
                <button class="p-2 px-3 bg-blue-500 text-white rounded hover:bg-blue-400 transition-colors whitespace-nowrap text-sm">Hinzufügen</button>
            </RouterLink>
            <button
                @click="toggleEditMode"
                :class="[
                    'p-2 px-3 rounded font-medium transition-colors whitespace-nowrap text-sm',
                    editMode ? 'bg-slate-700 text-white hover:bg-slate-600' : 'border border-blue-300 text-blue-600 hover:bg-blue-50'
                ]"
            >
                {{ editMode ? 'Fertig' : 'Sortieren' }}
            </button>
            <RouterLink to="/bier">
                <button class="inline-flex items-center border border-blue-300 px-3 py-1.5 rounded-md text-blue-500 hover:bg-blue-50 transition-colors whitespace-nowrap text-sm">Zurück</button>
            </RouterLink>
        </div>

        <div class="flex flex-col gap-2 mt-2">
            <div
                v-for="(strafe, index) in liste"
                :key="strafe.id"
                :ref="(el) => setRowEl(el, index)"
                class="relative overflow-hidden rounded-lg"
                :class="{ 'shadow-lg ring-2 ring-blue-300 z-10': draggingIndex === index }"
            >
                <!-- Fixierte Aktions-Buttons (nur außerhalb des Reihenfolge-Editier-Modus swipebar) -->
                <div
                    v-if="!editMode"
                    class="absolute right-0 top-0 bottom-0 flex z-0"
                >
                    <RouterLink
                        :to="`/bier/add?id=${strafe.id}`"
                        class="flex items-center justify-center w-16 bg-blue-500 text-white hover:bg-blue-600 transition-colors"
                        aria-label="Bearbeiten"
                    >
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.75" stroke="currentColor" class="w-5 h-5">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0115.75 21H5.25A2.25 2.25 0 013 18.75V8.25A2.25 2.25 0 015.25 6H10" />
                        </svg>
                    </RouterLink>
                    <div
                        class="flex items-center justify-center w-16 bg-red-500 text-white cursor-pointer hover:bg-red-600 transition-colors"
                        @click="deleteStrafe(strafe)"
                        aria-label="Löschen"
                    >
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.75" stroke="currentColor" class="w-5 h-5">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
                        </svg>
                    </div>
                </div>

                <!-- Swipebarer / bzw. im Editier-Modus fixierter Bereich -->
                <div
                    class="flex items-center transition-transform duration-300 bg-slate-100 rounded-lg shadow-sm"
                    :style="{ transform: `translateX(${editMode ? 0 : (strafe.offset || 0)}px)` }"
                    @touchstart="startSwipe(strafe, $event)"
                    @touchmove="moveSwipe(strafe, $event)"
                    @touchend="endSwipe(strafe)"
                    @mousedown="startSwipe(strafe, $event, true)"
                    @mousemove="moveSwipe(strafe, $event, true)"
                    @mouseup="endSwipe(strafe, true)"
                    @mouseleave="endSwipe(strafe, true)"
                >
                    <!-- Drag-Handle im Reihenfolge-Editier-Modus -->
                    <span
                        v-if="editMode"
                        class="text-slate-400 text-lg leading-none cursor-grab active:cursor-grabbing touch-none select-none pl-3"
                        @pointerdown="onPointerDown(index, $event)"
                    >
                        ☰
                    </span>

                    <div class="px-3 py-3 flex items-center justify-between w-full">
                        <div class="max-w-[272px]">
                            {{ strafe?.strafe }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
const liste = ref<any[]>([]);
const response = await $fetch('/api/bier-show');
liste.value = (response as any)?.strafen ?? [];

const { editMode, toggleEditMode: toggleEditModeBase, draggingIndex, setRowEl, onPointerDown } = useDragReorder(
    liste,
    async (order) => {
        await $fetch('/api/bier-reorder', {
            method: 'POST',
            body: { order },
        });
    }
);

function toggleEditMode() {
    // offene Swipes schließen, bevor in den Reihenfolge-Editier-Modus gewechselt wird
    liste.value.forEach((s) => (s.offset = 0));
    activeSwipe = null;
    toggleEditModeBase();
}

// Swipe Handling (Löschen + Bearbeiten als Icon-Buttons, 2 x 64px = 128px)
const SWIPE_MAX = -128;
const SWIPE_THRESHOLD = -64;
let startX = 0;
let isDragging = false;
let activeSwipe: any = null;

function startSwipe(strafe: any, e: TouchEvent | MouseEvent, mouse = false) {
    if (editMode.value) return;
    startX = mouse
        ? (e as MouseEvent).clientX
        : (e as TouchEvent).touches[0].clientX;
    isDragging = true;

    if (activeSwipe && activeSwipe !== strafe) {
        activeSwipe.offset = 0;
    }
    activeSwipe = strafe;

    strafe.offset = strafe.offset || 0;
}

function moveSwipe(strafe: any, e: TouchEvent | MouseEvent, mouse = false) {
    if (editMode.value || !isDragging) return;
    const currentX = mouse
        ? (e as MouseEvent).clientX
        : (e as TouchEvent).touches[0].clientX;
    const diff = currentX - startX;
    strafe.offset = Math.max(SWIPE_MAX, Math.min(0, diff));
}

function endSwipe(strafe: any, mouse = false) {
    if (editMode.value || !isDragging) return;
    isDragging = false;
    if (strafe.offset < SWIPE_THRESHOLD) {
        strafe.offset = SWIPE_MAX;
    } else {
        strafe.offset = 0;
    }
}

async function deleteStrafe(strafe: any) {
    await $fetch('/api/bier-delete', {
        method: 'POST',
        body: { id: strafe.id },
    });
    const response = await $fetch('/api/bier-show');
    liste.value = (response as any)?.strafen ?? [];
}
</script>
