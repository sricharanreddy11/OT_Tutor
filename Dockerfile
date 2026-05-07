FROM python:3.11-slim

WORKDIR /code

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . .

# HuggingFace Spaces requires port 7860
EXPOSE 7860

CMD ["uvicorn", "web.backend.app:app", "--host", "0.0.0.0", "--port", "7860"]
