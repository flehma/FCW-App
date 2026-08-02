<template>
    <div class="p-2">
        <h2 class="text-lg font-bold mt-4">Katalog</h2>

        <!-- Buttons oben -->
        <div class="flex mt-2 mb-4 flex-row items-center gap-2">
            <RouterLink to="/bier/add">
                <button class="p-2 px-4 bg-blue-500 text-white rounded hover:bg-blue-400 transition-colors">Hinzufügen</button>
            </RouterLink>
            <button
                @click="toggleEditMode"
                :class="[
                    'p-2 px-4 rounded font-medium transition-colors',
                    editMode ? 'bg-slate-700 text-white hover:bg-slate-600' : 'border border-blue-300 text-blue-600 hover:bg-blue-50'
                ]"
            >
                {{ editMode ? 'Fertig' : 'Reihenfolge ändern' }}
            </button>
            <RouterLink to="/bier">
                <button class="inline-flex items-center border border-blue-300 px-3 py-1.5 rounded-md text-blue-500 hover:bg-blue-50 transition-colors">Zurück</button>
            </RouterLink>
        </div>

        <div class="flex flex-col gap-2 mt-2">
            <div
                v-for="(strafe, index) in liste"
                :key="strafe.id"
                :ref="(el) => setRowEl(el, index)"
                class="p-3 rounded bg-slate-100 flex items-center justify-between transition-shadow"
                :class="{ 'shadow-lg ring-2 ring-blue-300 relative z-10': draggingIndex === index }"
            >
                <div class="flex items-center gap-2">
                    <span
                        v-if="editMode"
                        class="text-slate-400 text-lg leading-none cursor-grab active:cursor-grabbing touch-none select-none px-1"
                        @pointerdown="onPointerDown(index, $event)"
                    >
                        ☰
                    </span>
                    <div class="max-w-[272px]">
                        {{ strafe?.strafe }}
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

const { editMode, toggleEditMode, draggingIndex, setRowEl, onPointerDown } = useDragReorder(
    liste,
    async (order) => {
        await $fetch('/api/bier-reorder', {
            method: 'POST',
            body: { order },
        });
    }
);
</script>
