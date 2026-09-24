import Mathlib
import Definitions.Def_FanoUnique_isFano

namespace FanoUnique

open RolesForceSeven

theorem lines_meet (S : STS 7) :
    ∀ l ∈ S.lines, ∀ l' ∈ S.lines, l ≠ l' → (l ∩ l').card = 1 := by
  sorry

end FanoUnique
