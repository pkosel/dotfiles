#!/usr/bin/env bash

cachedir="/home/philipp/.cache/paru/clone"

removed="$(comm -23 <(basename -a $(find $cachedir -mindepth 1 -maxdepth 1 -type d) | sort) <(pacman -Qqm) | xargs -r printf "$cachedir/%s\n")"

# Remove paru cache for foreign packages that are not installed anymore
rm -rf $removed

pkgcache="$(find $cachedir -mindepth 1 -maxdepth 1 -type d | xargs -r printf "-c %s\n")"

# Remove everything for uninstalled foreign packages, keep latest version for uninstalled native packages, keep two latest versions for installed packages
/usr/bin/paccache -rvuk0 $pkgcache
/usr/bin/paccache -rvuk1
/usr/bin/paccache -rvk2 -c /var/cache/pacman/pkg $pkgcache

