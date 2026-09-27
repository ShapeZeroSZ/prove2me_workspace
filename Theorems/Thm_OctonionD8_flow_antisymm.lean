import Mathlib
import Definitions.Def_OctonionD8_flow

namespace OctonionD8

open Polynomial

theorem flow_antisymm (c s : ℝ) : (flowMat c s).transpose = -flowMat c s := by
  sorry

end OctonionD8
