import Mathlib
import Definitions.Def_PassivityUn_stdJ

open Matrix PassivityUn

theorem solution (n : ℕ) : stdJ n * stdJ n = -1 := by
  simp [stdJ, fromBlocks_multiply]
  rw [← fromBlocks_one, fromBlocks_neg]; simp
