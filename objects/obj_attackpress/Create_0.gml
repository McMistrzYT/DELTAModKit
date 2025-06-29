active = 0;
fastmode = 1;

if (fastmode == 1)
    active = 1;

goahead = 0;
linespeed = 2;
linex = -10;
spelluse = 0;

spelldelay[0] = 10;
spelldelay[1] = 10;
spelldelay[2] = 10;

maxdelay = 0;
maxdelaytimer = 0;

if (spelluse == 0)
{
    for (xyz = 0; xyz < 3; xyz += 1)
    {
        havechar[xyz] = 0;
        charitem[xyz] = 0;
        charspell[xyz] = 0;
        
        if (global.charaction[xyz] == 1)
            havechar[xyz] = 1;
        
        if (global.charaction[xyz] == 4 || global.charaction[xyz] == 2)
        {
            if (maxdelay == 0)
                maxdelay = 25;
            
            maxdelay += 15;
            
            if (xyz == 2 && spelluse == 1)
            {
                if (spelldelay[1] == 25)
                    spelldelay[2] = 45;
                else
                    spelldelay[2] = 25;
            }
            
            if (xyz == 1 && spelluse == 1)
                spelldelay[1] = 25;
            
            spelluse = 1;
            
            if (global.charaction[xyz] == 4)
                charitem[xyz] = 1;
            else
                charspell[xyz] = 1;
        }
    }
}

spelluse = 0;
fade = 0;
fadeamt = 0;
fakefade = 0;
bcolor = c_navy;

for (i = 0; i < DRHero.__MAX__; i++) {
	charcolor[i] = scr_hero_get_color(i);
	boltcolor[i] = merge_color(charcolor[i], c_white, 0.5);
}
	
target = 0;
global.hittarget[0] = global.chartarget[0];
global.hittarget[1] = global.chartarget[1];
global.hittarget[2] = global.chartarget[2];

imagetimer = 0;
posttimer = 0;
timermax = 50;

if (havechar[0] == 0 && havechar[1] == 0 && havechar[2] == 0)
{
    timermax = 3;
    
    if (spelluse == 1 && fastmode == 1)
        timermax += maxdelay;
}

boltorder[0] = choose(0, 1, 2);

if (havechar[1] == 0 && havechar[2] == 0)
    boltorder[0] = 0;

if (boltorder[0] == 2)
    boltorder[1] = choose(0, 1);

if (boltorder[0] == 1)
    boltorder[1] = choose(0, 2);

if (boltorder[0] == 0)
    boltorder[1] = choose(1, 2);

if (boltorder[1] == 2 && boltorder[0] == 0)
    boltorder[2] = 1;

if (boltorder[1] == 0 && boltorder[0] == 2)
    boltorder[2] = 1;

if (boltorder[1] == 1 && boltorder[0] == 0)
    boltorder[2] = 2;

if (boltorder[1] == 0 && boltorder[0] == 1)
    boltorder[2] = 2;

if (boltorder[1] == 2 && boltorder[0] == 1)
    boltorder[2] = 0;

if (boltorder[1] == 1 && boltorder[0] == 2)
    boltorder[2] = 0;

if (havechar[1] == 1 && havechar[2] == 0)
{
    boltorder[0] = choose(0, 1);
    
    if (boltorder[0] == 1)
        boltorder[2] = 0;
    else
        boltorder[2] = 1;
}

boltgap = 20;
boltspeed = 8;
boltx = 0;
points[0] = 0;
points[1] = 0;
points[2] = 0;
pressbuffer[0] = 0;
pressbuffer[1] = 0;
pressbuffer[2] = 0;
pressbuffer[3] = 0;
charbolt[0] = 1;
charbolt[1] = 1;
charbolt[2] = 1;

for (i = 0; i < 3; i += 1)
{
    if (havechar[i] == 0)
        charbolt[i] = 0;
}

attacked[0] = 0;
attacked[1] = 0;
attacked[2] = 0;
bolttotal = charbolt[0] + charbolt[1] + charbolt[2];
boltxoff = 0;
my_method = 1;
boltnum = 1;
boltuse[0] = 0;
boltuse[1] = 0;
boltuse[2] = 0;
lastbolt = -1;
boltchar[0] = -1;
diff = 10;

if (global.flag[13] == 0)
    diff += 2;

if (my_method == 1)
{
    for (i = 0; i < bolttotal; i += 1)
    {
        boltalive[i] = 1;
        c = choose(0, 1, 2);
        
        while (havechar[c] == 0)
            c = choose(0, 1, 2);
        
        while (boltuse[c] >= charbolt[c])
        {
            c = choose(0, 1, 2);
            
            while (havechar[c] == 0)
                c = choose(0, 1, 2);
        }
        
        boltchar[i] = c;
        boltuse[c] += 1;
    }
    
    for (i = 0; i < bolttotal; i += 1)
    {
        boltred[i] = 0;
        boltxoff += lastbolt;
        boltframe[i] = 30 + boltxoff;
        
        if (i < (bolttotal - 1))
        {
            if (lastbolt != 0 && boltchar[i] != boltchar[i + 1])
            {
                lastbolt = choose(0, diff, diff * 1.5);
                boltred[i] = 1;
            }
            else
            {
                lastbolt = choose(diff, diff * 1.5);
            }
        }
        else
        {
            lastbolt = choose(diff, diff * 1.5);
        }
    }
}

if (my_method == 2)
{
    for (c = 0; c < 3; c += 1)
    {
        if (havechar[c] == 1)
        {
            for (i = 0; i < boltnum; i += 1)
            {
                boltframe[i][c] = 30 + (boltorder[c] * boltgap) + (i * choose(5, 10, 15));
                
                if (i == 2)
                {
                    if (boltframe[i][2] == boltframe[i][0] && boltframe[i][2] == boltframe[i][1])
                        boltframe[i][2] += 10;
                }
            }
        }
    }
}

haveauto = 0;
autoed = 0;

if (global.charauto[DRCharacter.Susie] == 1)
{
    if (global.char[0] == DRCharacter.Susie || global.char[1] == DRCharacter.Susie || global.char[2] == DRCharacter.Susie)
    {
        sus = 0;
        
        if (global.char[1] == DRCharacter.Susie)
            sus = 1;
        
        if (global.char[2] == DRCharacter.Susie)
            sus = 2;
        
        if (global.hp[DRCharacter.Susie] >= 0 && global.charmove[sus] == 1)
        {
            haveauto = 1;
            
            if (timermax == 3)
                timermax = 50;
        }
    }
}
