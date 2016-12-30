require("open-uri")
require("oga")

urls = [
  "http://www.ebay.com/itm/Santa-Cruz-Longboard-Rasta-Lion-God-Drop-Through-Cruzer-Skateboard-40-Complete-/332073552119?hash=item4d512048f7:g:v9kAAOSwOtdYTfzf",
  "http://www.ebay.com/itm/Sector-9-Longboard-Complete-/132046431395?hash=item1ebe94a4a3:g:GoIAAOSw44BYYrmr",
  "http://www.ebay.com/itm/globe-longboard-/252694262358?hash=item3ad5c07256:g:OdUAAOSwImRYVD5N"
]

urls.each do |url|
    page = open(url)
    doc = Oga.parse_html(page)

    bid_price_element = doc.css("#prcIsum_bidPrice").first()
    bid_price = bid_price_element.text()

    title_element = doc.css("#itemTitle").first()
    title = title_element.text().sub(/Details about[^0-9a-z]+/i, "")

    number_of_bids_element = doc.css("#qty-test").first
    number_of_bids = number_of_bids_element.text()

    puts("Title: #{title}")
    puts("Bid Price: #{bid_price}")
    puts("Number of Bids: #{number_of_bids}")
end