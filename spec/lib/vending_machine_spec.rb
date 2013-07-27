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

  describe "#insert" do
    it "10円をinsertする" do
      vending_machine.insert(10)
      vending_machine.amount.should == 10
    end

    it "50円をinsertする" do
      vending_machine.insert(50)
      vending_machine.amount.should == 50
    end

    it "10円と50円をinsertする" do
      vending_machine.insert(10)
      vending_machine.insert(50)
      vending_machine.amount.should == 60
    end
  end

  describe "#refund" do
    it "空の状態でrefundすると0が返却される" do
      vending_machine.refund.should == 0
    end
    
    it "10円の状態でrefundすると10円が返却される" do
      vending_machine.insert(10)
      vending_machine.refund.should == 10
    end

    it "10円の状態でrefundするとamountが0円になる" do
      vending_machine.insert(10)
      vending_machine.refund
      vending_machine.amount.should == 0
    end
  end

end
