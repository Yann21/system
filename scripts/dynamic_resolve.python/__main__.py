import click

# import yaml
#
# with open("directory_structure.yml", "r") as file:
#   try:
#     tree = yaml.safe_load(file)
#   except yaml.YAMLError as e:
#     print(e)
#
#   print(tree)


paths = {
  "VAGRANT_HOME": "/home/yann/.cache/vagrant.d",
  "SEABORN_DATA": "/home/yann/.cache/seaborn-data",
  "SCIKIT_LEARN_DATA": "/home/yann/.cache/scikit-data",
  "NLTK_DATA": "/home/yann/.cache/nltk_data",
}


def get_path(tag):
  return paths[tag]


@click.command()
@click.argument("tag")
def main(tag):
  print(get_path(tag))

if __name__ == "__main__":
  main()
