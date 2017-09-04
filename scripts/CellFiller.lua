-- Cell Filler v0.2.1 - 2016-07-28, by Vent/TRIAD
-- Replace a color from a cell with foreground or background color
-- Shortcut this for CTRL-F for example and enjoy your C64-style cell filler
-- Version history
-- 0.1.0 - first version
-- 0.1.1 - added cancel/break with any key
-- 0.2.0 - added (buggy) cell highlight
-- 0.2.1 - fixed cell highlight when cancel

w,h=getpicturesize()
if w == 160 then
	guesswidth = 4 -- maybe 2x1 pixel size
	guessbgcommon = 1
	guesscolors = 4
else
	guesswidth = 8
	guessbgcommon = 0
	guesscolors = 2
end
bgcolor=getbackcolor()
guessheight=8 -- de facto C64 cell height

function getCellCoord(Paintbrush_X,Paintbrush_Y,cw,ch)
	local cx,cy
	cx = Paintbrush_X-Paintbrush_X%cw
	cy = Paintbrush_Y-Paintbrush_Y%ch
	return cx,cy
end
function getCell(x0,y0,w,h)
	local cell = {}
	for x = 0,w-1,1 do
		cell[x]= {}
		for y = 0,h-1,1 do
			cell[x][y] = getpicturepixel(x0+x,y0+y)
		end
	end
	return cell
end
function contains(table, val)
   for i=1,#table do
      if table[i] == val then 
         return true
      end
   end
   return false
end

function drawCell(x0,y0,w,h,cell)
	for x = 0, w-1, 1 do
		for y = 0, h-1, 1 do
			putpicturepixel(x0+x,y0+y,cell[x][y])
		end
	end
end

function highlightCell(x0,y0,w,h,c)
	drawline(x0-1,y0,x0+w-1,y0,c)--bugfix top left
	drawline(x0,y0+h-1,x0+w-1,y0+h-1,c)
	drawline(x0,y0,x0,y0+h-1,c)
	drawline(x0+w-1,y0,x0+w-1,y0+h-1,c)
end

function replaceInArea(x0,y0,w,h,oldc,newc)
	for x=0,w-1,1 do
		for y=0,h-1,1 do
			if getpicturepixel(x0+x,y0+y) == oldc then
				putpicturepixel(x0+x,y0+y,newc)
			end
		end
	end
end

local moved, key, mx, my, mb, Paintbrush_X, Paintbrush_Y, cxold,cyold
mb = 0
cxold = -1
cyold = -1

while (mb == 0) do
	-- undocument functions Paintbrush_X and Paintbrush_Y, there they are...
	moved, key, mx, my, mb, Paintbrush_X, Paintbrush_Y = waitinput(0)
	statusmessage("Cell: "..guesswidth.."x8 ("..Paintbrush_X..","..Paintbrush_Y..")")
	
	cx,cy=getCellCoord(Paintbrush_X,Paintbrush_Y,guesswidth,guessheight)
	if (cx ~= cxold or cy ~= cyold) then
		if cxold > -1 then
			drawCell(cxold,cyold,guesswidth,guessheight,cell) -- restore the cell
		end
		cell=getCell(cx,cy,guesswidth,guessheight) -- backup the cell
		highlightCell(cx,cy,guesswidth,guessheight,getforecolor())
		updatescreen()
	end
	cxold = cx
	cyold = cy
	if (key ~= 0) then
		drawCell(cxold,cyold,guesswidth,guessheight,cell) -- restore the cell before exit
		return false
	end
end
drawCell(cxold,cyold,guesswidth,guessheight,cell) -- restore the cell before replace
if (mb == 1) then
	newColor = getforecolor()
elseif (mb == 2) then
	newColor = getbackcolor()
end
oldColor=getpicturepixel(Paintbrush_X,Paintbrush_Y)
replaceInArea(cx,cy,guesswidth,guessheight,oldColor,newColor)