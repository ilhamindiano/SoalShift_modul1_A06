#!/bin/bash
 
awk -F "," '{
	if ($7 == "2012"){
		 total[$1] = total[$1] + $10
	}
        if ($7 == "2012" && $1 == "United States") {
		productline[$4] = productline[$4] + $10 
	}
	if ($7 == "2012" && $1 == "United States" && ($4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 == "Outdoor Protection")) {
		product[$6] = product[$6] + $10
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
	for (i in product) {
		if (product[i] > maxprodk1) {
			maxprodk3 = maxprodk2
			maxprodk2 = maxprodk1
			maxprodk1 = product[i]
			prodk1 = prodk2
			prodk2 = prodk1
			prodk1 = i
		}
		else if (product[i] > maxprodk2) {
			maxprodk3 = maxprodk2
			maxprodk2 = product[i]
			prodk3 = prodk2
			prodk2 = i
		}
		else if (product[i] > maxprodk3) {
			maxprodk3 = product[i]
			prodk3 = i
		}
	}
	print "c)" prodk1, maxprodk1
	print      prodk2, maxprodk2
	print 	   prodk3, maxprodk3
}
' WA_Sales_Products_2012-14.csv
