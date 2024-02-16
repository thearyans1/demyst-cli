# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Demyst::Client do
  subject { described_class.call(urls) }

  let(:urls) do
    (1..10).map { |value| format(Demyst::Actions::Todo::BASE_URL, value) }
  end
  let(:status) { 200 }

  describe '.call' do
    before do
      stub_request(:get, /jsonplaceholder.typicode.com/)
        .to_return(status:, body: "{ hello: 'world'}")
    end

    it 'processes the request and returns response' do
      expect(subject).to eq(["{ hello: 'world'}"] * 10)
    end

    context 'when request fails' do
      let(:status) { 401 }

      it 'returns no result' do
        expect(subject).to eq([])
      end
    end
  end
end
