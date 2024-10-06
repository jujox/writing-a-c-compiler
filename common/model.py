from enum import Enum
from typing import Optional


class TokenType(Enum):
    IDENTIFIER = "identifier"
    CONSTANT = "constant"
    INT = "int"
    VOID = "void"
    RETURN = "return"
    OPEN_PARENTHESIS = "("
    CLOSE_PARENTHESIS = ")"
    OPEN_BRACE = "{"
    CLOSE_BRACE = "}"


class Token:
    type: TokenType
    name: Optional[str]
    value: str
