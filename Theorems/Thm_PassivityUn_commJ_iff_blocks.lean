import Mathlib
import Definitions.Def_PassivityUn_stdJ

namespace PassivityUn
theorem commJ_iff_blocks (n : ℕ) (A B C D : Matrix (Fin n) (Fin n) ℝ) :
    Matrix.fromBlocks A B C D * stdJ n = stdJ n * Matrix.fromBlocks A B C D
      ↔ D = A ∧ B = -C := by sorry
end PassivityUn
