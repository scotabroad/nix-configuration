function handle {
  if [[ ${1:0:12} == "submap>>move" ]]; then
    echo '{"text":"󰆾","tooltip":"Press Esc to escape","class":"selected"}'
  else if [[ ${1:0:14} == "submap>>resize" ]]; then
         echo '{"text":"󰆾","tooltip":"Disabled","class":"disabled"}'
       else if [[ ${1:0:6} == "submap" ]]; then
              echo '{"text":"󰆾","tooltip":"Click to enter move mode"}'
	    fi
       fi
  fi
}

echo '{"text":"󰆾","tooltip":"Click to enter move mode"}'
socat -u UNIX-CONNECT:/tmp/hypr/$(echo $HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock - | while read line; do handle $line; done
