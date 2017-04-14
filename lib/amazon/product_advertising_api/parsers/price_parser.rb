# CURRENTLY NOT USED
# # TODO: Parse individual prices from Amazon offers page and store against a
# # product for looking up different prices.
# module Amazon
#   module ProductAdvertisingApi
#     module Parsers
#       class PriceParser
#         attr_accessor :url

#         def initialize(url)
#           @url = clean_params(url)
#         end

#         def self.run(url)
#           new(url).parse
#         end

#         def parse
#           body = HTTP.get(url).to_s
#           html_doc = Nokogiri::HTML(body)
#           html_doc.css('.olpOffer').each do |offer|
#             puts offer.at_css('.olpOfferPrice').text.strip.inspect
#             puts offer.at_css('.olpCondition').text.strip.inspect
#             puts offer.at_css('.olpSellerName').text.strip.inspect
#           end
#         end

#         private

#         def clean_params(url)
#           uri = URI(url)
#           params = CGI.parse(uri.query)
#           params.delete('SubscriptionId')
#           params.delete('tag')
#           params.delete('linkCode')
#           params.delete('camp')
#           params.delete('creative')
#           params.delete('creativeASIN')
#           uri.query = URI.encode_www_form(params)
#           uri.to_s
#         end
#       end
#     end
#   end
# end
