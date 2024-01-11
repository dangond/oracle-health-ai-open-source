FROM python:3.9

WORKDIR /python-backend

COPY . /python-backend

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["python3.9", "ImageAnalysisController.py"]