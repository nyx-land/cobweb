(defpackage #:cobweb.spec
  (:use :cl :cobweb.core)
  (:export :frame
           :elem-frame
           :frameset
           :elem-frameset
           :marquee
           :elem-marquee
           :attr-truespeed
           :attr-direction
           :attr-behavior
           :tt
           :elem-tt
           :spacer
           :elem-spacer
           :nobr
           :elem-nobr
           :multicol
           :elem-multicol
           :font
           :elem-font
           :center
           :elem-center
           :blink
           :elem-blink
           :big
           :elem-big
           :basefont
           :elem-basefont
           :xmp
           :elem-xmp
           :strike
           :elem-strike
           :rtc
           :elem-rtc
           :rb
           :elem-rb
           :plaintext
           :elem-plaintext
           :param
           :elem-param
           :noembed
           :elem-noembed
           :nextid
           :elem-nextid
           :menuitem
           :elem-menuitem
           :listing
           :elem-listing
           :keygen
           :elem-keygen
           :isindex
           :elem-isindex
           :noframes
           :elem-noframes
           :dir
           :elem-dir
           :bgsound
           :elem-bgsound
           :acronym
           :elem-acronym
           :applet
           :elem-applet
           :canvas
           :elem-canvas
           :slot
           :elem-slot
           :template
           :elem-template
           :attr-shadowrootserializable
           :attr-shadowrootclonable
           :attr-shadowrootdelegatesfocus
           :attr-shadowrootmode
           :noscript
           :elem-noscript
           :script
           :elem-script
           :attr-event
           :attr-language
           :attr-defer
           :attr-async
           :attr-nomodule
           :dialog
           :elem-dialog
           :attr-closedby
           :summary
           :elem-summary
           :details
           :elem-details
           :attr-open
           :legend
           :elem-legend
           :fieldset
           :elem-fieldset
           :meter
           :elem-meter
           :attr-optimum
           :attr-high
           :attr-low
           :progress
           :elem-progress
           :output
           :elem-output
           :textarea
           :elem-textarea
           :attr-wrap
           :attr-rows
           :attr-cols
           :option
           :elem-option
           :attr-selected
           :optgroup
           :elem-optgroup
           :datalist
           :elem-datalist
           :select
           :elem-select
           :button
           :elem-button
           :attr-command
           :attr-commandfor
           :input
           :elem-input
           :attr-dirname
           :attr-placeholder
           :attr-list
           :attr-step
           :attr-max
           :attr-min
           :attr-pattern
           :attr-multiple
           :attr-required
           :attr-readonly
           :attr-minlength
           :attr-maxlength
           :attr-colorspace
           :attr-alpha
           :attr-checked
           :label
           :elem-label
           :attr-for
           :form
           :elem-form
           :attr-accept
           :attr-formnovalidate
           :attr-novalidate
           :attr-formtarget
           :attr-formenctype
           :attr-enctype
           :attr-formmethod
           :attr-method
           :attr-formaction
           :attr-action
           :attr-accept-charset
           :th
           :elem-th
           :td
           :elem-td
           :attr-nowrap
           :attr-scope
           :attr-axis
           :attr-abbr
           :attr-headers
           :attr-rowspan
           :attr-colspan
           :tr
           :elem-tr
           :tfoot
           :elem-tfoot
           :thead
           :elem-thead
           :tbody
           :elem-tbody
           :col
           :elem-col
           :attr-valign
           :attr-charoff
           :attr-char
           :colgroup
           :elem-colgroup
           :attr-span
           :caption
           :elem-caption
           :table
           :elem-table
           :attr-rules
           :attr-frame
           :attr-cellspacing
           :attr-cellpadding
           :attr-bordercolor
           :attr-summary
           :attr-datapagesize
           :area
           :elem-area
           :attr-nohref
           :map
           :elem-map
           :track
           :elem-track
           :attr-default
           :attr-srclang
           :attr-kind
           :audio
           :elem-audio
           :video
           :elem-video
           :attr-muted
           :attr-controls
           :attr-autoplay
           :attr-loop
           :attr-preload
           :attr-playsinline
           :attr-poster
           :object
           :elem-object
           :attr-typemustmatch
           :attr-standby
           :attr-declare
           :attr-codetype
           :attr-codebase
           :attr-code
           :attr-classid
           :attr-archive
           :attr-autocomplete
           :attr-form
           :attr-data
           :embed
           :elem-embed
           :iframe
           :elem-iframe
           :attr-scrolling
           :attr-framespacing
           :attr-frameborder
           :attr-allowtransparency
           :attr-allowfullscreen
           :attr-allow
           :attr-sandbox
           :attr-srcdoc
           :img
           :elem-img
           :attr-vspace
           :attr-hspace
           :attr-border
           :attr-lowsrc
           :attr-longdesc
           :attr-usemap
           :attr-ismap
           :attr-loading
           :attr-decoding
           :attr-alt
           :source
           :elem-source
           :attr-height
           :attr-src
           :attr-srcset
           :picture
           :elem-picture
           :del
           :elem-del
           :ins
           :elem-ins
           :wbr
           :elem-wbr
           :br
           :elem-br
           :attr-clear
           :span
           :elem-span
           :bdo
           :elem-bdo
           :bdi
           :elem-bdi
           :mark
           :elem-mark
           :u
           :elem-u
           :b
           :elem-b
           :i
           :elem-i
           :sup
           :elem-sup
           :sub
           :elem-sub
           :kbd
           :elem-kbd
           :samp
           :elem-samp
           :var
           :elem-var
           :code
           :elem-code
           :time
           :elem-time
           :attr-datetime
           :data
           :elem-data
           :rp
           :elem-rp
           :rt
           :elem-rt
           :ruby
           :elem-ruby
           :abbr
           :elem-abbr
           :dfn
           :elem-dfn
           :q
           :elem-q
           :cite
           :elem-cite
           :s
           :elem-s
           :small
           :elem-small
           :strong
           :elem-strong
           :em
           :elem-em
           :a
           :elem-a
           :attr-shape
           :attr-coords
           :attr-ping
           :attr-download
           :div
           :elem-div
           :search
           :elem-search
           :main
           :elem-main
           :figcaption
           :elem-figcaption
           :figure
           :elem-figure
           :dd
           :elem-dd
           :dt
           :elem-dt
           :dl
           :elem-dl
           :li
           :elem-li
           :attr-value
           :menu
           :elem-menu
           :attr-label
           :ul
           :elem-ul
           :ol
           :elem-ol
           :attr-compact
           :attr-start
           :attr-reversed
           :blockquote
           :elem-blockquote
           :attr-cite
           :pre
           :elem-pre
           :hr
           :elem-hr
           :attr-width
           :attr-size
           :attr-noshade
           :p
           :elem-p
           :address
           :elem-address
           :footer
           :elem-footer
           :header
           :elem-header
           :hgroup
           :elem-hgroup
           :h6
           :elem-h6
           :h5
           :elem-h5
           :h4
           :elem-h4
           :h3
           :elem-h3
           :h2
           :elem-h2
           :h1
           :elem-h1
           :attr-align
           :aside
           :elem-aside
           :nav
           :elem-nav
           :section
           :elem-section
           :article
           :elem-article
           :body
           :elem-body
           :attr-vlink
           :attr-topmargin
           :attr-text
           :attr-rightmargin
           :attr-marginwidth
           :attr-marginheight
           :attr-link
           :attr-leftmargin
           :attr-bottommargin
           :attr-bgcolor
           :attr-alink
           :style
           :elem-style
           :meta
           :elem-meta
           :attr-scheme
           :attr-http-equiv
           :attr-name
           :attr-content
           :link
           :elem-link
           :attr-urn
           :attr-rev
           :attr-methods
           :attr-charset
           :attr-fetchpriority
           :attr-disabled
           :attr-color
           :attr-blocking
           :attr-as
           :attr-sizes
           :attr-imagesizes
           :attr-imagesrcset
           :attr-referrerpolicy
           :attr-type
           :attr-hreflang
           :attr-integrity
           :attr-media
           :attr-crossorigin
           :attr-rel
           :base
           :elem-base
           :attr-target
           :attr-href
           :title
           :elem-title
           :head
           :elem-head
           :attr-profile
           :html
           :elem-html
           :attr-version
           :attr-manifest
           :global
           :elem-global
           :attr-slot
           :attr-id
           :attr-class
           :attr-popovertargetaction
           :attr-popovertarget
           :attr-popover
           :attr-draggable
           :attr-enterkeyhint
           :attr-inputmode
           :attr-autocorrect
           :attr-autocapitalize
           :attr-writingsuggestions
           :attr-spellcheck
           :attr-contenteditable
           :attr-accesskey
           :attr-autofocus
           :attr-hidden
           :attr-itemprop
           :attr-itemref
           :attr-itemid
           :attr-itemtype
           :attr-itemscope
           :attr-is
           :attr-style
           :attr-dir
           :attr-translate
           :attr-lang
           :attr-title))

(in-package :cobweb)

(define-xhtml global (xhtml) nil slot id class popovertargetaction
  popovertarget popover draggable enterkeyhint inputmode autocorrect
  autocapitalize writingsuggestions spellcheck contenteditable accesskey
  autofocus hidden itemprop itemref itemid itemtype itemscope is style dir
  translate lang title)
(define-xhtml html (elem-global) t version manifest)
(define-xhtml head (elem-global) t profile)
(define-xhtml title (elem-global) t)
(define-xhtml base (elem-global) t target href)
(define-xhtml link (elem-global) t target urn rev methods charset fetchpriority
 disabled color blocking as sizes imagesizes imagesrcset title referrerpolicy
 type hreflang integrity media crossorigin rel href)
(define-xhtml meta (elem-global) t scheme http-equiv media name content charset)
(define-xhtml style (elem-global) t type title blocking media)
(define-xhtml body (elem-global) t vlink topmargin text rightmargin marginwidth
 marginheight link leftmargin bottommargin bgcolor alink)
(define-xhtml article (elem-global) t)
(define-xhtml section (elem-global) t)
(define-xhtml nav (elem-global) t)
(define-xhtml aside (elem-global) t)
(define-xhtml h1 (elem-global) t align)
(define-xhtml h2 (elem-global) t align)
(define-xhtml h3 (elem-global) t align)
(define-xhtml h4 (elem-global) t align)
(define-xhtml h5 (elem-global) t align)
(define-xhtml h6 (elem-global) t align)
(define-xhtml hgroup (elem-global) t)
(define-xhtml header (elem-global) t)
(define-xhtml footer (elem-global) t)
(define-xhtml address (elem-global) t)
(define-xhtml p (elem-global) t align)
(define-xhtml hr (elem-global) t width size noshade color align)
(define-xhtml pre (elem-global) t width)
(define-xhtml blockquote (elem-global) t cite)
(define-xhtml ol (elem-global) t compact type start reversed)
(define-xhtml ul (elem-global) t type compact)
(define-xhtml menu (elem-global) t compact label type)
(define-xhtml li (elem-global) t type value)
(define-xhtml dl (elem-global) t compact)
(define-xhtml dt (elem-global) t)
(define-xhtml dd (elem-global) t)
(define-xhtml figure (elem-global) t)
(define-xhtml figcaption (elem-global) t)
(define-xhtml main (elem-global) t)
;;(define-xhtml search (elem-global) t)
(define-xhtml div (elem-global) t align)
(define-xhtml a (elem-global) t urn rev name methods shape coords charset
 referrerpolicy type hreflang rel ping download target href)
(define-xhtml em (elem-global) t)
(define-xhtml strong (elem-global) t)
(define-xhtml small (elem-global) t)
(define-xhtml s (elem-global) t)
(define-xhtml cite (elem-global) t)
(define-xhtml q (elem-global) t cite)
(define-xhtml dfn (elem-global) t title)
(define-xhtml abbr (elem-global) t title)
(define-xhtml ruby (elem-global) t)
(define-xhtml rt (elem-global) t)
(define-xhtml rp (elem-global) t)
(define-xhtml data (elem-global) t value)
;; (define-xhtml time (elem-global) t datetime)
(define-xhtml code (elem-global) t)
(define-xhtml var (elem-global) t)
(define-xhtml samp (elem-global) t)
(define-xhtml kbd (elem-global) t)
(define-xhtml sub (elem-global) t)
(define-xhtml sup (elem-global) t)
(define-xhtml i (elem-global) t)
(define-xhtml b (elem-global) t)
(define-xhtml u (elem-global) t)
(define-xhtml mark (elem-global) t)
(define-xhtml bdi (elem-global) t)
(define-xhtml bdo (elem-global) t)
(define-xhtml span (elem-global) t)
(define-xhtml br (elem-global) t clear)
(define-xhtml wbr (elem-global) t)
(define-xhtml ins (elem-global) t datetime cite)
(define-xhtml del (elem-global) t datetime cite)
(define-xhtml picture (elem-global) t)
(define-xhtml source (elem-global) t height width src sizes srcset media type)
(define-xhtml img (elem-global) t vspace hspace border align lowsrc longdesc
 name height width usemap ismap loading fetchpriority decoding referrerpolicy
 crossorigin sizes alt srcset src)
(define-xhtml iframe (elem-global) t vspace scrolling marginwidth marginheight
 hspace framespacing frameborder allowtransparency align longdesc height width
 loading referrerpolicy allowfullscreen allow sandbox name srcdoc src)
(define-xhtml embed (elem-global) t vspace hspace align name height width type
 src)
(define-xhtml object (elem-global) t vspace hspace border align typemustmatch
 standby declare codetype codebase code classid archive usemap autocomplete
 disabled form height width name type data)
(define-xhtml video (elem-global) t height width muted controls autoplay loop
 preload crossorigin src playsinline poster)
(define-xhtml audio (elem-global) t muted controls autoplay loop preload
 crossorigin src)
(define-xhtml track (elem-global) t default label srclang src kind)
;; (define-xhtml map (elem-global) t name)
(define-xhtml area (elem-global) t nohref coords shape alt referrerpolicy type
 hreflang rel ping download target href)
(define-xhtml table (elem-global) t width rules height frame cellspacing
 cellpadding bordercolor border bgcolor align summary datapagesize)
(define-xhtml caption (elem-global) t align)
(define-xhtml colgroup (elem-global) t span)
(define-xhtml col (elem-global) t width valign charoff char align span)
(define-xhtml tbody (elem-global) t valign height charoff char align)
(define-xhtml thead (elem-global) t)
(define-xhtml tfoot (elem-global) t)
(define-xhtml tr (elem-global) t valign height charoff char bgcolor align)
(define-xhtml td (elem-global) t width valign nowrap height charoff char
 bgcolor align scope axis abbr headers rowspan colspan)
(define-xhtml th (elem-global) t width valign nowrap height charoff char
 bgcolor align axis headers rowspan colspan abbr scope)
(define-xhtml form (elem-global) t accept formnovalidate novalidate formtarget
 target formenctype enctype formmethod method formaction action rel
 autocomplete name accept-charset)
(define-xhtml label (elem-global) t for)
(define-xhtml input (elem-global) t vspace hspace border align usemap ismap
 autocomplete disabled dirname name form placeholder list step max min title
 pattern multiple required readonly size minlength maxlength alt src accept
 colorspace alpha checked value type)
(define-xhtml button (elem-global) t autocomplete formnovalidate novalidate
 formtarget target formenctype enctype formmethod method formaction action
 disabled name form value command commandfor type)
(define-xhtml select (elem-global) t autocomplete disabled name form required
 size multiple)
(define-xhtml datalist (elem-global) t)
(define-xhtml optgroup (elem-global) t label disabled)
(define-xhtml option (elem-global) t name selected value label disabled)
(define-xhtml textarea (elem-global) t autocomplete disabled dirname name form
 placeholder required minlength maxlength wrap rows cols readonly)
(define-xhtml output (elem-global) t autocomplete disabled name form for)
(define-xhtml progress (elem-global) t max value)
(define-xhtml meter (elem-global) t optimum high low value max min)
(define-xhtml fieldset (elem-global) t autocomplete name form disabled)
(define-xhtml legend (elem-global) t align)
(define-xhtml details (elem-global) t open name)
(define-xhtml summary (elem-global) t)
(define-xhtml dialog (elem-global) t closedby open)
(define-xhtml script (elem-global) t for event language charset fetchpriority
 blocking referrerpolicy integrity crossorigin defer async nomodule src type)
(define-xhtml noscript (elem-global) t)
(define-xhtml template (elem-global) t shadowrootserializable
 shadowrootclonable shadowrootdelegatesfocus shadowrootmode)
(define-xhtml slot (elem-global) t name)
(define-xhtml canvas (elem-global) t height width)
(define-xhtml applet (elem-global non-conforming-features) t)
(define-xhtml acronym (elem-global non-conforming-features) t)
(define-xhtml bgsound (elem-global non-conforming-features) t)
(define-xhtml dir (elem-global non-conforming-features) t)
(define-xhtml noframes (elem-global non-conforming-features) t)
(define-xhtml isindex (elem-global non-conforming-features) t)
(define-xhtml keygen (elem-global non-conforming-features) t)
(define-xhtml listing (elem-global non-conforming-features) t)
(define-xhtml menuitem (elem-global non-conforming-features) t)
(define-xhtml nextid (elem-global non-conforming-features) t)
(define-xhtml noembed (elem-global non-conforming-features) t)
(define-xhtml param (elem-global non-conforming-features) t)
(define-xhtml plaintext (elem-global non-conforming-features) t)
(define-xhtml rb (elem-global non-conforming-features) t)
(define-xhtml rtc (elem-global non-conforming-features) t)
(define-xhtml strike (elem-global non-conforming-features) t)
(define-xhtml xmp (elem-global non-conforming-features) t)
(define-xhtml basefont (elem-global non-conforming-features) t)
(define-xhtml big (elem-global non-conforming-features) t)
(define-xhtml blink (elem-global non-conforming-features) t)
(define-xhtml center (elem-global non-conforming-features) t)
(define-xhtml font (elem-global non-conforming-features) t)
(define-xhtml multicol (elem-global non-conforming-features) t)
(define-xhtml nobr (elem-global non-conforming-features) t)
(define-xhtml spacer (elem-global non-conforming-features) t)
(define-xhtml tt (elem-global non-conforming-features) t)
(define-xhtml marquee (elem-global) t loop truespeed direction behavior)
(define-xhtml frameset (elem-global) t)
(define-xhtml frame (elem-global) t)
