from p2m import _check_text
bad = {'theorem_title': 'z(' + chr(9) + 'au)'}
try:
    _check_text(bad); print('NOT REFUSED — guard broken')
except SystemExit as e:
    print('refused:', e)
