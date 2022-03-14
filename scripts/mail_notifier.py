#!/usr/bin/env python
import boto3
import click

ses = boto3.client("ses", "us-east-1")

@click.command()
@click.argument("subject")
@click.argument("message")
def send_email(subject, message):
  sender = "ML Jobs <notifier@yannhoffmann.com>"
  recipient = "yann.hoffmaaann@gmail.com"
  response = ses.send_email(
    Destination={"ToAddresses": [recipient]},
    Message={"Body": {"Text": {"Data": message}}, "Subject": {"Data": subject}},
    Source=sender)
  print(response)


if __name__ == "__main__":
  send_email()
