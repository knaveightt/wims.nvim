#!/usr/bin/env bash
#
# glyphlist.sh
# by John Osinski
#
# Produces a .lua file that lists all glyphs in a Nerd Font font 
# using the following lua table format:
#    {
#     <glyph_character>:<unicode_codepoint>:<nerd_font_glyph_name>,
#    }
# The source file used is the glyphnames.json file in the 
# ryanoasis/nerd-fonts repository.
#########################################

GLYPHFILE="glyphnames.json"
GLYPHFILETEMP="g_tmp.txt"
GLYPHFILEOUTPUT="symbol_list.lua"

# add the beginning of the lua file
echo "local symbol_list = {" > $GLYPHFILEOUTPUT

# produce a temp file that will be parsed
cat $GLYPHFILE | sed 's/},/}\n/g' | tail -n +2 > $GLYPHFILETEMP

# capture the relevant data from each line in the defined format
while IFS= read -r line; do
    glyph_char=$(echo "$line" | awk -F ":" '{print $3}' | awk '{print substr($0, 2, 1)}')
    glyph_code=$(echo "$line" | awk -F ":" '{print $4}' | sed 's/["}]//g')
    glyph_name=$(echo "$line" | awk -F ":" '{print $1}' | sed 's/"//g')

    glyph_file_line="\"$glyph_char:$glyph_code:$glyph_name\","
    echo "$glyph_file_line" >> $GLYPHFILEOUTPUT
done < $GLYPHFILETEMP

# add the end of the lua file
echo "}" >> $GLYPHFILEOUTPUT
echo "return symbol_list" >> $GLYPHFILEOUTPUT

rm $GLYPHFILETEMP
