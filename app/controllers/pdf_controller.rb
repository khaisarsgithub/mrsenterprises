class PdfController < ApplicationController
  def generate
    # Generate the PDF using Prawn
    # pdf = Prawn::Document.new
    # pdf.text 'Hello, PDF!'

    # Set the response headers
    # headers['Content-Type'] = 'application/pdf'
    # headers['Content-Disposition'] = 'attachment; filename="download.pdf"'

    # Send the generated PDF as the response
    # render plain: pdf.render

    # html = render_to_string(template: '/pdf/generate.html.erb')

    # Generate the PDF using wicked_pdf
    # pdf = WickedPdf.new.pdf_from_string(html)

    # kit = PDFKit.new(render_to_string(template: 'generate.html.erb'))
    # kit.command = '/path/to/wkhtmltopdf'
    # pdf = WickedPdf.new.pdf_from_string(render_to_string(pdf: 'generate', layout: false))
    # Set the response headers
    
    # html = render_to_string('<h1>Hello, PDF!</h1>')
    html = render_to_string(template: 'pdf/generate')
    pdf = WickedPdf.new.pdf_from_string(html)

    send_data pdf, filename: 'document.pdf', type: 'application/pdf',
                  disposition: 'attachment'
    headers['Content-Type'] = 'application/pdf'
    headers['Content-Disposition'] = 'attachment; filename="document.pdf"'

    # Send the generated PDF as the response
    # render plain: kit

  end
end
