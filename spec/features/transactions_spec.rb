# encoding: UTF-8
require 'spec_helper'

describe "Transactions" do
  describe "GET /transactions/new" do
    before do
      visit new_transaction_path
    end

    it "should load new transaction page" do
      page.should have_selector('legend', :text =>"Nova movimentação")
    end

    let(:submit) { "Salvar" }

    describe "with invalid information" do
      it "should not create a transaction" do
        expect { find_button(:submit).click }.not_to change(Transaction, :count)
      end
      it "should show error for invalid date" do
        find_button(:submit).click
        page.should have_content("Transaction date can't be blank")
      end
    end

    describe "with valid information" do
      before do
        fill_in('transaction_description', :with => 'Teste')
        fill_in('transaction_transaction_date', :with => '2012-05-23')
        fill_in('transaction_value', :with => '100')
      end

      it "should create a transaction" do
        expect { click_button :submit }.to change(Transaction, :count).by(1)
      end
    end
  end
end
