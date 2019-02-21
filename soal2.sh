#!/bin/bash
 
awk -F "," '{
	if ($7 == "2012"){
		 total[$1] = total[$1] + $10
	}
        if ($7 == "2012" && $1 == "United States") {
		productline[$4] = productline[$4] + $10 
	}
	if ($7 == "2012" && $1 == "United States" && $4 == "Personal Accessories") {
		product1[$6] = product1[$6] + $10
	}
	if ($7 == "2012" && $1 == "United States" && $4 == "Camping Equipment") {
		product2[$6] = product2[$6] + $10
	}
	if ($7 == "2012" && $1 == "United States" && $4 == "Outdoor Protection") {
		product3[$6] = product3[$6] + $10
	}
}
END {
	max=0
	for (i in total) {
		if (total[i] > max) {
			max = total[i]
			negara = i
			#print i,total[i]
		}
	}
	print "a)", negara, max
	maxpl1=0
	maxpl2=0
	maxpl3=0
	pl1=0
	pl2=0
	pl3=0
	for (i in productline) {
		if (productline[i] > maxpl1) {
			maxpl3 = maxpl2
			maxpl2 = maxpl1
			maxpl1 = productline[i]
			pl3 = pl2
			pl2 = pl1
			pl1 = i
		}
		else if (productline[i] > maxpl2) {
			maxpl3 = maxpl2
			maxpl2 = productline[i]
			pl3 = pl2
			pl2 = i
		}
		else if (productline[i] > maxpl3) {
			maxpl3 = productline[i]
			pl3 = i
		}
	} 
	print "b)", pl1, maxpl1
	print "  ", pl2, maxpl2
	print "  ", pl3, maxpl3
	#print i,  productline[i]
	prodk1=0
	prodk2=0
	prodk3=0
	maxprodk1=0
	maxprodk2=0
	maxprodk3=0
	for (i in product1) {
		if (product1[i] > maxprodk1) {
			maxprodk1 = product1[i]
			prodk1 = i
		}
	}
	for (i in product2) {
		if (product2[i] > maxprodk2) {
			maxprodk2 = product2[i]
			prodk2 = i
		}
	}
	for (i in product3) {
		if (product3[i] > maxprodk3) {
			maxprodk3 = product3[i]
			prodk3 = i
		}
	}
	print "c) Personal Accessories, dengan produk =", prodk1, maxprodk1
	print "   Camping Equipment, dengan produk =", prodk2, maxprodk2
	print "	  Outdoor Protection, dengan produk =", prodk3, maxprodk3
}
' WA_Sales_Products_2012-14.csv
