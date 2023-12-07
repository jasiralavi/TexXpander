# TexXpander

TexXpander is a simple text expander tool created for Linux users. It works off of text files that you put in your a directory of your choice. The default location is ~/Softwares/TexXpander folder. TexXpander is a bash script that uses xclip, xdotool, and zenity to let you type an abbreviation for something and it expands to whatever you have in the matching text file.

## Installation

1. Put `TexXpander.sh` somewhere on your system. I've chosen `~/Softwares` folder.
1. Create a keyboard shortcut that calls `~/Softwares/TexXpander.sh`
1. Create a `~/Softwares/TexXpander` directory where you store text files for expanding abbreviations

TexXpander relies on a couple command line tools:

- xdotool
- zenity
- xsel

If those aren't already installed on your system you can probably grab them from your distros package manager without any trouble. For example for Ubuntu you can get what you need with the following commands.

```
sudo apt install xsel xdotool zenity
```

## Usage

The text expansion files reside in your `~/Softwares/TexXpander` directory and can be organized in subdirectories. Name the files in the format of `abbreviation` where the filename is the thing you want to type and the content of the file is what you want to have pasted into your document.

I have `super+x` assigned to run `~/Softwares/TexXpander.sh`. 

Now, if I'm typing an email, it doesn't matter if I'm in gmail (using Firefox, Chrome, Opera, or Vivaldi), Thunderbird, Vim, or Nylas, the workflow is the same. I have a couple different email signatures that I use. For example, if want to use my email signature, I'll create a file `~/Softwares/TexXpander/sig.txt` that has all of my contact information.

### Setting Up Custom Keyboard Shortcuts

This process may be slightly different for you depending on what desktop environment and Linux distribution you have. I use this on Ubuntu 23.10 but each desktop environment has a slightly different way of setting up keyboard shortcuts. In short, just map `Super+X` (or whatever key combination you like) to the `TexXpander.sh` bash script. 

### How To Use TexXpander

After setting up the keyboard shortcut to launch TexXpander, to use TexXpander:

- Start composing an email or a document online
- Put your cursor where you want your expanded text needs to be pasted
- Type `Super+X` (or whatever keyboard shortcut you set up)
- A zenity window will appear with a list of files (file names are given as abbreviations)
- Type in `sig` and hit Enter (or click "Insert")
- The contents of `~/Softwares/TexXpander/sig.txt` is pasted into your document

If I'm not in a web browser I'm in the terminal working in Vim. I've got some TexXpander files that I use in Vim. The terminal works a little differently from other GUI apps in that you have to type `ctrl+shift+v` to paste stuff. In TexXpander.sh there is a check to see if the active window is a terminal. If so, it will paste using `ctrl+shift+v` if not then it will paste normally as `ctrl+v`.

**File names:**
 - Files can be named with or without the .txt extension. So both `sig` and `sig.txt` works.
 - Spaces are supported in file names. So you can have them named `sig 2.txt`, `sig long`, etc

**Hiding files:**

Sometimes you may need to temporarily hide some of the files or folders from being listed in the zenity window, may just to keep the list short.
This can be easily achived by renaming the file or folder to start with a hyphen (-).

In the example files given, file `-sig 2` and the folder `-eg2 hidden` along with all it contents will be hidden.
 - Add a hyphen (-) infront of a file name to hide the item from being listed in the popup window
 - Add a hyphen (-) infront of a folder name to hide it and all of its contents.

**Few Tips**
 - It's best to keep the files names short and abbreviated so that you can access them quickly by typing the abbreviation
 - Keep expansions of similar types (say those related particular project) grouped under a folder. This also makes it easier to hide them if required.
 - Short folder names (1-3 chars long) helps navigate faster with keyboard.

## History

**Version 1.1 - Dec 7, 2023**

- Fixed issue with inserting text to terminals.

**Version 1.0 - Dec 5, 2023**

- Initial release
- Changes from leehblue's texpander 2.0:
  - Spaces are supported in file names
  - Add a hyphen (-) infront of a file name to hide the item from being listed in the popup window
  - Add a hyphen (-) infront of a folder name to hide it and all of its contents

## Credits

Adapted from texpander by Lee Blue (leehblue)
https://github.com/leehblue/texpander
Last Version: 2.0 / Release: November 24, 2017

## Contributing

1. Fork TexXpander
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D
   
## License

General Public License v3.0
 
