require 'rspec'

class Actor
  def initialize(name)
    @name = name
  end

  def ready?
    sleep(3)
    true
  end

  def act
    'I love you baby'
  end

  def fall_off_ladder
    'Call my agent no way!'
  end

  def light_on_fire
    false
  end
end

class Movie
  attr_reader :actor

  def initialize(actor)
    @actor = actor
  end

  def start_shooting
    if actor.ready?
      actor.act
      actor.fall_off_ladder
      actor.light_on_fire
      actor.act
    end
  end
end

RSpec.describe Movie do
  let(:stuntman) { double("Mr Danger", ready?: true, act: 'Any string at all', light_on_fire: true, fall_off_ladder: 'No problem') }
  subject { described_class.new(stuntman) }

  describe ':start_shooting method' do
    it 'expects an actor to do 3 actions' do
      expect(stuntman).to receive(:act).at_most(2).times

      subject.start_shooting
    end
  end
end
