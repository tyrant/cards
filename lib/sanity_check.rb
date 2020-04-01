require_relative './card'

class SanityCheck

  attr_accessor :cards
  attr_accessor :bad_cards

  def initialize(cards_text)
    raise ArgumentError.new("Oh come on, stop messing around") unless cards_text.is_a?(String)

    @cards, @bad_cards = [], []

    cards_text.split("\n").each do |possibly_card_number|
      begin
        @cards << Card.new(possibly_card_number)
      rescue ArgumentError => e
        @bad_cards << "Error with #{possibly_card_number}: #{e.message}"
      end
    end
  end

  def perform_checks
    if @bad_cards.length == 0
      card_checks
    else
      "#{ card_checks }\n\n#{ @bad_cards.join("\n") }"
    end
  end

  private

  def card_checks
    @cards.map do |card|
      "#{ card.type }: #{ card.card_number } (#{ card.validity })"
    end.join("\n")
  end
end