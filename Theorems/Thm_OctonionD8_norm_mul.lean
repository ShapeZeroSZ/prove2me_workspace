import Mathlib
import Definitions.Def_OctonionD8_flow

namespace OctonionD8

open Polynomial

theorem norm_mul (p q : Fin 8 → ℝ) :
    ∑ k, (omul p q k) ^ 2 = (∑ i, p i ^ 2) * (∑ j, q j ^ 2) := by
  sorry

end OctonionD8
