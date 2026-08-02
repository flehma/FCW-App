<template>
  <div class="p-4">
    <!-- Spieler Auswahl -->
    <h2 class="text-xl font-bold mb-2 text-slate-700">Spieler</h2>
    <div class="mb-4 w-full">
      <select
        class="w-full px-4 py-2 border border-slate-300 rounded-xl focus:ring-2 focus:ring-blue-400 focus:outline-none transition"
        v-model="selectedSpieler"
      >
        <option disabled value="">-- Spieler auswählen --</option>
        <option v-for="spieler in kader?.kader" :key="spieler.id" :value="spieler">
          {{ spieler.name }}
        </option>
      </select>
    </div>

    <!-- Strafe Auswahl -->
    <h2 class="text-xl font-bold mb-2 text-slate-700">Strafe</h2>
    <div class="mb-4 w-full">
      <select
        class="w-full px-4 py-2 border border-slate-300 rounded-xl focus:ring-2 focus:ring-blue-400 focus:outline-none transition"
        v-model="selectedStrafe"
        @change="onStrafeChange"
      >
        <option disabled value="">-- Strafe auswählen --</option>
        <option v-for="strafe in strafen?.strafen" :key="strafe.id" :value="strafe">
          {{ strafe.strafe }}
        </option>
        <option :value="CUSTOM_STRAFE">{{ CUSTOM_STRAFE.strafe }}</option>
      </select>
    </div>

    <!-- Custom Strafe: freier Grund + freier Betrag -->
    <div v-if="isCustom" class="mb-6 bg-slate-50 border border-slate-200 rounded-xl p-4 shadow-sm space-y-3">
      <div>
        <label class="block mb-1 font-medium text-slate-700">Grund</label>
        <input
          type="text"
          v-model="customGrund"
          placeholder="z.B. Sonderstrafe wegen ..."
          class="w-full px-3 py-2 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-400 focus:outline-none transition"
        />
      </div>
      <div>
        <label class="block mb-1 font-medium text-slate-700">Betrag (€)</label>
        <input
          type="number"
          inputmode="numeric"
          min="0"
          v-model.number="customBetrag"
          placeholder="0"
          class="w-full px-3 py-2 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-400 focus:outline-none transition"
        />
      </div>
    </div>

    <!-- Berechnung (nur für Katalog-Strafen) -->
    <div v-else-if="selectedStrafe" class="mt-6 bg-slate-50 border border-slate-200 rounded-xl p-4 shadow-sm">
      <table class="w-full text-left">
        <thead>
          <tr class="text-slate-600 border-b border-slate-200">
            <th class="py-2 font-semibold">Anzahl</th>
            <th class="py-2 font-semibold">Strafe</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="py-2">
              <input
                type="number"
                v-model="anzahl"
                @change="calculate"
                :disabled="!selectedStrafe?.pro_x_text"
                :step="selectedStrafe?.pro_x_text === 'pro 5 min' ? 5 : 1"
                :min="selectedStrafe?.pro_x_text === 'pro 5 min' ? 5 : 1"
                class="w-28 px-3 py-1 border border-slate-300 rounded-lg focus:ring-2 focus:ring-blue-400 focus:outline-none transition disabled:bg-slate-100"
              />
            </td>
            <td class="py-2 text-slate-700 font-medium">
              {{ betrag }} €
              <span v-if="selectedStrafe?.wert_kiste" class="text-slate-500">
                &nbsp;und {{ selectedStrafe.wert_kiste }} Kiste(n)
              </span>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- Buttons -->
    <div class="flex justify-center gap-3 mt-6">
      <button
        @click="eintragen"
        :disabled="!kannEintragen"
        class="px-5 py-2 bg-blue-500 text-white rounded-xl font-medium hover:bg-blue-400 transition disabled:opacity-40 disabled:cursor-not-allowed disabled:hover:bg-blue-500"
      >
        Eintragen
      </button>

      <RouterLink to="/strafen">
        <button
          class="px-5 py-2 border border-blue-300 rounded-xl text-blue-600 font-medium hover:bg-blue-50 transition"
        >
          Zurück
        </button>
      </RouterLink>
    </div>
  </div>
</template>

<script setup lang="ts">
const kader = ref<any>([]);
kader.value = await $fetch("/api/kader-show");

const strafen = ref<any>([]);
strafen.value = await $fetch("/api/strafen-show");

// Spezialeintrag im Dropdown fuer eine freie, nicht im Katalog hinterlegte Strafe
const CUSTOM_STRAFE = { id: "custom", strafe: "Sonstige (freier Betrag)", custom: true };

const betrag = ref(0);
const selectedSpieler = ref("");
const selectedStrafe = ref<any>(null);
const anzahl = ref(1);

const customGrund = ref("");
const customBetrag = ref<number | null>(null);

const isCustom = computed(() => !!selectedStrafe.value?.custom);

const kannEintragen = computed(() => {
  if (!selectedSpieler.value) return false;
  if (isCustom.value) {
    return !!customGrund.value.trim() && !!customBetrag.value && customBetrag.value > 0;
  }
  return !!selectedStrafe.value;
});

async function eintragen() {
  if (!kannEintragen.value) return;

  const body = isCustom.value
    ? {
        spieler: selectedSpieler.value,
        geld: customBetrag.value,
        kiste: 0,
        strafeName: customGrund.value.trim(),
      }
    : {
        spieler: selectedSpieler.value,
        geld: betrag.value,
        kiste: selectedStrafe.value?.wert_kiste,
        strafeName: selectedStrafe.value?.strafe,
      };

  await $fetch("/api/strafen-eintragen", {
    method: "POST",
    body,
  });

  kader.value = await $fetch("/api/kader-show");
}

/**
 * Wird aufgerufen, wenn eine Strafe gewählt oder geändert wird
 */
function onStrafeChange() {
  if (isCustom.value) {
    return;
  }
  // Wenn "pro 5 min", dann startet das Feld bei 5
  if (selectedStrafe.value?.pro_x_text === "pro 5 min") {
    anzahl.value = 5;
  } else {
    anzahl.value = 1;
  }
  calculate();
}

function calculate() {
  if (selectedStrafe.value?.pro_x_text === "pro 5 min") {
    betrag.value = (selectedStrafe.value.wert_geld * anzahl.value) / 5;
  } else if (selectedStrafe.value?.pro_x_text === "pro Teil") {
    betrag.value = selectedStrafe.value.wert_geld * anzahl.value;
  } else {
    betrag.value = selectedStrafe.value?.wert_geld || 0;
  }
}
</script>
