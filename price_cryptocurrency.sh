#!/bin/bash

 ############################################################### #####################
 #Script Name: price criptocurrency 
 #Description : a shell script designed to scrape the dollar price of a specific cryptocurrency from
 # the website https://www.coingecko.com/en and print it to the terminal.
 # to run:
 #	chmod +x price_crypto_bash.sh
 #	./price_crypto_bash.sh
 #Args: crypto name
 #Author: Rafael Andrade Lamonier
 #Email: rafaellamonier17@hotmail.com
 ############################################################### #####################


function strip_html(){
	grep -oP '(?<=<span class="no-wrap" data-price-btc).*?(?=</span>)' $output >temp.txt

	sed -i 's/[^>]*>//g' temp.txt >$output
	sed -ni '1p' temp.txt >$output
	cp temp.txt $output
	rm temp.txt
}
function print(){
	while read price
	do
		val=$price
	done <$output
	echo "The price of $coin is = $val"
}

read -p "enter the coin code: " coin
url='https://www.coingecko.com/en/coins/'$coin''
output=price.txt
touch $output temp.txt
curl -o $output $url
strip_html
print
