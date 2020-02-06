# check

Check is a simple script for signing in and out each day. I created it to
easily track my working hours each day.

Previously I used Emac's org-mode but I found it a little fiddly for my simple
needs. What's worse, I spend a lot of my time using Vim in a VM so I'm not in
Emacs as much.

Check is much easier to use because it only handles the simple case of checking
in and out each day.

```
chmod u+x check
cp check /usr/local/bin/check
check in
check out
```

It assumes the directory `~/hours` exists so make that if necessary.

Contributions welcome.
