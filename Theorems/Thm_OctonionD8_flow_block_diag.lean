import Mathlib
import Definitions.Def_OctonionD8_blocks

namespace OctonionD8

open Polynomial

theorem flow_block_diag (c s : ℝ) :
    Matrix.reindex blockEquiv blockEquiv (flowMat c s) =
      Matrix.fromBlocks (blockA c s) 0 0 (blockB c s) := by
  sorry

end OctonionD8
