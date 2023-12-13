# Authentication

An API-first authentication library, with some functionality
mirroring the Rodauth project.

## Features/problems

I've found that I generally override so much of Rodauth functionality,
I'm receiving less and less benefit of the built in HTTP interface that
it offers.

I'd much rather control that interface and interact with an API focused
version of that.

The +internal_request+ plugin that was added to Rodauth mirrored what I had
been doing for some time, but I'd still like to invert the problem, and
call the API for most functionality.


## Install

    bundle add adam12-authentication

## License

(The MIT License)

Copyright (c) 2023 Adam Daniels

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
