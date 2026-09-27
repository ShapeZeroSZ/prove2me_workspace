import Mathlib
import Definitions.Def_OctonionD8_flow

namespace OctonionD8

open Polynomial

/-- MISSION GOAL. -/
theorem flow_charpoly (c s : ℝ) (h : c ^ 2 + s ^ 2 = 1) :
    (flowMat c s).charpoly = X ^ 2 * (X ^ 2 + 4) * (X ^ 2 + C (2 - 2 * c)) ^ 2 := by
  sorry

end OctonionD8
