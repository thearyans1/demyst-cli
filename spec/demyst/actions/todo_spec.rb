# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Demyst::Actions::Todo do
  subject { described_class.call({ total:, output: }) }

  let(:total) { 10 }
  let(:output) { 'json' }

  describe '.call' do
    it 'uses the specified output format and calls the HTTP client' do
      expect(Demyst::Client).to receive(:call).with(a_kind_of(Array)).and_return([])
      expect(Demyst::Output::Json).to receive(:call)
      subject
    end
  end
end
