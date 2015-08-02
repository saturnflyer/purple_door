class TweetsController < ApplicationController
  TOPIC_SCORE = {
    emotional_discomfort: {score: -5, words: ["feel", "time", "reason", "depress", "moment", "bad", "change", "comfortable", "wrong", "lonely", "feeling", "idea", "lose", "guilty", "emotion", "confuse", "realize", "top", "comfort", "happen"]},
    negative_affect: {score:-5, words: ["suck", "damn", "stupid", "hate", "hell", "drink", "shit", "fuck", "doe", "crap", "smoke", "piss", "bad", "kid", "drug", "freak", "screw", "crazy", "break", "bitch"]},
    emotional_distress: {score:-5, words: ["hate", "doe", "sick", "feel", "bad", "hurt", "wrong", "care", "happen", "mess", "horrible", "stupid", "mad", "leave", "worse", "anymore", "hard", "deal", "cry", "suppose"]},
    treatment:{score: 3, words:["medication", "side-effects", "doctor", "doses", "effective","prescribed", "therapy", "inhibitor", "stimulant", "antidepressant", "patients", "neurotransmitters", "prescriptions","psychotherapy", "diagnosis", "clinical", "pills", "chemical", "counteract", "toxicity", "hospitalization", "sedative"]},
    disclosure: {score: 5, words:["fun", "play", "helped", "god", "answer", "wants", "leave", "beautiful", "suffer", "sorry", "tolerance", "agree", "hate", "helpful", "haha", "enjoy", "social", "talk", "save", "win", "care", "love", "like", "hold", "cope", "amazing", "discuss"]},
    relationship: {score: 5, words: ["home", "woman", "she", "him", "girl", "game", "men", "friends", "sexual", "boy", "someone", "movie", "favorite", "jesus", "house", "music", "religion", "her", "songs", "party", "bible", "relationship", "hell", "young", "style", "church", "lord", "father", "season", "heaven", "dating"]},
    symptoms:{ score: -3, words:["anxiety", "withdrawal", "severe", "delusions", "adhd", "insomnia", "drowsiness", "suicidal", "dizziness", "nausea", "episodes", "attacks",  "addictive", "weaned", "swings", "dysfunction","irritability", "headache", "fatigue","imbalance", "nervousness", "psychosis", "drowsy"]}
  }

  def index

  end

  def show
    @tweets = Tweet.parse_tweets("@" + params[:handle])["tweets"].map do |t|
      t.gsub("\n", " ")
    end

    @hits = Hash.new(0)
    @score = 0

    @tweets.each do |t|
      t.split(" ").each do |word|
        TOPIC_SCORE.each do |key, value|
          if value[:words].include?(word)
            @score += value[:score]
            @hits[key] += 1
          end
        end
      end
    end

    @count = @tweets.count

    #File.open("tweets.txt", "w+") do |f|
    #f.puts(@tweets)
    #end

    #result = eval(`python tweet.py tweets.txt`)
    #puts result
  end
end
