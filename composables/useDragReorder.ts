import { ref, type Ref } from 'vue';

/**
 * Ermöglicht das Neuanordnen einer Liste per Drag&Drop (Maus + Touch, via Pointer Events),
 * ähnlich der Warteschlange bei Spotify. Der "Bearbeiten"-Button schaltet den Editier-Modus
 * um; erst dann reagieren die Drag-Handles auf Pointer-Events.
 *
 * @param items Reaktive Liste der Elemente (muss ein `id`-Feld besitzen)
 * @param persist Wird nach jedem abgeschlossenen Drag mit der neuen id-Reihenfolge aufgerufen
 */
export function useDragReorder<T extends { id: number | string }>(
  items: Ref<T[]>,
  persist: (orderedIds: (number | string)[]) => void | Promise<void>
) {
  const editMode = ref(false);
  const draggingIndex = ref<number | null>(null);
  const rowEls: Record<number, HTMLElement | null> = {};

  function setRowEl(el: Element | null, index: number) {
    rowEls[index] = (el as HTMLElement) ?? null;
  }

  function toggleEditMode() {
    editMode.value = !editMode.value;
  }

  function onPointerDown(index: number, e: PointerEvent) {
    if (!editMode.value) return;
    e.preventDefault();
    draggingIndex.value = index;
    (e.target as HTMLElement)?.setPointerCapture?.(e.pointerId);
    window.addEventListener('pointermove', onPointerMove);
    window.addEventListener('pointerup', onPointerUp);
    window.addEventListener('pointercancel', onPointerUp);
  }

  function onPointerMove(e: PointerEvent) {
    if (draggingIndex.value === null) return;
    const from = draggingIndex.value;
    const currentY = e.clientY;

    let to = from;
    for (let i = 0; i < items.value.length; i++) {
      if (i === from) continue;
      const el = rowEls[i];
      if (!el) continue;
      const rect = el.getBoundingClientRect();
      const mid = rect.top + rect.height / 2;
      if (currentY < mid && i < to) to = i;
      if (currentY > mid && i > to) to = i;
    }

    if (to !== from) {
      const arr = items.value;
      const [moved] = arr.splice(from, 1);
      arr.splice(to, 0, moved);
      draggingIndex.value = to;
    }
  }

  async function onPointerUp() {
    window.removeEventListener('pointermove', onPointerMove);
    window.removeEventListener('pointerup', onPointerUp);
    window.removeEventListener('pointercancel', onPointerUp);
    if (draggingIndex.value !== null) {
      draggingIndex.value = null;
      await persist(items.value.map((i) => i.id));
    }
  }

  return { editMode, toggleEditMode, draggingIndex, setRowEl, onPointerDown };
}
