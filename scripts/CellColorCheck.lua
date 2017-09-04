-- Cell Color Check v1.4.0 - 2017-04-19, by Vent/TRIAD
-- ** Run this script on a blank layer **
-- This project began by modifying Paulo Silva's script 

-- History
-- v1.4.0 2017-04-19:
-- * some minor refactoring
-- * added search for optimal bgcolor
-- v1.3.2 2016-09-07: 
-- * fixed mcol with borders
-- v1.3 2016-08-08: 
-- * added support for mcol pic with borders
-- * added support for 80x50 petscii
-- Todo / wishlist
-- * saving pic preferences to a metafile
-- * export to c64 formats such as Koala, DrazLace, executable .prg etc.
-- * export sprites to png and data
-- * color rule check for sprites

w,h=getpicturesize()
-- default unless overwritten below
x0,y0 = 0,0
picw,pich=w,h
guessheight = 8 -- usually block is 8px high
whiterec=0 -- highlight by cell color
if w == 160 then -- standard mcol
	guesswidth = 4 -- maybe 2x1 pixel size
	guessbgcommon = 1
	guesscolors = 4
elseif w == 192 then -- mcol with borders is 192x272 (384x272)
	guesswidth = 4 -- maybe 2x1 pixel size
	guessbgcommon = 1
	guesscolors = 4
	x0,y0 = 16,34
	picw, pich = 160,200
elseif w == 80 then -- petscii with quarter-char 'pixels'
	guesswidth = 2 -- 4x4 px blocks
	guessheight = 2
	guessbgcommon = 1 -- with common bgcolor
	guesscolors = 2 -- and one fg color
	whiterec=1 -- highlight white
else
	guesswidth = 8
	guessbgcommon = 0
	guesscolors = 2
end
	bgcolor=getbackcolor()
---
ok,xcell,ycell,colors,usebgcolor,bgcolor,dispvacant=inputbox("CCCv1.4.0 Define pixel cell",
	"Cell width", guesswidth, 2, 8, 1,
	"Cell height", guessheight, 1, 8, 1,
	"Colors in a cell", guesscolors, 1, 16, 1,
	"Use a common bgcolor", guessbgcommon,0,1,0,
	"Common background color", bgcolor, -1, 15, 1,
	"Show vacant cells", 0,0,1,0
	);

if ok==true then
	
	cellindicator = true
	if bgcolor == -1 then -- mode = finding optimum bgcolor
		cellindicator = false -- do not draw rectangles
	end
	-- ----------------------------
	function drawrect(xa,ya,xb,yb,c)
		-- statusmessage(xa..","..ya..","..xb..","..yb)
		-- drawline bug? line drawing always starts from the 2nd pixel..
		-- draw a box
		drawline(xa,ya,xa,yb,c)
		drawline(xb,ya,xb,yb,c)
		drawline(xa,ya,xb,ya,c)
		drawline(xa,yb,xb,yb,c)
		end

	function checkcell(x1,y1,xcell,ycell,bgcol)
		for y2=0,ycell-1,1 do -- for each pixel row in a cell
			for x2=0,xcell-1,1 do -- for each pixel in a row
				x=x1+x2  -- actual x coordinate
				y=y1+y2  -- actual y coordinate
				u=getpicturepixel(x,y)
				found=false
				if y2 == 0 and x2 == 0 then
					cellcolors[1]=u
					if usebgcolor == 1 and u~= bgcol then
						cellcolors[2]=bgcol
						end			
				else
					for n=0,#cellcolors-1,1 do
						if cellcolors[n+1]==u then 
							found=true --old color
							break
						else
							found=false
							end
						end
					if found==false then --new color
						table.insert(cellcolors,u)
						end
					end
				end
			end
		end

	function checkpic(bgcol)
		local badcells = 0
		local vacantcells = 0
		for y1=y0,y0+pich-1,ycell do -- for each cell row
			for x1=x0,x0+picw-1,xcell do -- for each cell in a row
				
				cellcolors = {}
				checkcell(x1,y1,xcell,ycell,bgcol)
				if #cellcolors > colors then --too many colors in a block
					if whiterec == 1 then 
						rectcolor = 1
					else 
						rectcolor = #cellcolors
					end
					if cellindicator then -- if background color not -1
						drawrect(x1,y1,(x1+xcell-1),(y1+ycell-1),rectcolor) --mark it with a rectangle
						end
					badcells = badcells + 1 --cell count
					statusmessage(badcells.." bad cells found")
				elseif dispvacant == 1 then --vacant cells, where more colours could be added
					if #cellcolors < colors then
						if cellindicator then
							drawrect(x1,y1,(x1+xcell-1),(y1+ycell-1),(#cellcolors)) --mark it with a rectangle
							end
						vacantcells = vacantcells + 1 --cell count
						statusmessage(vacantcells.." not full cells found")
						end
					end
				end
			end
		return badcells,vacantcells
		end

	function dispreport(badcells, vacantcells)
		local report
		if badcells > 0 then
			report = "Found "..badcells.." cells with too many colors."
		else
			report = "No bad cells found!"
			end
		if vacantcells > 0 then
			report = report.."\nFound "..vacantcells.." cells which could hold up more colors."
			end
		report = report.."\nCell size: "..xcell.."x"..ycell.."px."
		messagebox(report)
		end
	-- ----------------------------
	
	if bgcolor == -1 then -- find optimum bgcolor:
		bestbg = 0 -- best bgcolor
		bestbadcells = 999999
		-- !TODO sorting of different bgcolors / showing more than one option; helping to find the optimum choice, which is not always the obvious one
		-- badcellstatus = {}
		-- vacantcellstatus = {}
		for testbgcolor=0,15,1 do
			badcells = 0
			vacantcells = 0
			badcells,vacantcells=checkpic(testbgcolor)
			-- table.insert(badcellstatus,badcells)
			-- table.insert(vacantcellstatus,vacantcells)
			if badcells < bestbadcells then
				bestbg = testbgcolor
				bestbadcells = badcells
				end
			end
		messagebox("Best found background color: "..bestbg.." with "..bestbadcells.." bad cells found")
	else
		badcells = 0
		vacantcells = 0
		badcells,vacantcells=checkpic(bgcolor)
		
		dispreport(badcells,vacantcells)
	end
end