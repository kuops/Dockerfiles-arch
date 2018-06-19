FROM python:3.6.5-alpine

RUN  pip install flask \
     && { \
            echo "from flask import Flask"; \
            echo "app = Flask(__name__)"; \
            echo ;\
            echo "@app.route(\"/\")"; \
            echo "def hello():"; \
            echo "    return \"Hello Flask!\""; \
            echo ; \
            echo "if __name__ == '__main__':"; \
            echo "    app.run(host='0.0.0.0')"; \
        } > hello.py

CMD  ["python","hello.py"]
