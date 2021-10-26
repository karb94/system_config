#! /bin/sh

# exit when any command fails
set -e

script_path=$(dirname $0)

rm -f "$script_path"/../x86_64/*
repo-add "$script_path"/../x86_64/system_config.db.tar.gz
# build packages
for d in "$script_path"/../builds/*
do
  (
    cd "$d" &&
    makepkg \
      --force \
      --nodeps \
      --clean \
      --cleanbuild \
      PKGDEST=../../x86_64
    rm -rf "$d"/src
  )
done

# add packages to database
cd ../x86_64/
repo-add -R *db.tar.gz *pkg.tar.zst

# updated repo
git add "$script_path"/../x86_64/*.pkg.tar.zst
git commit -am 'New repo update'
git push
