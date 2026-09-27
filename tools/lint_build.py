#!/usr/bin/env python3
"""lint_build.py FILE... — refuse build scripts with the quoting bug.

Flags implicit string concatenation: two string literals side by side, such as
r'...$z'' = ...' (the '' closes the string and silently drops both primes).
Run before every build/update script; exits 1 on any finding."""
import sys, tokenize
bad = 0
for f in sys.argv[1:]:
    toks = [t for t in tokenize.generate_tokens(open(f).readline)
            if t.type not in (tokenize.NL, tokenize.NEWLINE, tokenize.COMMENT)]
    for a, b in zip(toks, toks[1:]):
        if a.type == tokenize.STRING and b.type == tokenize.STRING:
            bad += 1
            print(f'{f}:{a.start[0]}: implicit string concatenation: {a.string[:50]} {b.string[:30]}')
sys.exit(1 if bad else 0)
