from django.db import models

# Create your models here.
class Player(model.Models):
    name = models.CharField(max_lenght = 30)
    key = models.CharField(primary_key = True, max_length = 128)

class Attempt(model.Models):
    id = models.AutoField(primary_key=True)
    player = models.ForeignKey(Player, null = False)
    score = models.FloatField(null = False)
    subscore = models.FloatField(null = True)
    attemptNr = models.IntegerField(null = False)
    date = models.DateField()

