from reportlab.lib.pagesizes import A4
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from pathlib import Path

input_path = Path(r"c:\fullstack\src\database\mysql\정보처리기사_문제정리.md")
output_path = Path(r"c:\fullstack\src\database\mysql\정보처리기사_문제정리.pdf")

font_path = r"C:\Windows\Fonts\malgun.ttf"
pdfmetrics.registerFont(TTFont('Malgun', font_path))

text = input_path.read_text(encoding='utf-8')
lines = text.splitlines()

styles = getSampleStyleSheet()
styles['Normal'].fontName = 'Malgun'
styles['Normal'].fontSize = 11
styles['Heading1'].fontName = 'Malgun'
styles['Heading1'].fontSize = 16
styles['Heading2'].fontName = 'Malgun'
styles['Heading2'].fontSize = 13
styles['Heading3'].fontName = 'Malgun'
styles['Heading3'].fontSize = 12

story = []
for line in lines:
    if not line.strip():
        story.append(Spacer(1, 6))
    elif line.startswith('# '):
        story.append(Paragraph(line[2:], styles['Heading1']))
        story.append(Spacer(1, 10))
    elif line.startswith('## '):
        story.append(Paragraph(line[3:], styles['Heading2']))
        story.append(Spacer(1, 8))
    elif line.startswith('### '):
        story.append(Paragraph(line[4:], styles['Heading3']))
        story.append(Spacer(1, 6))
    else:
        story.append(Paragraph(line, styles['Normal']))


doc = SimpleDocTemplate(str(output_path), pagesize=A4, rightMargin=40, leftMargin=40, topMargin=40, bottomMargin=40)
doc.build(story)
print(f"PDF created: {output_path}")
