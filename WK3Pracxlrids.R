def passCount(input1,input2,input3):
  #N ==> Denotes number of friends sitting in a circle
  #n = raw_input("N: Total Number of Friends: ")
  #M ==> Game is over if a player receives the ball Mth time
  #m = raw_input("M : Number of times player receives ball to end the match: ")
  #L ==> Denotes number of places to move left or right
  #l = raw_input("L : number of places to move: ")
  n=input1  
  m=input2
  l=input3
  
  if n<=3 :
    return -1
  if n>=1000
  return -1
  if m<=3 :
    return -1
  if m>=1000
  return -1
  
  # Objective - Number of times the ball is passed among the players
  countGlobalMoves = 0
  indivMaxCount = 0
  #create a list with sequence upto Nth player
  player = list(range(1,n+1))
  #initialize dict data set to maintain counts
  countPlayer = dict()
  #initialize all counts to 0 before the game
  for i in player:
    countPlayer[i] = countPlayer.get(i, 0)
  #Game Starts Do the game until one of the player hits the max permitted pass M
  countPlayer[1] = 1
  currOrderPlayer = player
  LorR = "right"
  while (indivMaxCount < 3):
    currOrderPlayer = shift(currOrderPlayer, l, LorR)
  if LorR == "right":
    k = len(currOrderPlayer) - k
  right = currOrderPlayer[k::]
  left = currOrderPlayer[:k:]
  currOrderPlayer =  right + left
  countPlayer[currOrderPlayer[0]] = countPlayer[currOrderPlayer[0]] + 1
  indivMaxCount = countPlayer[max(inpDict, key=lambda k: inpDict[k])]
  if (countPlayer[currOrderPlayer[0]] % 2 == 0):
    LorR = "left"
  else :
    LorR = "right"
  return sum(countPlayer.values())-1
  
  