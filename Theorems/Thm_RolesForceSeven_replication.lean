import Mathlib
import Definitions.Def_RolesForceSeven_sts

namespace RolesForceSeven
theorem replication (n : ℕ) (S : STS n) (x : Fin n) :
    2 * (S.lines.filter (fun l => x ∈ l)).card + 1 = n := by sorry
end RolesForceSeven
