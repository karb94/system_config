#! /bin/sh

script_path=$(dirname $0)

for d in "$script_path"/../builds/*
do
  ( cd "$d" && makepkg -fcC PKGDEST=../../x86_64 )#; rm -rf "$d"/src )
done

cd ../x86_64/
repo-add -n -R *db.tar.gz *pkg.tar.zst
