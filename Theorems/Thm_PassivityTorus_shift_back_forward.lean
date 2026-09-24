import Mathlib
import Definitions.Def_PassivityTorus_power

open Matrix BigOperators

namespace PassivityTorus
theorem shift_back_forward {q L : ℕ} [NeZero L] (x : Site q L) (a : Fin q) :
    shift (shift x a (-1)) a 1 = x := by sorry
end PassivityTorus
