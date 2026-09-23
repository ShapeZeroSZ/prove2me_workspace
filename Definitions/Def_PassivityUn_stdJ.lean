import Mathlib

open Matrix

namespace PassivityUn

/-- Index type for 2n × 2n matrices in 2 × 2 block form. -/
abbrev Blk (n : ℕ) := Fin n ⊕ Fin n

/-- The standard complex structure J = [[0, -I], [I, 0]]. -/
def stdJ (n : ℕ) : Matrix (Blk n) (Blk n) ℝ :=
  Matrix.fromBlocks 0 (-1) 1 0

end PassivityUn
