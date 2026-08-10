#!/usr/bin/python3
"""List Cities and their related States using one query."""

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

    cities = (
        session.query(City)
        .options(joinedload(City.state))
        .order_by(City.id)
        .all()
    )

    for city in cities:
        print(
            "{}: {} -> {}".format(
                city.id,
                city.name,
                city.state.name
            )
        )

    session.close()
