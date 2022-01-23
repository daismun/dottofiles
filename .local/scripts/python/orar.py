#!/usr/bin/env python

import sys
import time
from tabulate import tabulate
from datetime import date, timedelta

par   = '\033[1;33m par\033[0m'
pauza = '\033[1;32mPauză\033[0m'
impar = '\033[1;31m impar\033[0m'


today = date.today()
start = today - timedelta(days = today.weekday())
end   = start + timedelta(days = 6)

# Check if it's odd or even
num     = int(str(start)[9])
if num % 2 == 0:
    week = "\033[1;33mPară\033[0m"
else:
    week = "\033[1;31mImpară\033[0m"

empty=''
h = ['Ziua'      , 'Ora'   , 'Disciplina, Săptămâna:'+week     ]
l = [['Luni'     , '8-10'  , 'Informatică Aplicată (C)'        ],
    [empty       , '10-12' , 'Internet (C)'                    ],
    [empty       , '12-14' , 'Calitate și Fiabilitate (C)'     ],
    [empty       , '14-15' , pauza                             ],
    [empty       , '15-17' , 'Educație Fizică (S)'+impar       ],
    [empty       , '17-19' , 'Analiză Matematică (C)'          ]]
m = [['Marți'    , '8-10'  , 'Metode și Procedee (C)'          ],
    [empty       , '10-12' , 'Engleză (S)'+impar               ],
    [empty       , '12-14' , 'CAD (C)'                         ],
    [empty       , '14-17' , pauza                             ],
    [empty       , '17-19' , 'Informatică Aplicată (L)'        ]]
mm= [['Miercuri' , '8-10'  , 'Algebră Lineară (C)'             ],
    [empty       , '10-12' , pauza                             ],
    [empty       , '12-14' , 'Fizică (C)'                      ],
    [empty       , '14-15' , pauza                             ],
    [empty       , '15-17' , 'CAD (C)'+par                     ],
    [empty       , '17-18' , pauza                             ],
    [empty       , '18-20' , 'Fizică (S)'+par                  ]]
j = [['Joi'      , '8-10'  , 'Internet (L)'+par                ],
    [empty       , '10-12' , 'Alg. Lin (S)'+impar              ],
    [empty       , '10-12' , 'Calitate și Fiabilitate (S)'+par ],
    [empty       , '12-14' , 'Analiză Matematică (S)'+par      ]]
v = [['Vineri'    , '8-10'  , 'Metode și Procedee (L)'+par      ]]

def tbl(stuff):
    return tabulate(stuff, headers=h, tablefmt='orgtbl')

if len(sys.argv)<2:
    print(tbl(l+m+mm+j+v))
else:
    pin=sys.argv[1]
    if pin == "l":
        print(tbl(l))
    elif pin == "m":
        print(tbl(m))
    elif pin == "mm":
        print(tbl(mm))
    elif pin == "j":
        print(tbl(j))
    elif pin == "v":
        print(tbl(v))
    else:
        print(tbl(l+m+mm+j+v))
