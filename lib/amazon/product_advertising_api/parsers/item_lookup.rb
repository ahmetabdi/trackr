module Amazon::ProductAdvertisingApi::Parsers
  class ItemLookup
    attr_accessor :xml_body

    def initialize(xml_body)
      @xml_body = Oga.parse_xml(xml_body)
    end

    def errors?
      xml_body.at_xpath('ItemLookupErrorResponse/Error').try(:text).try(:present?) || false
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

    def brand
      find_single("#{item_path}/ItemAttributes/Brand").text
    end

    def features
      find_multiple("#{item_path}/ItemAttributes/Feature").map(&:text)
    end

    def product_type_name
      find_single("#{item_path}/ItemAttributes/ProductTypeName").text
    end

    def binding
      find_single("#{item_path}/ItemAttributes/Binding").text
    end

    def adult_product
      find_single("#{item_path}/ItemAttributes/IsAdultProduct").text == "1"
    end

    def model
      find_single("#{item_path}/ItemAttributes/model").text
    end

    def ean
      find_single("#{item_path}/ItemAttributes/ean").text
    end

    def upc
      find_single("#{item_path}/ItemAttributes/upc").text
    end

    def studio
      find_single("#{item_path}/ItemAttributes/Studio").text
    end

    def size_of_item
      find_single("#{item_path}/ItemAttributes/Size").text
    end

    def total_new
      find_single("#{item_path}/OfferSummary/TotalNew").text.to_i
    end

    def total_used
      find_single("#{item_path}/OfferSummary/TotalUsed").text.to_i
    end

    def total_collectible
      find_single("#{item_path}/OfferSummary/TotalCollectible").text.to_i
    end

    def total_refurbished
      find_single("#{item_path}/OfferSummary/TotalRefurbished").text.to_i
    end

    def package_quantity
      find_single("#{item_path}/ItemAttributes/PackageQuantity").text.to_i
    end

    def part_number
      find_single("#{item_path}/ItemAttributes/PartNumber").text
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

    def variant_images
      find_multiple("#{item_path}/ImageSets/ImageSet").map do |image_set|
        {
          swatch_image:    find_single('SwatchImage/URL', image_set).text,
          small_image:     find_single('SmallImage/URL', image_set).text,
          thumbnail_image: find_single('ThumbnailImage/URL', image_set).text,
          tiny_image:      find_single('TinyImage/URL', image_set).text,
          medium_image:    find_single('MediumImage/URL', image_set).text,
          large_image:     find_single('LargeImage/URL', image_set).text
        }
      end
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
        amount:           find_single("#{item_path}/ItemAttributes/ListPrice/Amount").text,
        currency_code:    find_single("#{item_path}/ItemAttributes/ListPrice/CurrencyCode").text,
        formatted_price:  find_single("#{item_path}/ItemAttributes/ListPrice/FormattedPrice").text
      }
    end

    def similar_products
      find_multiple("#{item_path}/SimilarProducts/SimilarProduct").map do |product|
        find_single('ASIN', product).text
      end
    end

    def tags
      find_multiple("#{item_path}/BrowseNodes/BrowseNode").map do |node|
        find_single('Name', node).text
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
