# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Demyst::Output::Plain do
  let(:subject) { described_class.call(data) }

  let(:data) do
    [
      {
        title: 'test',
        completed: true
      },
      {
        title: 'second',
        completed: false
      }
    ]
  end

  describe '.call' do
    it 'outputs plain string to stdout' do
      expect { subject.to output('title: test').to_stdout }
    end
  end
end
