#!/usr/bin/python3
"""Create California with the city San Francisco."""

import sys

from sqlalchemy import create_engine
from sqlalchemy.orm import Session

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

    Base.metadata.create_all(engine)

    session = Session(engine)

    state = State(name="California")
    state.cities.append(City(name="San Francisco"))
    session.add(state)
    session.commit()

    session.close()
