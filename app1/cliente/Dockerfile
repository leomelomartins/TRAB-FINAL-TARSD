FROM python:3
ADD cliente.py /
RUN pip install psutil
RUN pip install pymongo
RUN sudo pip3 install schedule
CMD [ "python3", "./cliente.py" ]
