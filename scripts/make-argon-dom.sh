#!/bin/sh

if [ ! -f "database.msgpack" ] || [ ! -f "allValues.json" ]; then
  echo "Artifacts are missing, run 'scripts/generate-artifacts.sh' first!"
  exit 1
fi

rm -rf Dom

cp -r rbx_dom_lua/src Dom

find ./Dom -name "*.spec*" -exec rm -f {} \;
find ./Dom -name "*.json" -exec rm -f {} \;

cp allValues.json Dom
cp database.msgpack Dom

for file in Dom/*.lua; do
  mv -- "$file" "${file%.lua}.luau"
done

echo "Argon 'Dom' directory created!"
