This tool can save web pages as HTML or as a single file. It's called Monolith, and you can find it on GitHub. However, the source code isn't compiled into an executable file, so I compiled it. Here's the link:

[monolith](https://github.com/Y2Z/monolith)

Here's a simple explanation of how to use it: There are three files: "monolith", "monolith.cmd", and "monolith.exe". The first one is compiled for Mac. To use it: `./monolith website_address > xxx.html`
By default, Monolith outputs the generated HTML to the standard output stream, which is the current terminal. Using `>` redirects the output and overwrites the file.

After execution, a corresponding file named `xxx.html` will appear in this directory.

The other two are for Windows. To simplify usage, I wrote a CMD script. Simply click `monolith.cmd` and paste the address to complete the download.

After downloading, you'll find only one HTML file on your local machine. After opening it, we found that the images and JS information were all there, and the layout was normal. Since HTML is for storing plain text information, where are the images?

The answer is obvious: they're inside the HTML file. To facilitate the transmission of small images, there's something called Base64, which can convert binary information into plain text. This is very common today when using JSON to transmit data, as it can reduce one request (as an aside), and this is the principle used here. Monolith converts binary content such as images into plain text and saves it in the HTML file.

Comparing the source code, the `src` information has become a base64 formatted image—that string of gibberish. Copy that string of gibberish, search for a base64 to image converter online, paste it in, and you'll find the image we saw. In this way, no matter how many files there are on this website, they will all be saved in a single HTML file, and it can be used offline.

Of course, base64 encoded images are slightly larger than native images, which might be your current concern. However, Monolith handles file size specially. We can see how much the file size differs between downloading directly with Chrome and downloading using Monolith. We compressed the web pages downloaded using both methods with 7-Zip.

We can see that downloading using Monolith is more than half the size of downloading directly from Chrome!

Finally, it's worth mentioning the limitations: regardless of the method, it's almost impossible to download videos from video websites. This is because current video URLs are encrypted with tokens; similarly, other request information encrypted with tokens cannot be downloaded.
