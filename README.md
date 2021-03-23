# Figuring out how to debug Python dependencies when using poetry2nix


If I am using Poetry directly, and I need to debug a dependency, I can edit its source directly to add a `pdb.set_trace`, like so:

```bash
➜  poetry2nix_dependencies git:(main) ✗ poetry install
Installing dependencies from lock file

Package operations: 5 installs, 0 updates, 0 removals

  • Installing certifi (2020.12.5)
  • Installing chardet (4.0.0)
  • Installing idna (2.10)
  • Installing urllib3 (1.26.4)
  • Installing requests (2.25.1)

➜  poetry2nix_dependencies git:(main) ✗ poetry env info

Virtualenv
Python:         3.8.6
Implementation: CPython
Path:           /Users/zupo/Library/Caches/pypoetry/virtualenvs/my-app-OVxmzcZI-py3.8
Valid:          True

➜  poetry2nix_dependencies git:(main) ✗ vim /Users/zupo/Library/Caches/pypoetry/virtualenvs/my-app-OVxmzcZI-py3.8/lib/python3.8/site-packages/requests/auth.py
```

However, when using poetry2nix, all dependencies are installed in Nix store, which is read only, so I cannot just drop a `pdb.set_trace` into their source. What is the recommended way to "develop" a dependency in a poetry2nix project?

```
➜  poetry2nix_dependencies git:(main) ✗ which python
/nix/store/5wx6i7bpnm3a7hcz8xn2rzz6x5gpa1ki-python3-3.8.6-env/bin/python
➜  poetry2nix_dependencies git:(main) ✗ vim /nix/store/5wx6i7bpnm3a7hcz8xn2rzz6x5gpa1ki-python3-3.8.6-env/lib/python3.8/site-packages/requests/auth.py
# --> read-only file
```
