require 'spec_helper'

describe Friend do
  it { should validate_presence_of :name }
  it { should validate_attachment_content_type(:avatar)
                  .allowing('text2/plain', 'image/gif', 'image/jpeg', 'image/png', 'image/abc')
                  .rejecting('text/plain1', 'text/plain', 'text/xml', 'some_image/png', 'text2/plain') }

  it { should validate_attachment_content_type(:avatar)
                  .allowing('image/gif', 'image/jpeg', 'image/png', 'image/abc')
                  .rejecting('text/plain1', 'text/plain', 'text/xml', 'some_image/png', 'text2/plain') }

  it { should validate_attachment_content_type(:avatar)
                  .rejecting('text/plain1', 'text/plain', 'text/xml', 'some_image/png', 'text2/plain') }

  it { should validate_attachment_content_type(:avatar)
              .rejecting('text/plain1', 'text/plain', 'image/gif', 'text/xml', 'some_image/png', 'text2/plain') }

  it { should validate_attachment_content_type(:avatar)
                  .allowing('image/gif', 'image/jpeg', 'image/png', 'text/xml', 'image/abc') }

end