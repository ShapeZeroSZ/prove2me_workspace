import Mathlib
import Definitions.Def_PassivityUn_admissible

open Matrix

namespace PassivityUn

theorem stdJ_sq (n : ℕ) : stdJ n * stdJ n = -1 := by
  simp [stdJ, fromBlocks_multiply]
  rw [← fromBlocks_one, fromBlocks_neg]; simp

theorem commJ_iff_blocks (n : ℕ) (A B C D : Matrix (Fin n) (Fin n) ℝ) :
    Matrix.fromBlocks A B C D * stdJ n = stdJ n * Matrix.fromBlocks A B C D
      ↔ D = A ∧ B = -C := by
  simp only [stdJ, fromBlocks_multiply, fromBlocks_inj]
  simp
  constructor
  · rintro ⟨h1, h2, h3, h4⟩
    exact ⟨by rw [← neg_neg D, ← h2, neg_neg], by rw [h1]⟩
  · rintro ⟨rfl, rfl⟩; simp

theorem symm_blocks_iff (n : ℕ) (A B : Matrix (Fin n) (Fin n) ℝ) :
    (Matrix.fromBlocks A (-B) B A)ᵀ = Matrix.fromBlocks A (-B) B A
      ↔ Aᵀ = A ∧ Bᵀ = -B := by
  rw [fromBlocks_transpose, fromBlocks_inj]
  constructor
  · rintro ⟨h1, h2, -, -⟩; exact ⟨h1, h2⟩
  · rintro ⟨h1, h2⟩; refine ⟨h1, h2, ?_, h1⟩; rw [transpose_neg, h2, neg_neg]

theorem symm_antisymm_dim (n : ℕ) :
    n * (n + 1) / 2 + n * (n - 1) / 2 = n ^ 2 := by
  rcases n with _ | k
  · simp
  · have h2 : 2 ∣ (k + 1) * k := by
      rw [mul_comm]; exact even_iff_two_dvd.mp (Nat.even_mul_succ_self k)
    simp only [Nat.add_sub_cancel]
    rw [← Nat.add_div_of_dvd_left h2]
    have : (k + 1) * (k + 1 + 1) + (k + 1) * k = 2 * (k + 1) ^ 2 := by ring
    rw [this, Nat.mul_div_cancel_left _ (by norm_num)]

/-- The block embedding X ↦ [[S, -K], [K, S]] with S, K the symmetric and
skew parts of X. -/
noncomputable def emb (n : ℕ) : Matrix (Fin n) (Fin n) ℝ →ₗ[ℝ] Matrix (Blk n) (Blk n) ℝ where
  toFun X := fromBlocks ((1/2 : ℝ) • (X + Xᵀ)) (-((1/2 : ℝ) • (X - Xᵀ)))
    ((1/2 : ℝ) • (X - Xᵀ)) ((1/2 : ℝ) • (X + Xᵀ))
  map_add' X Y := by
    simp only [transpose_add, fromBlocks_add]
    congr 1 <;> module
  map_smul' c X := by
    simp only [transpose_smul, RingHom.id_apply, fromBlocks_smul]
    congr 1 <;> module

theorem emb_injective (n : ℕ) : Function.Injective (emb n) := by
  intro X Y h
  simp only [emb, LinearMap.coe_mk, AddHom.coe_mk, fromBlocks_inj] at h
  obtain ⟨h1, -, h3, -⟩ := h
  have := congrArg₂ (· + ·) h1 h3
  calc X = (1/2 : ℝ) • (X + Xᵀ) + (1/2 : ℝ) • (X - Xᵀ) := by module
    _ = (1/2 : ℝ) • (Y + Yᵀ) + (1/2 : ℝ) • (Y - Yᵀ) := this
    _ = Y := by module

theorem mem_commJ (n : ℕ) (W : Matrix (Blk n) (Blk n) ℝ) :
    W ∈ commJ n ↔ W * stdJ n = stdJ n * W := by
  simp [commJ, sub_eq_zero]

theorem mem_symm (n : ℕ) (W : Matrix (Blk n) (Blk n) ℝ) :
    W ∈ PassivityUn.symm n ↔ Wᵀ = W := by
  simp [PassivityUn.symm, sub_eq_zero]

theorem admissible_eq_range (n : ℕ) : admissible n = LinearMap.range (emb n) := by
  ext W
  rw [admissible, Submodule.mem_inf, mem_symm, mem_commJ, LinearMap.mem_range]
  constructor
  · rintro ⟨hs, hc⟩
    obtain ⟨A, B, C, D, rfl⟩ : ∃ A B C D, W = fromBlocks A B C D :=
      ⟨_, _, _, _, (fromBlocks_toBlocks W).symm⟩
    obtain ⟨hD, hB⟩ := (commJ_iff_blocks n A B C D).1 hc
    subst D B
    obtain ⟨hA, hC⟩ := (symm_blocks_iff n A C).1 hs
    refine ⟨A + C, ?_⟩
    simp only [emb, LinearMap.coe_mk, AddHom.coe_mk, transpose_add, hA, hC]
    congr 1 <;> module
  · rintro ⟨X, rfl⟩
    have hS : ((1/2 : ℝ) • (X + Xᵀ))ᵀ = (1/2 : ℝ) • (X + Xᵀ) := by
      rw [transpose_smul, transpose_add, transpose_transpose, add_comm]
    have hK : ((1/2 : ℝ) • (X - Xᵀ))ᵀ = -((1/2 : ℝ) • (X - Xᵀ)) := by
      rw [transpose_smul, transpose_sub, transpose_transpose]; module
    exact ⟨(symm_blocks_iff n _ _).2 ⟨hS, hK⟩, (commJ_iff_blocks n _ _ _ _).2 ⟨rfl, rfl⟩⟩

theorem admissible_finrank (n : ℕ) :
    Module.finrank ℝ (admissible n) = n ^ 2 := by
  rw [admissible_eq_range, LinearMap.finrank_range_of_inj (emb_injective n),
    Module.finrank_matrix, Module.finrank_self, Fintype.card_fin]
  ring

end PassivityUn
