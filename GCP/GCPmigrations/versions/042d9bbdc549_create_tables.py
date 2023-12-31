"""create tables

Revision ID: 042d9bbdc549
Revises: 60e20eb29d61
Create Date: 2023-10-27 03:55:50.966814

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '042d9bbdc549'
down_revision: Union[str, None] = '60e20eb29d61'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('patient_preferences', sa.Column('toothpaste_flavor', sa.String(length=100), nullable=True))
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('patient_preferences', 'toothpaste_flavor')
    # ### end Alembic commands ###
