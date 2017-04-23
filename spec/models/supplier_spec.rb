require 'rails_helper'

RSpec.describe Supplier, type: :model do
  it 'should have a valid supplier' do
    expect(build(:supplier)).to be_valid
  end

  describe 'validations' do
    context 'should require presence' do
      it 'a company_name not void or nil' do
        expect(build(:supplier, company_name: '  ')).to_not be_valid
        expect(build(:supplier, company_name: nil)).to_not be_valid
      end
      it 'a email not void' do
        expect(build(:supplier, email: '  ')).to_not be_valid
        expect(build(:supplier, email: nil)).to_not be_valid
      end

      describe "when email format is valid" do
        it "should be valid" do
          emails = ['su@foo.COM', 'A_US-ER@f.b.org', 'frst.lst@foo.jp', 'a+b@baz.cn']
          emails.each do |valid_email|
            expect(build(:supplier, email: valid_email)).to be_valid
          end
        end
      end
    end

    context "when creating supplier with identical emails" do
      before { create(:supplier, company_name: 'identical', email: 'identical@gmail.com') }
      let(:supplier_email) { build(:supplier, email: 'identical@gmail.com') }

      it "raises unique validation email error" do
        expect(supplier_email).not_to be_valid
      end
    end
  end

  describe 'associations' do
    it "has_many products" do
      supplier = build(:supplier)
      product = build(:product)
      supplier.products << product
      expect(supplier.products.first).to be product
    end
  end
end
