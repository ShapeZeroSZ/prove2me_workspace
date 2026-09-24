import Mathlib
import Definitions.Def_FanoUnique_isFano

namespace FanoUnique

open RolesForceSeven

theorem two_completions (S : STS 7)
    (h₁ : ({0, 1, 2} : Finset (Fin 7)) ∈ S.lines) (h₂ : ({0, 3, 4} : Finset (Fin 7)) ∈ S.lines)
    (h₃ : ({0, 5, 6} : Finset (Fin 7)) ∈ S.lines) :
    S.lines = {{0, 1, 2}, {0, 3, 4}, {0, 5, 6}, {1, 3, 6}, {1, 4, 5}, {2, 3, 5}, {2, 4, 6}} ∨
    S.lines = {{0, 1, 2}, {0, 3, 4}, {0, 5, 6}, {1, 3, 5}, {1, 4, 6}, {2, 3, 6}, {2, 4, 5}} := by
  sorry

end FanoUnique
