#!/bin/bash

# LaTeX Strategy Template Compilation Script
# This script compiles the strategy template to PDF

echo "Compiling LaTeX Strategy Template..."

# Check if pdflatex is available
if ! command -v pdflatex &> /dev/null; then
    echo "Error: pdflatex not found. Please install LaTeX distribution."
    exit 1
fi

# Compile the document (run twice for proper cross-references)
echo "First compilation pass..."
pdflatex -interaction=nonstopmode strategy_template.tex

echo "Second compilation pass..."
pdflatex -interaction=nonstopmode strategy_template.tex

# Clean up auxiliary files
echo "Cleaning up auxiliary files..."
rm -f *.aux *.log *.toc *.out *.fls *.fdb_latexmk

if [ -f "strategy_template.pdf" ]; then
    echo "✓ PDF successfully generated: strategy_template.pdf"
else
    echo "✗ PDF generation failed. Check LaTeX errors above."
    exit 1
fi