from typing import List

from common.model import Token


def tokenize(file_name: str) -> List[Token]:
    tokens: List[Token] = []
    with open(file_name, "r") as src_file:
        pass

    return tokens
