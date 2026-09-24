import Mathlib
import Definitions.Def_RolesForceSeven_sts

namespace RolesForceSeven
theorem roles_force_seven (n : ℕ) (hn : 0 < n) (S : STS n)
    (role : Fin n → Finset (Fin n) → Fin 3) (h : RoleColouring S role) :
    n = 7 := by sorry
end RolesForceSeven
