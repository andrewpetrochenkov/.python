# python3 -m pip install -r ~/git/REPO/requirements.txt

for d in ~/git/*/; do
    cd "$d" || exit
    [ -e requirements.txt ] && ( set -x; python3 -m pip install -r "$PWD"/requirements.txt )
done
