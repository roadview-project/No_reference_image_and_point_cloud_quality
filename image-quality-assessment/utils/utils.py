import yaml
import json


class bcolors:
    HEADER = "\033[95m"
    OKBLUE = "\033[94m"
    OKCYAN = "\033[96m"
    OKGREEN = "\033[92m"
    WARNING = "\033[93m"
    FAIL = "\033[91m"
    ENDC = "\033[0m"
    BOLD = "\033[1m"
    UNDERLINE = "\033[4m"


def log(msg, bcolor_type):
    print(f"{bcolor_type}{msg}{bcolors.ENDC}")


def load_yaml(file_path):
    with open(file_path, "r") as file:
        return yaml.safe_load(file)


def load_json(path):
    with open(path, "r") as file:
        return json.load(file)
    
def write_to_json(path, data):
    with open(path, "w") as f:
        json.dump(data, f, indent=4) 


def filter_entries(data, **filters):
    return [
        entry for entry in data if all(entry.get(k) == v for k, v in filters.items())
    ]


def filter_by_key(data, key):
    return [item[key] for item in data]
