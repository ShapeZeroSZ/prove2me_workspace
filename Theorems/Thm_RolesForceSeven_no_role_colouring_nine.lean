import Mathlib
import Definitions.Def_RolesForceSeven_sts

namespace RolesForceSeven
theorem no_role_colouring_nine (S : STS 9) (role : Fin 9 → Finset (Fin 9) → Fin 3) :
    ¬ RoleColouring S role := by sorry
end RolesForceSeven
