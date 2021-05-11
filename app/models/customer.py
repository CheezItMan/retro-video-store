from sqlalchemy.orm import relationship
from app import db

class Customer(db.Model):

    __tablename__ = "customers"

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(128))
    registered_at = db.Column(db.DateTime(), nullable=True)
    postal_code = db.Column(db.String(32))
    phone = db.Column(db.String(32))
    videos_checked_out_count = db.Column(db.Integer, default=0)

    def to_json(self):
        return {
            "id": self.id,
            "name": self.name,
            "registered_at": self.registered_at,
            "postal_code": self.postal_code,
            "phone": self.phone,
            "videos_checked_out_count": self.videos_checked_out_count,
        }