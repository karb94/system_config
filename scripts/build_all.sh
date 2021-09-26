for d in ../builds/*
do
  ( cd "$d" && makepkg -cC PKGDEST=../../x86_64 )
done
