set -e
OUT=""
INPUT=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
while read LINE; do
	if [[ "$LINE" =~ ^Volume:.([0-9]+)\.([0-9]{2})(([[:blank:]]\[MUTED\])?)$ ]]; then
        if [[ -n "$OUT" ]]; then
	    OUT+=" " #if this just adds a space in front, remove
	fi
	# BASH_REMATCH
	# [0] = the whole match
	# [1] = the AAAA part of volume
	# [2] = the BB part of volume
	# [3] = the MUTED part when found
	if [[ -n "${BASH_REMATCH[3]}" ]]; then
	    OUT+="婢 Mute"
	else
	    # Numbers beginning with 0 are read as octal
	    # Use 10#0BB to force reading as decimal
	    volume=$(( 10#${BASH_REMATCH[1]}${BASH_REMATCH[2]}))
	    
	    if [[ $volume -gt 50 ]]; then
		OUT+=" $volume%%"
	    elif [[ $volume -gt 25 ]]; then
		OUT+=" $volume%%" 
	    elif [[ $volume -gt 0 ]]; then
		OUT+=" $volume%%"
	    else
	        OUT+="婢 $volume%%"
	    fi	
	fi
    else
	echo "Warning: Failed to match output of wpctl: '$LINE'" >&2
	exit 1
    fi
done <<<"$INPUT"
if [[ -n "$OUT" ]]; then
    printf "$OUT\n"
fi
exit 0
