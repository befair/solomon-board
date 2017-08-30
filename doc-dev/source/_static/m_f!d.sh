for x in *; do
   if ! [ -d "$x" ]; then
     mv -- "$x" $1
   fi
done
