import Mathlib
import Definitions.Def_PassivityTorus_power

open Matrix BigOperators

namespace PassivityTorusSol
open PassivityTorus

theorem shift_apply_self {q L : ℕ} (x : Site q L) (a : Fin q) (s : Fin L) :
    shift x a s a = x a + s := by simp [shift]

theorem shift_apply_ne {q L : ℕ} (x : Site q L) {a b : Fin q} (s : Fin L) (h : b ≠ a) :
    shift x a s b = x b := by simp [shift, h]

end PassivityTorusSol

open PassivityTorus PassivityTorusSol

theorem solution {q L : ℕ} [NeZero L] (x : Site q L) (a : Fin q) :
    shift (shift x a (-1)) a 1 = x := by
  funext b
  by_cases h : b = a
  · subst h; simp [shift]
  · simp [shift, h]
