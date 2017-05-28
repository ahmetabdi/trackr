# frozen_string_literal: true

# Example products (ASINS)
%w[B01AX72ZTI B01M65RD19 B00Q2Z11QE B01AW2KE4M B00ZG1S816 B00NQT48NM
   B01691M0QA B00CM1KU82 1781252858 B00SB4DJTG B00TF6TKB0 B01DNDHLZM
   B01ETRIFOW B00K7EQXIW B013UDL58E B00OE45MVK B01L70M6K8 B06XPTNS8C
   B00Y3TM6CO B01LZJ02KT B01CD5VC92 1843266164 B01CL3YWU2 B00VH84L5E
   B001FQL2HI B00K8S8OXO B00QM9VKEI B003539SBG B01N0NU0TW B01HB5GYN8
   B006QW7Z7M B00IJF6AI4].each do |asin|

  ProductImporterJob.perform_later(asin)
end
