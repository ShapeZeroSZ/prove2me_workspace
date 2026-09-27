import Mathlib
import Definitions.Def_OctonionD8_blocks

namespace OctonionD8

open Polynomial

theorem charpoly_blockA (c s : ℝ) (h : c ^ 2 + s ^ 2 = 1) :
    (blockA c s).charpoly = X ^ 2 * (X ^ 2 + 4) := by
  sorry

end OctonionD8
