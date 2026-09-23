import Mathlib
import Definitions.Def_PassivityUn_stdJ

open Matrix

namespace PassivityUn

/-- Commuting with J, as the kernel of W ↦ W J - J W. -/
def commJ (n : ℕ) : Submodule ℝ (Matrix (Blk n) (Blk n) ℝ) :=
  LinearMap.ker (LinearMap.mulRight ℝ (stdJ n) - LinearMap.mulLeft ℝ (stdJ n))

/-- Symmetric, as the kernel of W ↦ Wᵀ - W. -/
def symm (n : ℕ) : Submodule ℝ (Matrix (Blk n) (Blk n) ℝ) :=
  LinearMap.ker ((Matrix.transposeLinearEquiv (Blk n) (Blk n) ℝ ℝ).toLinearMap
                 - LinearMap.id)

/-- The passivity-admissible coupling class. -/
def admissible (n : ℕ) : Submodule ℝ (Matrix (Blk n) (Blk n) ℝ) :=
  symm n ⊓ commJ n

end PassivityUn
