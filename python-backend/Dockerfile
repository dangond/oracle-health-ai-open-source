FROM python:3.9

WORKDIR /app

COPY /app .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

RUN echo 'done!'

CMD ["python3.9", "ImageAnalysisController.py"]