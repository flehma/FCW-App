<template>
  <div class="p-2">
    <h2 class="text-lg font-bold mt-4">Katalog</h2>

    <!-- Buttons oben -->
    <div class="flex mt-2 mb-4 flex-row items-center gap-2">
      <RouterLink to="/strafen/add">
        <button
          class="p-2 px-4 bg-blue-500 text-white rounded hover:bg-blue-400 transition-colors"
        >
          Hinzufügen
        </button>
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
      <RouterLink to="/strafen">
        <button
          class="inline-flex items-center border border-blue-300 px-3 py-1.5 rounded-md text-blue-500 hover:bg-blue-50 transition-colors"
        >
          Zurück
        </button>
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
        <!-- Fixierter Löschbutton (nur außerhalb des Editier-Modus swipebar) -->
        <div
          v-if="!editMode"
          class="absolute right-1 top-1 bottom-1 bg-red-500 text-white flex items-center justify-center w-[80px]  font-bold z-0 rounded-lg cursor-pointer transition-colors duration-200 hover:bg-red-600"
          @click="deleteStrafe(strafe)"
        >
          Löschen
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
          <!-- Drag-Handle im Editier-Modus -->
          <span
            v-if="editMode"
            class="text-slate-400 text-lg leading-none cursor-grab active:cursor-grabbing touch-none select-none pl-3"
            @pointerdown="onPointerDown(index, $event)"
          >
            ☰
          </span>

          <div class="px-3 py-3 flex items-center justify-between w-full">
            <div class="max-w-[272px]">
              {{ strafe?.strafe }} {{ strafe?.pro_x_text }}
            </div>

            <!-- Geld + Kiste -->
            <div
              v-if="strafe?.wert_kiste"
              class="font-semibold text-center p-1 rounded bg-blue-500 w-[60px] h-[60px] text-white ml-2"
            >
              {{ strafe?.wert_geld }}€<br />{{ strafe?.wert_kiste }} Kiste
            </div>

            <!-- Nur Geld -->
            <div
              v-else
              class="font-semibold text-center p-1 rounded bg-blue-500 w-[60px] text-white ml-2"
            >
              {{ strafe?.wert_geld }}€
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";

const liste = ref<any[]>([]);
const response = await $fetch("/api/strafen-show");
liste.value = (response as any)?.strafen ?? [];

const { editMode, toggleEditMode: toggleEditModeBase, draggingIndex, setRowEl, onPointerDown } = useDragReorder(
  liste,
  async (order) => {
    await $fetch("/api/strafen-reorder", {
      method: "POST",
      body: { order },
    });
  }
);

function toggleEditMode() {
  // offene Swipes schließen, bevor in den Editier-Modus gewechselt wird
  liste.value.forEach((s) => (s.offset = 0));
  activeSwipe = null;
  toggleEditModeBase();
}

// Swipe Handling
let startX = 0;
let isDragging = false;
let activeSwipe: any = null;

function startSwipe(strafe: any, e: TouchEvent | MouseEvent, mouse = false) {
  if (editMode.value) return;
  startX = mouse
    ? (e as MouseEvent).clientX
    : (e as TouchEvent).touches[0].clientX;
  isDragging = true;

  // vorher offenen Swipe schließen
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
  // Nur nach links, max -100 px
  strafe.offset = Math.max(-100, Math.min(0, diff));
}

function endSwipe(strafe: any, mouse = false) {
  if (editMode.value || !isDragging) return;
  isDragging = false;
  // Wenn weit genug gewischt → offen lassen
  if (strafe.offset < -50) {
    strafe.offset = -100;
  } else {
    strafe.offset = 0;
  }
}

async function deleteStrafe(strafe: any) {
  await $fetch("/api/strafen-delete", {
    method: "POST",
    body: { id: strafe.id },
  });
  const response = await $fetch("/api/strafen-show");
  liste.value = (response as any)?.strafen ?? [];
}
</script>
