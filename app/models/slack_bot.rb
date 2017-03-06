class SlackBot
  def self.recent_rounds_notification
    rounds = Round.where(created_at: 24.hours.ago..Time.now)

    return if rounds.empty?

    client = Slack::Web::Client.new

    rounds.each do |round|
      scorecards = round.scorecards.sort_by(&:strokes)
      user_ids = [33,34,53,73,76]
      next if (scorecards.map(&:user_id) & user_ids).empty?

      complete, incomplete = scorecards.partition(&:completed?)

      fields1 = complete.map do |scorecard|
        score = if scorecard.total_score > 0
          "+#{scorecard.total_score}"
        elsif scorecard.total_score == 0
          "Even"
        else
          scorecard.total_score
        end

        {
          title: "#{[scorecard.user.first_name, scorecard.user.last_name].join(' ')}",
          value: "#{scorecard.strokes} (#{score})",
          short: true
        }
      end

      fields2 = incomplete.map do |scorecard|
        score = if scorecard.total_score > 0
          "+#{scorecard.total_score}"
        elsif scorecard.total_score == 0
          "Even"
        else
          scorecard.total_score
        end

        {
          title: "#{[scorecard.user.first_name, scorecard.user.last_name].join(' ')}",
          value: "#{scorecard.strokes} (#{score}, played #{scorecard.turns.played.count} holes)",
          short: true
        }
      end

      fields = fields1 + fields2

      client.chat_postMessage(
        channel: '#disc-golf',
        attachments: [
          {
            fallback: "A recent round of disc golf was played in #{[round.course.city, round.course.state].join(', ')}!",
            pretext: "A recent round of disc golf was played!",
            title: "#{round.course.name} - #{round.created_at.strftime('%b %d, %Y')}",
            title_link: "http://frolfr.com/public/rounds/#{round.id}",
            fields: fields
          }
        ],
        as_user: true
      )
    end
  end
end
