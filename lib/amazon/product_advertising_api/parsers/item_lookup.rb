module Amazon::ProductAdvertisingApi::Parsers
  class ItemLookup
    attr_accessor :xml_body

    def initialize(xml_body)
      @xml_body = Oga.parse_xml(xml_body)
    end

    def errors?
      raise xml_body.at_xpath('ItemLookupErrorResponse/Error').text.inspect
      xml_body.at_xpath('ItemLookupErrorResponse/Error').text.present?
    end

    def error_messages
      return nil unless errors?
      {
        code: xml_body.at_xpath('ItemLookupErrorResponse/Error/Code').text,
        message: xml_body.at_xpath('ItemLookupErrorResponse/Error/Message').text
      }
    end

    def valid?
      xml_body.at_xpath('ItemLookupResponse/Items/Request/IsValid').try(:text) == 'True'
    end

    def title
      xml_body.at_xpath('ItemLookupResponse/Items/Item/ItemAttributes/Title').text
    end

    def product_group
      xml_body.at_xpath('ItemLookupResponse/Items/Item/ItemAttributes/ProductGroup').text
    end

    def manufacturer
      xml_body.at_xpath('ItemLookupResponse/Items/Item/ItemAttributes/Manufacturer').text
    end

    def asin
      xml_body.at_xpath('ItemLookupResponse/Items/Item/ASIN').text
    end

    def parent_asin
      xml_body.at_xpath('ItemLookupResponse/Items/Item/ParentASIN').text
    end

    def detail_page_url
      xml_body.at_xpath('ItemLookupResponse/Items/Item/DetailPageURL').text
    end

    def sales_rank
      xml_body.at_xpath('ItemLookupResponse/Items/Item/SalesRank').text
    end

    def main_image
      {
        large:  xml_body.at_xpath('ItemLookupResponse/Items/Item/LargeImage/URL').text,
        medium: xml_body.at_xpath('ItemLookupResponse/Items/Item/MediumImage/URL').text,
        small:  xml_body.at_xpath('ItemLookupResponse/Items/Item/SmallImage/URL').text
      }
    end

    def share_urls
      {
        add_to_wishlist:  xml_body.xpath('ItemLookupResponse/Items/Item/ItemLinks/ItemLink')[0].at_xpath('URL').text,
        tell_a_friend:    xml_body.xpath('ItemLookupResponse/Items/Item/ItemLinks/ItemLink')[1].at_xpath('URL').text,
        customer_reviews: xml_body.xpath('ItemLookupResponse/Items/Item/ItemLinks/ItemLink')[2].at_xpath('URL').text,
        all_offers:       xml_body.xpath('ItemLookupResponse/Items/Item/ItemLinks/ItemLink')[3].at_xpath('URL').text
      }
    end

    def list_price
      {
        amount:           xml_body.at_xpath('ItemLookupResponse/Items/Item/ItemAttributes/Manufacturer/ListPrice/Amount').text,
        currency_code:    xml_body.at_xpath('ItemLookupResponse/Items/Item/ItemAttributes/Manufacturer/ListPrice/CurrencyCode').text,
        formatted_price:  xml_body.at_xpath('ItemLookupResponse/Items/Item/ItemAttributes/Manufacturer/ListPrice/FormattedPrice').text
      }
    end

    def similar_products
      xml_body.xpath('ItemLookupResponse/Items/Item/SimilarProducts/SimilarProduct').map do |product|
        {
          title: product.at_xpath('Title').text,
          asin:  product.at_xpath('ASIN').text
        }
      end
    end
  end
end
