#!/usr/bin/python3
"""List States and their related Cities using one query."""

import sys

from sqlalchemy import create_engine
from sqlalchemy.orm import Session, joinedload

from relationship_city import City
from relationship_state import Base, State


if __name__ == "__main__":
    engine = create_engine(
        "mysql+mysqldb://{}:{}@localhost:3306/{}".format(
            sys.argv[1],
            sys.argv[2],
            sys.argv[3]
        ),
        pool_pre_ping=True
    )

    session = Session(engine)

    states = (
        session.query(State)
        .options(joinedload(State.cities))
        .order_by(State.id)
        .all()
    )

    for state in states:
        print("{}: {}".format(state.id, state.name))
        for city in state.cities:
            print("\t{}: {}".format(city.id, city.name))

    session.close()
