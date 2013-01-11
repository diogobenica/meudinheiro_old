# encoding: UTF-8
require 'spec_helper'

describe "Transactions" do
  describe "GET /transactions/new" do
    it "should load new transaction page" do
      visit new_transaction_path
      page.should have_selector('legend', :text =>"Nova movimentação")
    end

    let(:submit) { "Salvar" }

    describe "with invalid information" do
      it "should not create a transaction" do
        expect { click_button 'Salvar' }.not_to change(Transaction, :count)
        click_button 'Salvar'
        page.should have_content("Transaction date can't be blank")
      end
    end

    describe "with valid information" do
      before do
        fill_in "transaction_value", with: "100"
        fill_in "transaction_description", with: "Teste"
        fill_in "transaction_date", with: "2012-05-23"
      end

      it "should create a transaction" do
        expect { click_button 'Salvar' }.to change(Transaction, :count).by(1)
      end
    end
  end
end
