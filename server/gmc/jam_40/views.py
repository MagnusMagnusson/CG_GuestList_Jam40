from django.http import JsonResponse
from jam_40.models import Person, Attempt
import random
from datetime import datetime
import json
from django.views.decorators.csrf import csrf_exempt

def player(request):
    p = Person.objects.all().filter(key = request.GET['userKey'])
    if(len(p) == 1):
        return JsonResponse({'name': p[0].name, 'key': p[0].key})
    else:
        p = Person()
        p.key = request.GET['userKey']
        p.name = "Unnamed player " + str(random.randint(10000, 1000000))
        p.save()
        return JsonResponse({'name': p.name, 'key': p.key})
        
@csrf_exempt
def attempt(request):
    if(request.method == "POST"):
        body = request.body.decode('utf-8')
        print(body)
        post = json.loads(body)
        print(25)
        if("gamemode" in post and "userKey" in post and "_score" in post and "attemptNr" in post):
            print(27)
            p = Person.objects.all().filter(key = post['userKey'])
            if(len(p) == 1):
                print(30)
                p = p[0]
                a = Attempt()
                a.player = p
                a.gamemode = post['gamemode']
                a.score = post['_score']
                if(post['subscore']):
                    a.subscore = post['subscore']
                a.attemptNr = post['attemptNr']
                now = datetime.now()
                a.date = now
                a.save()
    else:
        gamemode = request.GET['gamemode']
        sortFunction = None
        if gamemode == 'marathon':
            sortFunction = lambda a : (10000  * a.score) + a.subscore
        return JsonResponse({"recent":Attempt.recent(gamemode), "top":Attempt.top(gamemode, sortFunction)})
    return JsonResponse({})

def attemptStat(request):
    return JsonResponse(Attempt.statistics(request.GET['gamemode']))
