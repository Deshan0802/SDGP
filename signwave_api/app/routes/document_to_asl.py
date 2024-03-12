from flask import Blueprint, request, jsonify
import PyPDF2

document_to_asl_bp = Blueprint("document-to-asl", __name__)


@document_to_asl_bp.route("/document-to-asl", methods=["POST"])
def pdf_to_text(pdf_path):
    try:
    
        with open(pdf_path, "rb") as pdf_file:
            pdf_reader = PyPDF2.PdfReader(pdf_file)
            text = ""

            for page_number in range(len(pdf_reader.pages)):
                page = pdf_reader.pages[page_number]
                text += page.extract_text()

            return text  
        
    except Exception as e:
        print(f"An error occurred: {e}")
        return None

pdf_path = r"path/to/pdf-file"
extracted_text = pdf_to_text(pdf_path)
print(extracted_text)