# frozen_string_literal: true

module Spree
  class Printables::Order::InvoiceView < Printables::Invoice::BaseView
    def items
      printable.line_items.map do |item|
        Spree::Printables::Invoice::Item.new(
          sku: item.variant.sku,
          name: item.variant.name,
          options_text: item.variant.options_text,
          price: item.price,
          quantity: item.quantity,
          total: item.total
        )
      end
    end

    def firstname
      printable.tax_address.firstname
    end

    def lastname
      printable.tax_address.lastname
    end

    def email
      @printable.email
    end

    def bill_address
      @printable.bill_address
    end

    def ship_address
      @printable.ship_address
    end

    def tax_address
      @printable.tax_address
    end

    def item_total
      @printable.item_total
    end

    def total
      @printable.total
    end

    def payments
      @printable.payments
    end

    def shipments
      @printable.shipments
    end

    private

    def all_adjustments
      printable.all_adjustments.eligible
    end
  end
end
