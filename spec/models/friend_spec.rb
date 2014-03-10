require 'spec_helper'

describe Friend do
  it { should validate_presence_of :name }

  # this test should fail:
  # 'text2/plain' should not be allowed
  # instead, I get:
  # Failure/Error: .rejecting('text/plain1', 'text/plain', 'text/xml', 'some_image/png', 'text2/plain') }
  # NoMethodError:
  #    undefined method `any?' for nil:NilClass
  it { should validate_attachment_content_type(:avatar)
   .allowing('text2/plain', 'image/gif', 'image/jpeg', 'image/png', 'image/abc')
   .rejecting('text/plain1', 'text/plain', 'text/xml', 'some_image/png', 'text2/plain') }

  # this should pass - it does pass for me
  it { should validate_attachment_content_type(:avatar)
    .allowing('image/gif', 'image/jpeg', 'image/png', 'image/abc')
    .rejecting('text/plain1', 'text/plain', 'text/xml', 'some_image/png', 'text2/plain') }

  # this should pass - it does pass for me
  it { should validate_attachment_content_type(:avatar)
    .rejecting('text/plain1', 'text/plain', 'text/xml', 'some_image/png', 'text2/plain') }

  # this should fail: 'image/gif' is acceptable (is not rejected):
  # instead, I get:
  # Failure/Error: .rejecting('text/plain1', 'text/plain', 'image/gif', 'text/xml', 'some_image/png', 'text2/plain') }
  # TypeError:
  #    can't convert nil into String
  it { should validate_attachment_content_type(:avatar)
    .rejecting('text/plain1', 'text/plain', 'image/gif', 'text/xml', 'some_image/png', 'text2/plain') }

  # this should fail: 'text/xml' is not acceptable (is rejected)
  # instead, I get:
  # Failure/Error: .allowing('image/gif', 'image/jpeg', 'image/png', 'text/xml', 'image/abc') }
  # TypeError:
  #    can't convert nil into String
  it { should validate_attachment_content_type(:avatar)
    .allowing('image/gif', 'image/jpeg', 'image/png', 'text/xml', 'image/abc') }

end