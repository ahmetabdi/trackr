module Amazon::ProductAdvertisingApi::Parsers
  class ItemLookup
    attr_accessor :xml_body

    def initialize(xml_body)
      @xml_body = Oga.parse_xml(xml_body)
    end

    def errors?
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
      find_single('ItemLookupResponse/Items/Request/IsValid').try(:text) == 'True'
    end

    def title
      find_single("#{item_path}/ItemAttributes/Title").text
    end

    def product_group
      find_single("#{item_path}/ItemAttributes/ProductGroup").text
    end

    def manufacturer
      find_single("#{item_path}/ItemAttributes/Manufacturer").text
    end

    def asin
      find_single("#{item_path}/ASIN").text
    end

    def parent_asin
      find_single("#{item_path}/ParentASIN").text
    end

    def detail_page_url
      find_single("#{item_path}/DetailPageURL").text
    end

    def sales_rank
      find_single("#{item_path}/SalesRank").text
    end

    def main_image
      {
        large:  find_single("#{item_path}/LargeImage/URL").text,
        medium: find_single("#{item_path}/MediumImage/URL").text,
        small:  find_single("#{item_path}/SmallImage/URL").text
      }
    end

    def add_to_wishlist_url
      find_multiple("#{item_path}/ItemLinks/ItemLink")[0].at_xpath('URL').text
    end

    def tell_a_friend_url
      find_multiple("#{item_path}/ItemLinks/ItemLink")[1].at_xpath('URL').text
    end

    def customer_reviews_url
      find_multiple("#{item_path}/ItemLinks/ItemLink")[2].at_xpath('URL').text
    end

    def all_offers_url
      find_multiple("#{item_path}/ItemLinks/ItemLink")[3].at_xpath('URL').text
    end

    def list_price
      {
        amount:           find_single("#{item_path}/ItemAttributes/Manufacturer/ListPrice/Amount").text,
        currency_code:    find_single("#{item_path}/ItemAttributes/Manufacturer/ListPrice/CurrencyCode").text,
        formatted_price:  find_single("#{item_path}/ItemAttributes/Manufacturer/ListPrice/FormattedPrice").text
      }
    end

    def similar_products
      find_multiple("#{item_path}/SimilarProducts/SimilarProduct").map do |product|
        {
          title: find_single('Title', product).text,
          asin:  find_single('ASIN', product).text
        }
      end
    end

    private

    def item_path
      'ItemLookupResponse/Items/Item'
    end

    def find_single(element, xml = xml_body)
      xml.at_xpath(element)
    end

    def find_multiple(elements, xml = xml_body)
      xml.xpath(elements)
    end
  end
end
