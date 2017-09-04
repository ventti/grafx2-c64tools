# grafx2-c64tools
C64 plugins for GrafX2 by Vent/TRIAD

These LUA scripts are written to be used with [GrafX2 2.4](http://pulkomandy.tk/projects/GrafX2/) as 'Brush Factory' plugins.

GrafX2 is a drawing tool created by Sunset Designs.

## Installation
1. Locate your GrafX2 share directory (usually 'share/grafx2' under your GrafX2 installation directory).
2. In that directory, ```git clone https://github.com/vent3AD/grafx2-c64tools.git```.
3. Start GrafX2. Select 'Brush Effects/Factory' with right-mouse-button.
4. Follow the installation guide under each script.

## Cell Color Check
This is a tool for checking color clashes in a picture. 
The tool indicates the cells with color clashes by drawing a square over the particular cell (character block).
The color of the generated square indicates how many colors there are in the block. 
Cell with 5 colors is indicated with color number #5 in the palette, 6 colors with #6, etc.

### Usage
Initiate the script with the keyboard shortcut.

Adjustable parameters:

* Cell width
   Cell or character block width in pixels. 
* Cell height
   Cell or character block height in pixels.
* Colors in a cell
   Number of individual colors within a single cell/character block sized by (Cell width x Cell height).
* Use a common bgcolor
   If selected, one of the colors shall be same for each cell.
* Common background color
   The value of common bgcolor. Order numbers 0..15 are colors in the current palette. 
   If -1 is selected, the script will determine the background color resulting with the least number of cells having clashes.
* Show vacant cells
   If selected, not only cells with clashes are shown. Also cells with less colors than maximum allowed are marked.

Block size and colours are initially guessed by picture dimensions as follows:

| Mode                      | X dimension | Y dimension | Default block size | Number of colors | Common background color |
| ------------------------- |:-----------:|:-----------:|:------------------:|:----------------:|:-----------------------:|
| Hires		                | 320         | 200         | 8x8                | 2                | No                      |
| Multicolor                | 160         | 200         | 4x8                | 4                | Yes                     |
| Multicolor with borders   | 192         | 272         | 4x8                | 4                | Yes                     |
| Quarter-character PETSCII | 80          | 50          | 2x2                | 2                | Yes                     |

Multicolor with borders -mode omits clashes in the borders. Character block grid origo (x0,y0) = 16,34 (as wide pixels. 32,34 as square pixels)

### Installation
Precondition: The generic installation procedure has been successfully completed.
Select __CellColorCheck.lua__ in the file menu. Assign a keyboard shortcut e.g. __Alt__+__F1__.

### Pro tips
* You can sketch up your drawing rather freely and later optimize the palette. Just let the script determine, which background color causes least issues with your content.
* Before running the script, select the background color manually. The script pre-selects that value by default.
* Before running the script, create a new layer with __Alt__+__Ins__. 
  The script draws the clash indicator squares on the currently selected layer.
  It is then easy to fix the picture by showing/hiding the layer with the indicators.
* The script does not take the actual palette into account. You can use the script for other platforms as well, e.g. MSX and Screen 2.

## Cell Filler
This is a tool for quickly replacing a color with another in a character block. Block size is guessed by picture dimensions.
If image width is 160px, 4x8px block (C64 multicolor) will be used. Otherwise block size is 8x8px.

### Installation
Precondition: The generic installation procedure has been successfully completed.

Select __CellFiller.lua__ in the file menu. Assign a keyboard shortcut e.g. __Ctrl__+__'F'__.

### Example

![CellFiller before](examples/cf1.png "Original image")

![CellFiller during](examples/cf2.png "Selecting the cell to be modified")

![CellFiller after](examples/cf3.png "Purple pixels now filled with brown")

## Acknowledgements
This project began by modifying Paulo Silva's example script.
Brush Script documentation at [GrafX2 User Guide](http://pulkomandy.tk/projects/GrafX2/wiki/UserGuide/Lua)

## Disclaimer
No copyright, do whatever you want. It's just a few lines of bad code anybody could write. 

No warranty, either. It may work, or it may not. It may blow up your computer, or it may not.


