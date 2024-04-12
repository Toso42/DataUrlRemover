#!/bin/bash
echo ".css file name"
read file
cp $file backup.css

mkdir -p svg
echo "modifying $file"
grep -o 'url("data[^"]*' $file | while read -r line ; do

    svg_data=$(echo "$line" | sed 's/^url("data:image\/svg+xml,//' | node -e "process.stdin.on('data', d => console.log(decodeURIComponent(d.toString())))")
    filename=$(echo "$svg_data" | md5sum | awk '{ print $1 }')
	echo "svg { $svg_data } >> filename { svg/ $filename .png }"
    echo "$svg_data" > "svg/$filename.svg"
    convert "svg/$filename.svg" "svg/$filename.png"
    sed -i "s|$line|url('./svg/$filename.png')|g" bootstrap.css
done
