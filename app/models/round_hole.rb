class RoundHole
  attr_reader :round, :hole, :turns

  def initialize(round:, hole:)
    @round = round
    @hole = hole
  end

  def turns
    @turns ||= round.turns_for_hole(hole)
  end

  def update(params)
    par = params[:par]
    results = params[:results]

    turns.each do |turn|
      score = results[turn.id.to_s]
      turn.update(par: par, score: score)
    end
  end
end
