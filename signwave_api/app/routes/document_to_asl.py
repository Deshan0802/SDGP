from flask import Flask, Blueprint, request, jsonify
from pypdf import PdfReader
import io

document_to_asl_bp = Blueprint("document-to-asl", __name__)

@document_to_asl_bp.route("/document-to-asl", methods=["POST"])
def pdf_to_text():
    if 'file' not in request.files:
        return jsonify({"error": "No file part"}), 400

    file = request.files['file']

    if file.filename == '':
        return jsonify({"error": "No selected file"}), 400

    if not file.filename.endswith('.pdf'):
        return jsonify({"error": "Unsupported file format"}), 400

    try:
        file_stream = io.BytesIO(file.read())
        pdf_reader = PdfReader(file_stream)
        text = ""
        for page in pdf_reader.pages:
            page_text = page.extract_text() or ""
            print(f"Page Text: {page_text}")  
            text += page_text + "\n"
        
        print(f"Extracted Text: {text}")  
        return jsonify({"extracted_text": text}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
