import Mathlib
import Definitions.Def_PassivityUn_admissible

open Matrix
namespace PassivityUn

-- `symm` inside `admissible` is our kernel, not Mathlib's root `symm`
example (n : ℕ) : admissible n = PassivityUn.symm n ⊓ commJ n := rfl

-- stdJ is the block matrix [[0, -I], [I, 0]]
example (n : ℕ) : stdJ n = fromBlocks (0 : Matrix (Fin n) (Fin n) ℝ) (-1) 1 0 := rfl

-- membership in commJ is exactly W J = J W
theorem mem_commJ (n : ℕ) (W : Matrix (Blk n) (Blk n) ℝ) :
    W ∈ commJ n ↔ W * stdJ n = stdJ n * W := by
  simp [commJ, sub_eq_zero]

-- membership in symm is exactly Wᵀ = W
theorem mem_symm (n : ℕ) (W : Matrix (Blk n) (Blk n) ℝ) :
    W ∈ PassivityUn.symm n ↔ Wᵀ = W := by
  simp [PassivityUn.symm, sub_eq_zero]

-- M1 is true
example (n : ℕ) : stdJ n * stdJ n = -1 := by
  simp [stdJ, fromBlocks_multiply]
  rw [← fromBlocks_one, fromBlocks_neg]; simp

-- M2 is true
example (n : ℕ) (A B C D : Matrix (Fin n) (Fin n) ℝ) :
    fromBlocks A B C D * stdJ n = stdJ n * fromBlocks A B C D ↔ D = A ∧ B = -C := by
  simp only [stdJ, fromBlocks_multiply, fromBlocks_inj]
  simp
  constructor
  · rintro ⟨h1, h2, h3, h4⟩
    exact ⟨by rw [← neg_neg D, ← h2, neg_neg], by rw [h1]⟩
  · rintro ⟨rfl, rfl⟩; simp

-- M3 is true
example (n : ℕ) (A B : Matrix (Fin n) (Fin n) ℝ) :
    (fromBlocks A (-B) B A)ᵀ = fromBlocks A (-B) B A ↔ Aᵀ = A ∧ Bᵀ = -B := by
  rw [fromBlocks_transpose, fromBlocks_inj]
  constructor
  · rintro ⟨h1, h2, -, -⟩; exact ⟨h1, h2⟩
  · rintro ⟨h1, h2⟩; refine ⟨h1, h2, ?_, h1⟩; rw [transpose_neg, h2, neg_neg]

-- M4 is true for small n (sanity)
example : ∀ n ∈ Finset.range 50, n * (n + 1) / 2 + n * (n - 1) / 2 = n ^ 2 := by decide
