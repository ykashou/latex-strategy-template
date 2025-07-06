#!/bin/bash

# Simple LaTeX Strategy Template Compilation Script
echo "Compiling Simple LaTeX Strategy Template..."

# Compile the document (run twice for proper cross-references)
echo "First compilation pass..."
pdflatex \
    -interaction=nonstopmode strategy_template.tex

echo "Second compilation pass..."
pdflatex \
    -interaction=nonstopmode strategy_template.tex

# Clean up auxiliary files
echo "Cleaning up auxiliary files..."
rm -f *.aux *.log *.toc *.out *.fls *.fdb_latexmk

if [ -f "strategy_template_simple.pdf" ]; then
    echo "✓ PDF successfully generated: strategy_template_simple.pdf"
else
    echo "✗ PDF generation failed. Check LaTeX errors above."
    exit 1
fi