import Mathlib
import Definitions.Def_RolesForceSeven_sts

namespace RolesForceSeven
theorem three_lines (n : ℕ) (S : STS n) (role : Fin n → Finset (Fin n) → Fin 3)
    (h : RoleColouring S role) (x : Fin n) :
    (S.lines.filter (fun l => x ∈ l)).card = 3 := by sorry
end RolesForceSeven
