# Nicely formatted overview of the entire tree:
git log --graph --oneline --decorate --all

# Show the list of changed files:
git <diff ... or show ...> | sed -n 's|^+++ ./||p'

# Show the list of newly added files:
git <diff ... or show ...> | sed -n '/^--- \/dev\/null/{n;s|^+++ ./||p;}'

# Show the list of changed files only (excluding the newly added ones):
git <diff ... or show ...> | sed -n '/^--- [^\(\/dev\/null\)]/{n;s|^+++ ./||p;}'
