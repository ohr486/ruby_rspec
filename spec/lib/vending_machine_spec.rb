# -*- encoding: utf-8 -*-
require 'spec_helper'

describe VendingMachine do

  let(:vending_machine) { VendingMachine.new }

  describe "#amount" do
    it "総計が0ならamountで0をかえす" do
      vending_machine.amount.should == 0
    end

    # 総計が10ならamountで10を返す
    # ... pending ...
  end

  describe "#stock_money" do
    it "10円をstock_moneyする" do
      vending_machine.stock_money(10)
      vending_machine.amount.should == 10
    end

    it "50円をstock_moneyする" do
      vending_machine.stock_money(50)
      vending_machine.amount.should == 50
    end

    it "10円と50円をstock_moneyする" do
      vending_machine.stock_money(10)
      vending_machine.stock_money(50)
      vending_machine.amount.should == 60
    end
  end

  describe "#refund" do
    it "空の状態でrefundすると0が返却される" do
      vending_machine.refund.should == 0
    end
    
    it "10円の状態でrefundすると10円が返却される" do
      vending_machine.stock_money(10)
      vending_machine.refund.should == 10
    end

    it "10円の状態でrefundするとamountが0円になる" do
      vending_machine.stock_money(10)
      vending_machine.refund
      vending_machine.amount.should == 0
    end
  end

  describe "#stock_moneyN" do
    it "stock_moneyNでstock_money(N)がよばれる" do
      [10,50,100,500,1000].each do |money|
        vending_machine.should_receive(:stock_money).with(money)
        vending_machine.send("insert#{money}")
      end
    end
  end

  describe "#count_of_y10" do
    it "初期状態ではcount_of_y10は0" do
      vending_machine.count_of_y10.should == 0
    end
  end
  
  describe "#count_of_yN" do
    it "初期状態ではcount_of_yNは0" do
      [10,50,100,500,1000].each do |money|
        vending_machine.send("count_of_y#{money}").should == 0
      end
    end

    it "count_of_yNで投入された回数が取得される" do
      pending
      [10,50,100,500,1000].each do |money|
        vending_machine.send("insert#{money}")
        vending_machine.send("count_of_y#{money}").should == 1
      end
    end
  end



end
