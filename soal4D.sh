
#!/bin/bash

hour=${1:0:2}
cat "$1$2" | xxd -p -c1 | awk -v r=$hour '
function hex2dec(h,i,x,v){
  h=tolower(h);sub(/^0x/,"",h)
  for(i=1;i<=length(h);++i){
    x=index("0123456789abcdef",substr(h,i,1))
    if(!x)return "NaN"
    v=(16*v)+x-1
  }
  return v
}
BEGIN { hour = strtonum(r) }
{
	$1 = hex2dec(0x$1)
	if ($1 >= 65 && $1 <= 90) {
		$1 = $1 - 64
		$1 = ($1 - hour) % 27
		while ($1 < 1)
			$1 = $1 + 27
		$1 = $1 + 64
	}
	if ($1 >= 97 && $1 <= 122) {
		$1 = $1 - 96
		$1 = ($1 - hour) % 27
		while ($1 < 1)
			$1 = $1 + 27
		$1 = $1 + 96
	}
	printf("%c", $1)
}
' > /home/hafidzasqalany28/modul1/decrypted_"$1$2"
