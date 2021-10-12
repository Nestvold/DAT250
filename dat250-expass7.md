# DAT250: Software Technology Experiment Assignment 7
## Short report:
I encountered one problem with running docker on my Windows x64 system. I had to go to the bios and enable:  ``Hardware assisted virtualization and data execution``. Other than that it went smooth, the code lies beneath in each section there is two code files inserted with link to the code file in git. 

### Experiment 1: Installation
- [x] Complete installation
<img src="extra\docker.JPG" width="1000">

### Experiment 2: Hello World
[send.py](https://github.com/Nestvold/DAT250--Software-Technology-Experiment-Assignment-7/blob/main/send.py)
```
import pika

connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
channel = connection.channel()


channel.queue_declare(queue='hello')
channel.basic_publish(exchange='', routing_key='hello', body='Hello World!')
print(" [x] Sent 'Hello World!'")

connection.close()
```

[recieve.py](https://github.com/Nestvold/DAT250--Software-Technology-Experiment-Assignment-7/blob/main/recieve.py)
```
import pika

def main():
    connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
    channel = connection.channel()

    channel.queue_declare(queue='hello')

    def callback(ch, method, properties, body):
        print(" [x] Received %r" % body)

    channel.basic_consume(queue='hello', auto_ack=True, on_message_callback=callback)

    print(' [*] Waiting for messages. To exit press CTRL+C')
    channel.start_consuming()

    if __name__ == '__main__':
        try:
            main()
        except KeyboardInterrupt:
            print('Interrupted')
            try:
                sys.exit(0)
            except SystemExit:
                os._exit(0)
```

### Experiment 3: Queue messaging
[new_task.py](https://github.com/Nestvold/DAT250--Software-Technology-Experiment-Assignment-7/blob/main/new_task.py)
```
import pika
import sys

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

channel.queue_declare(queue='task_queue', durable=True)

message = ' '.join(sys.argv[1:]) or "Hello World!"
channel.basic_publish(
    exchange='',
    routing_key='task_queue',
    body=message,
    properties=pika.BasicProperties(
        delivery_mode=2,  # make message persistent
    ))
print(" [x] Sent %r" % message)
connection.close()
```

[worker.py](https://github.com/Nestvold/DAT250--Software-Technology-Experiment-Assignment-7/blob/main/worker.py)
```
import pika
import time

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

channel.queue_declare(queue='task_queue', durable=True)
print(' [*] Waiting for messages. To exit press CTRL+C')


def callback(ch, method, properties, body):
    print(" [x] Received %r" % body.decode())
    time.sleep(body.count(b'.'))
    print(" [x] Done")
    ch.basic_ack(delivery_tag=method.delivery_tag)


channel.basic_qos(prefetch_count=1)
channel.basic_consume(queue='task_queue', on_message_callback=callback)

channel.start_consuming()
```


### Experiment 4: Topics
[emit_log.py](https://github.com/Nestvold/DAT250--Software-Technology-Experiment-Assignment-7/blob/main/emit_log.py)
```
import pika
import sys

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

channel.exchange_declare(exchange='logs', exchange_type='fanout')

message = ' '.join(sys.argv[1:]) or "info: Hello World!"
channel.basic_publish(exchange='logs', routing_key='', body=message)
print(" [x] Sent %r" % message)
connection.close()
```

[recieve_log.py](https://github.com/Nestvold/DAT250--Software-Technology-Experiment-Assignment-7/blob/main/recieve_logs.py)
```
import pika

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

channel.exchange_declare(exchange='logs', exchange_type='fanout')

result = channel.queue_declare(queue='', exclusive=True)
queue_name = result.method.queue

channel.queue_bind(exchange='logs', queue=queue_name)

print(' [*] Waiting for logs. To exit press CTRL+C')

def callback(ch, method, properties, body):
    print(" [x] %r" % body)

channel.basic_consume(queue=queue_name, on_message_callback=callback, auto_ack=True)

channel.start_consuming()
```
