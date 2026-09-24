import Mathlib
import Definitions.Def_FanoUnique_isFano

namespace FanoUnique

open RolesForceSeven

theorem seven_lines (S : STS 7) :
    S.lines.card = 7 ∧ ∀ x : Fin 7, (S.lines.filter (fun l => x ∈ l)).card = 3 := by
  sorry

end FanoUnique
