# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Demyst::Output::Yaml do
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
    it 'prints yaml to output' do
      expect { subject.to output(response.to_yaml).to_stdout }
    end
  end
end
