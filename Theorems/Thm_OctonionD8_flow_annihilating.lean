import Mathlib
import Definitions.Def_OctonionD8_flow

namespace OctonionD8

open Polynomial

theorem flow_annihilating (c s : ℝ) (h : c ^ 2 + s ^ 2 = 1) :
    flowMat c s * (flowMat c s ^ 2 + (4 : ℝ) • (1 : Matrix (Fin 8) (Fin 8) ℝ)) *
      (flowMat c s ^ 2 + (2 - 2 * c) • (1 : Matrix (Fin 8) (Fin 8) ℝ)) = 0 := by
  sorry

end OctonionD8
