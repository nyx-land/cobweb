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
           ;; :map
           ;; :elem-map
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
           ;; :time
           ;; :elem-time
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
           ;; :search
           ;; :elem-search
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

(in-package :cobweb.spec)

(deftag global (xhtml) nil slot id class popovertargetaction popovertarget
 popover draggable enterkeyhint inputmode autocorrect autocapitalize
 writingsuggestions spellcheck contenteditable accesskey autofocus hidden
 itemprop itemref itemid itemtype itemscope is style dir translate lang title)
(deftag html (elem-global) t version manifest)
(deftag head (elem-global) t profile)
(deftag title (elem-global) t)
(deftag base (elem-global) t target href)
(deftag link (elem-global) t target urn rev methods charset fetchpriority
 disabled color blocking as sizes imagesizes imagesrcset title referrerpolicy
 type hreflang integrity media crossorigin rel href)
(deftag meta (elem-global) t scheme http-equiv media name content charset)
(deftag style (elem-global) t type title blocking media)
(deftag body (elem-global) t vlink topmargin text rightmargin marginwidth
 marginheight link leftmargin bottommargin bgcolor alink)
(deftag article (elem-global) t)
(deftag section (elem-global) t)
(deftag nav (elem-global) t)
(deftag aside (elem-global) t)
(deftag h1 (elem-global) t align)
(deftag h2 (elem-global) t align)
(deftag h3 (elem-global) t align)
(deftag h4 (elem-global) t align)
(deftag h5 (elem-global) t align)
(deftag h6 (elem-global) t align)
(deftag hgroup (elem-global) t)
(deftag header (elem-global) t)
(deftag footer (elem-global) t)
(deftag address (elem-global) t)
(deftag p (elem-global) t align)
(deftag hr (elem-global) t width size noshade color align)
(deftag pre (elem-global) t width)
(deftag blockquote (elem-global) t cite)
(deftag ol (elem-global) t compact type start reversed)
(deftag ul (elem-global) t type compact)
(deftag menu (elem-global) t compact label type)
(deftag li (elem-global) t type value)
(deftag dl (elem-global) t compact)
(deftag dt (elem-global) t)
(deftag dd (elem-global) t)
(deftag figure (elem-global) t)
(deftag figcaption (elem-global) t)
(deftag main (elem-global) t)
;;(deftag search (elem-global) t)
(deftag div (elem-global) t align)
(deftag a (elem-global) t urn rev name methods shape coords charset
 referrerpolicy type hreflang rel ping download target href)
(deftag em (elem-global) t)
(deftag strong (elem-global) t)
(deftag small (elem-global) t)
(deftag s (elem-global) t)
(deftag cite (elem-global) t)
(deftag q (elem-global) t cite)
(deftag dfn (elem-global) t title)
(deftag abbr (elem-global) t title)
(deftag ruby (elem-global) t)
(deftag rt (elem-global) t)
(deftag rp (elem-global) t)
(deftag data (elem-global) t value)
;; (deftag time (elem-global) t datetime)
(deftag code (elem-global) t)
(deftag var (elem-global) t)
(deftag samp (elem-global) t)
(deftag kbd (elem-global) t)
(deftag sub (elem-global) t)
(deftag sup (elem-global) t)
(deftag i (elem-global) t)
(deftag b (elem-global) t)
(deftag u (elem-global) t)
(deftag mark (elem-global) t)
(deftag bdi (elem-global) t)
(deftag bdo (elem-global) t)
(deftag span (elem-global) t)
(deftag br (elem-global) t clear)
(deftag wbr (elem-global) t)
(deftag ins (elem-global) t datetime cite)
(deftag del (elem-global) t datetime cite)
(deftag picture (elem-global) t)
(deftag source (elem-global) t height width src sizes srcset media type)
(deftag img (elem-global) t vspace hspace border align lowsrc longdesc name
 height width usemap ismap loading fetchpriority decoding referrerpolicy
 crossorigin sizes alt srcset src)
(deftag iframe (elem-global) t vspace scrolling marginwidth marginheight hspace
 framespacing frameborder allowtransparency align longdesc height width loading
 referrerpolicy allowfullscreen allow sandbox name srcdoc src)
(deftag embed (elem-global) t vspace hspace align name height width type src)
(deftag object (elem-global) t vspace hspace border align typemustmatch standby
 declare codetype codebase code classid archive usemap autocomplete disabled
 form height width name type data)
(deftag video (elem-global) t height width muted controls autoplay loop preload
 crossorigin src playsinline poster)
(deftag audio (elem-global) t muted controls autoplay loop preload crossorigin
 src)
(deftag track (elem-global) t default label srclang src kind)
;; (deftag map (elem-global) t name)
(deftag area (elem-global) t nohref coords shape alt referrerpolicy type
 hreflang rel ping download target href)
(deftag table (elem-global) t width rules height frame cellspacing cellpadding
 bordercolor border bgcolor align summary datapagesize)
(deftag caption (elem-global) t align)
(deftag colgroup (elem-global) t span)
(deftag col (elem-global) t width valign charoff char align span)
(deftag tbody (elem-global) t valign height charoff char align)
(deftag thead (elem-global) t)
(deftag tfoot (elem-global) t)
(deftag tr (elem-global) t valign height charoff char bgcolor align)
(deftag td (elem-global) t width valign nowrap height charoff char bgcolor
 align scope axis abbr headers rowspan colspan)
(deftag th (elem-global) t width valign nowrap height charoff char bgcolor
 align axis headers rowspan colspan abbr scope)
(deftag form (elem-global) t accept formnovalidate novalidate formtarget target
 formenctype enctype formmethod method formaction action rel autocomplete name
 accept-charset)
(deftag label (elem-global) t for)
(deftag input (elem-global) t vspace hspace border align usemap ismap
 autocomplete disabled dirname name form placeholder list step max min title
 pattern multiple required readonly size minlength maxlength alt src accept
 colorspace alpha checked value type)
(deftag button (elem-global) t autocomplete formnovalidate novalidate
 formtarget target formenctype enctype formmethod method formaction action
 disabled name form value command commandfor type)
(deftag select (elem-global) t autocomplete disabled name form required size
 multiple)
(deftag datalist (elem-global) t)
(deftag optgroup (elem-global) t label disabled)
(deftag option (elem-global) t name selected value label disabled)
(deftag textarea (elem-global) t autocomplete disabled dirname name form
 placeholder required minlength maxlength wrap rows cols readonly)
(deftag output (elem-global) t autocomplete disabled name form for)
(deftag progress (elem-global) t max value)
(deftag meter (elem-global) t optimum high low value max min)
(deftag fieldset (elem-global) t autocomplete name form disabled)
(deftag legend (elem-global) t align)
(deftag details (elem-global) t open name)
(deftag summary (elem-global) t)
(deftag dialog (elem-global) t closedby open)
(deftag script (elem-global) t for event language charset fetchpriority
 blocking referrerpolicy integrity crossorigin defer async nomodule src type)
(deftag noscript (elem-global) t)
(deftag template (elem-global) t shadowrootserializable shadowrootclonable
 shadowrootdelegatesfocus shadowrootmode)
(deftag slot (elem-global) t name)
(deftag canvas (elem-global) t height width)
(deftag applet (elem-global non-conforming-features) t)
(deftag acronym (elem-global non-conforming-features) t)
(deftag bgsound (elem-global non-conforming-features) t)
(deftag dir (elem-global non-conforming-features) t)
(deftag noframes (elem-global non-conforming-features) t)
(deftag isindex (elem-global non-conforming-features) t)
(deftag keygen (elem-global non-conforming-features) t)
(deftag listing (elem-global non-conforming-features) t)
(deftag menuitem (elem-global non-conforming-features) t)
(deftag nextid (elem-global non-conforming-features) t)
(deftag noembed (elem-global non-conforming-features) t)
(deftag param (elem-global non-conforming-features) t)
(deftag plaintext (elem-global non-conforming-features) t)
(deftag rb (elem-global non-conforming-features) t)
(deftag rtc (elem-global non-conforming-features) t)
(deftag strike (elem-global non-conforming-features) t)
(deftag xmp (elem-global non-conforming-features) t)
(deftag basefont (elem-global non-conforming-features) t)
(deftag big (elem-global non-conforming-features) t)
(deftag blink (elem-global non-conforming-features) t)
(deftag center (elem-global non-conforming-features) t)
(deftag font (elem-global non-conforming-features) t)
(deftag multicol (elem-global non-conforming-features) t)
(deftag nobr (elem-global non-conforming-features) t)
(deftag spacer (elem-global non-conforming-features) t)
(deftag tt (elem-global non-conforming-features) t)
(deftag marquee (elem-global) t loop truespeed direction behavior)
(deftag frameset (elem-global) t)
(deftag frame (elem-global) t)
