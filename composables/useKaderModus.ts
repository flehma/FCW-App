// Liest die Einstellung "kader_modus" (pro Team-Instanz in der DB hinterlegt).
//
// 'opt_in'  (Standard, bisheriges Verhalten der 2. Mannschaft):
//   Spieler werden aktiv zu Training und Spieltag HINZUGEFÜGT.
//   "Aufräumen" LEERT Training und Spieltag.
//
// 'opt_out' (1. Mannschaft):
//   Training entfällt komplett. Beim Spieltag sind alle Spieler standardmäßig
//   dabei, einzelne Spieler werden bei Bedarf ENTFERNT.
//   "Aufräumen" FÜLLT den Spieltag-Kader wieder mit allen Spielern.
export type KaderModus = 'opt_in' | 'opt_out';

export function useKaderModus() {
  const kaderModus = ref<KaderModus>('opt_in');
  const loaded = ref(false);

  async function ladeKaderModus() {
    try {
      const einstellungen = await $fetch('/api/einstellungen-show') as Record<string, string>;
      kaderModus.value = einstellungen.kader_modus === 'opt_out' ? 'opt_out' : 'opt_in';
    } catch (error) {
      console.error('Konnte kader_modus nicht laden, verwende Standard (opt_in):', error);
      kaderModus.value = 'opt_in';
    } finally {
      loaded.value = true;
    }
  }

  return { kaderModus, loaded, ladeKaderModus };
}
