import Mathlib
import Definitions.Def_OctonionD8_blocks

namespace OctonionD8

open Polynomial

theorem charpoly_blockB (c s : ℝ) (h : c ^ 2 + s ^ 2 = 1) :
    (blockB c s).charpoly = (X ^ 2 + C (2 - 2 * c)) ^ 2 := by
  sorry

end OctonionD8
