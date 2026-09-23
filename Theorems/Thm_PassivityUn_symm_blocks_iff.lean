import Mathlib

open Matrix

namespace PassivityUn
theorem symm_blocks_iff (n : ℕ) (A B : Matrix (Fin n) (Fin n) ℝ) :
    (Matrix.fromBlocks A (-B) B A)ᵀ = Matrix.fromBlocks A (-B) B A
      ↔ Aᵀ = A ∧ Bᵀ = -B := by sorry
end PassivityUn
