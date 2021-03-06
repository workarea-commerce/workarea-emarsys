Workarea Emarsys 2.0.1 (2020-01-29)
--------------------------------------------------------------------------------

*   Bump version for release

    Ben Crouse

*   Fix Class Paths

    Some paths in `app/` did not match their constant names, resulting in
    issues when trying to decorate these classes. Move the offending files
    to their correct location so as to enable decorating them.

    Fixes #10

    EMARSYS-3
    Tom Scott



Workarea Emarsys 2.0.0 (2020-01-21)
--------------------------------------------------------------------------------

*   Update Emarsys to use public API's

    Commit removes escher request signing and uses the public APIs. Sets
    the gateway to production by default because sandboxes are only issues by special
    request.
    Jeff Yucis



Workarea Emarsys 1.1.0 (2019-11-26)
--------------------------------------------------------------------------------

*   Updates for v3.5 compatibility.

    Removes the custom build configuration panel in favor
    of the out-of-box admin settings available in 3.5.

    EMARSYS-1
    Jeff Yucis



Workarea Emarsys 1.0.3 (2019-10-03)
--------------------------------------------------------------------------------

*   Update README

    Matt Duffy

*   Fix missing time option to escher

    Ben Crouse



Workarea Emarsys 1.0.2 (2019-08-22)
--------------------------------------------------------------------------------

*   Open Source!
 
 

Workarea Emarsys 1.0.1 (2019-06-25)
--------------------------------------------------------------------------------

*   Update test to allow support for Workarea < v3.4

    EMARSYS-11
    Jake Beresford



Workarea Emarsys 1.0.0 (2019-06-11)
--------------------------------------------------------------------------------

*   Workarea Emarsys

    Emarsys marketing platform integration. Includes contact, order and product
    syncing as well as a full Web Extend Integration.
    Eric Pigeon



