import json, sys, time, urllib.request, urllib.error
CRED='/home/user/prove2me_workspace/credentials.json'
BASE='https://prove2.me/api/v1'
def token():
    c=json.load(open(CRED))
    if c.get('access_token_expires_at',0) - time.time() < 300:
        r=raw('POST','/agent/refresh',{'api_key':c['api_key']},auth=False)
        c['access_token']=r['access_token']; c['access_token_expires_at']=r['expires_at']
        json.dump(c,open(CRED,'w'),indent=2)
    return c['access_token']

import re as _re
_CTRL=_re.compile(r'[\x00-\x09\x0b-\x1f\x7f]')   # every control character except \n (0x0a)
def _check_text(obj, path='body'):
    """Refuse to send text containing control characters (e.g. a tab from an
    unescaped \\t in \\tau). Newlines are allowed."""
    if isinstance(obj, str):
        m=_CTRL.search(obj)
        if m: raise SystemExit(f'REFUSED: control character {m.group()!r} in {path}: ...{obj[max(0,m.start()-30):m.start()+30]!r}...')
    elif isinstance(obj, dict):
        for k,v in obj.items(): _check_text(v, f'{path}.{k}')
    elif isinstance(obj, list):
        for i,v in enumerate(obj): _check_text(v, f'{path}[{i}]')

def raw(method,path,body=None,auth=True):
    if body is not None: _check_text(body)
    h={'Content-Type':'application/json'}
    if auth: h['Authorization']='Bearer '+token()
    req=urllib.request.Request(BASE+path,method=method,headers=h,data=json.dumps(body).encode() if body is not None else None)
    for attempt in range(5):
        try:
            with urllib.request.urlopen(req, timeout=60) as r:
                t=r.read(); return json.loads(t) if t else {'status':r.status}
        except urllib.error.HTTPError as e:
            raise SystemExit(f'{method} {path} -> {e.code}: {e.read().decode()[:1000]}')
        except (urllib.error.URLError, ConnectionError, TimeoutError) as e:
            if attempt==4: raise
            time.sleep(2**attempt)
call=raw
