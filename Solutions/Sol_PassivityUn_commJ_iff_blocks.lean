import Mathlib
import Definitions.Def_PassivityUn_stdJ

open Matrix PassivityUn

theorem solution (n : ℕ) (A B C D : Matrix (Fin n) (Fin n) ℝ) :
    Matrix.fromBlocks A B C D * stdJ n = stdJ n * Matrix.fromBlocks A B C D
      ↔ D = A ∧ B = -C := by
  simp only [stdJ, fromBlocks_multiply, fromBlocks_inj]
  simp
  constructor
  · rintro ⟨h1, h2, h3, h4⟩
    exact ⟨by rw [← neg_neg D, ← h2, neg_neg], by rw [h1]⟩
  · rintro ⟨rfl, rfl⟩; simp
