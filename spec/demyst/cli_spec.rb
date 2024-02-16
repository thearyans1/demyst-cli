# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Demyst::Cli do
  describe '#todo' do
    context 'when no arguments are passed' do
      it 'uses the default - 20 for total, and plain for output' do
        expect(Demyst::Actions::Todo).to receive(:call).with({ total: 20, output: 'plain' }).and_return(true)
        described_class.new.invoke(:todo)
      end
    end

    context 'when arguments are passed' do
      let(:total) { 100 }
      let(:output) { 'json' }

      it 'passes the argument to action' do
        expect(Demyst::Actions::Todo).to receive(:call).with({ total:, output: }).and_return(true)
        described_class.new.invoke(:todo, [], { total:, output: })
      end
    end
  end
end
