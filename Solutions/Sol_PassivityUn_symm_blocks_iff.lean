import Mathlib

open Matrix

theorem solution (n : ℕ) (A B : Matrix (Fin n) (Fin n) ℝ) :
    (Matrix.fromBlocks A (-B) B A)ᵀ = Matrix.fromBlocks A (-B) B A
      ↔ Aᵀ = A ∧ Bᵀ = -B := by
  rw [fromBlocks_transpose, fromBlocks_inj]
  constructor
  · rintro ⟨h1, h2, -, -⟩; exact ⟨h1, h2⟩
  · rintro ⟨h1, h2⟩; refine ⟨h1, h2, ?_, h1⟩; rw [transpose_neg, h2, neg_neg]
