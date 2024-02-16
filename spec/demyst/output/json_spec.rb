# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Demyst::Output::Json do
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
    it 'prints json to output' do
      expect { subject.to output(JSON.pretty_generate(response)).to_stdout }
    end
  end
end
