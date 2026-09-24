import Mathlib
import Definitions.Def_FanoUnique_isFano

namespace FanoUnique

open RolesForceSeven

theorem normal_form (S : STS 7) :
    ∃ e : Fin 7 ≃ Fin 7,
      ({0, 1, 2} : Finset (Fin 7)) ∈ S.lines.image (fun l => l.map e.toEmbedding) ∧
      ({0, 3, 4} : Finset (Fin 7)) ∈ S.lines.image (fun l => l.map e.toEmbedding) ∧
      ({0, 5, 6} : Finset (Fin 7)) ∈ S.lines.image (fun l => l.map e.toEmbedding) := by
  sorry

end FanoUnique
