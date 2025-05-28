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
           :attr-shadowrootcustomelementregistry
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
(deftag html (elem-global) :html version manifest)
(deftag head (elem-global) :head profile)
(deftag title (elem-global) :title)
(deftag base (elem-global) :base target href)
(deftag link (elem-global) :link target urn rev methods charset fetchpriority
 disabled color blocking as sizes imagesizes imagesrcset title referrerpolicy
 type hreflang integrity media crossorigin rel href)
(deftag meta (elem-global) :meta scheme http-equiv media name content charset)
(deftag style (elem-global) :style type title blocking media)
(deftag body (elem-global) :body vlink topmargin text rightmargin marginwidth
 marginheight link leftmargin bottommargin bgcolor alink)
(deftag article (elem-global) :article)
(deftag section (elem-global) :section)
(deftag nav (elem-global) :nav)
(deftag aside (elem-global) :aside)
(deftag h1 (elem-global) :h1 align)
(deftag h2 (elem-global) :h2 align)
(deftag h3 (elem-global) :h3 align)
(deftag h4 (elem-global) :h4 align)
(deftag h5 (elem-global) :h5 align)
(deftag h6 (elem-global) :h6 align)
(deftag hgroup (elem-global) :hgroup)
(deftag header (elem-global) :header)
(deftag footer (elem-global) :footer)
(deftag address (elem-global) :address)
(deftag p (elem-global) :p align)
(deftag hr (elem-global) :hr width size noshade color align)
(deftag pre (elem-global) :pre width)
(deftag blockquote (elem-global) :blockquote cite)
(deftag ol (elem-global) :ol compact type start reversed)
(deftag ul (elem-global) :ul type compact)
(deftag menu (elem-global) :menu compact label type)
(deftag li (elem-global) :li type value)
(deftag dl (elem-global) :dl compact)
(deftag dt (elem-global) :dt)
(deftag dd (elem-global) :dd)
(deftag figure (elem-global) :figure)
(deftag figcaption (elem-global) :figcaption)
(deftag main (elem-global) :main)
;; (deftag search (elem-global) :search)
(deftag div (elem-global) :div align)
(deftag a (elem-global) :a urn rev name methods shape coords charset
 referrerpolicy type hreflang rel ping download target href)
(deftag em (elem-global) :em)
(deftag strong (elem-global) :strong)
(deftag small (elem-global) :small)
(deftag s (elem-global) :s)
(deftag cite (elem-global) :cite)
(deftag q (elem-global) :q cite)
(deftag dfn (elem-global) :dfn title)
(deftag abbr (elem-global) :abbr title)
(deftag ruby (elem-global) :ruby)
(deftag rt (elem-global) :rt)
(deftag rp (elem-global) :rp)
(deftag data (elem-global) :data value)
;; (deftag time (elem-global) :time datetime)
(deftag code (elem-global) :code)
(deftag var (elem-global) :var)
(deftag samp (elem-global) :samp)
(deftag kbd (elem-global) :kbd)
(deftag sub (elem-global) :sub)
(deftag sup (elem-global) :sup)
(deftag i (elem-global) :i)
(deftag b (elem-global) :b)
(deftag u (elem-global) :u)
(deftag mark (elem-global) :mark)
(deftag bdi (elem-global) :bdi)
(deftag bdo (elem-global) :bdo)
(deftag span (elem-global) :span)
(deftag br (elem-global) :br clear)
(deftag wbr (elem-global) :wbr)
(deftag ins (elem-global) :ins datetime cite)
(deftag del (elem-global) :del datetime cite)
(deftag picture (elem-global) :picture)
(deftag source (elem-global) :source height width src sizes srcset media type)
(deftag img (elem-global) :img vspace hspace border align lowsrc longdesc name
 height width usemap ismap loading fetchpriority decoding referrerpolicy
 crossorigin sizes alt srcset src)
(deftag iframe (elem-global) :iframe vspace scrolling marginwidth marginheight
 hspace framespacing frameborder allowtransparency align longdesc height width
 loading referrerpolicy allowfullscreen allow sandbox name srcdoc src)
(deftag embed (elem-global) :embed vspace hspace align name height width type
 src)
(deftag object (elem-global) :object vspace hspace border align typemustmatch
 standby declare codetype codebase code classid archive usemap autocomplete
 disabled form height width name type data)
(deftag video (elem-global) :video height width muted controls autoplay loop
 preload crossorigin src playsinline poster)
(deftag audio (elem-global) :audio muted controls autoplay loop preload
 crossorigin src)
(deftag track (elem-global) :track default label srclang src kind)
;; (deftag map (elem-global) :map name)
(deftag area (elem-global) :area nohref coords shape alt referrerpolicy type
 hreflang rel ping download target href)
(deftag table (elem-global) :table width rules height frame cellspacing
 cellpadding bordercolor border bgcolor align summary datapagesize)
(deftag caption (elem-global) :caption align)
(deftag colgroup (elem-global) :colgroup span)
(deftag col (elem-global) :col width valign charoff char align span)
(deftag tbody (elem-global) :tbody valign height charoff char align)
(deftag thead (elem-global) :thead)
(deftag tfoot (elem-global) :tfoot)
(deftag tr (elem-global) :tr valign height charoff char bgcolor align)
(deftag td (elem-global) :td width valign nowrap height charoff char bgcolor
 align scope axis abbr headers rowspan colspan)
(deftag th (elem-global) :th width valign nowrap height charoff char bgcolor
 align axis headers rowspan colspan abbr scope)
(deftag form (elem-global) :form accept formnovalidate novalidate formtarget
 target formenctype enctype formmethod method formaction action rel
 autocomplete name accept-charset)
(deftag label (elem-global) :label for)
(deftag input (elem-global) :input vspace hspace border align usemap ismap
 autocomplete disabled dirname name form placeholder list step max min title
 pattern multiple required readonly size minlength maxlength alt src accept
 colorspace alpha checked value type)
(deftag button (elem-global) :button autocomplete formnovalidate novalidate
 formtarget target formenctype enctype formmethod method formaction action
 disabled name form value command commandfor type)
(deftag select (elem-global) :select autocomplete disabled name form required
 size multiple)
(deftag datalist (elem-global) :datalist)
(deftag optgroup (elem-global) :optgroup label disabled)
(deftag option (elem-global) :option name selected value label disabled)
(deftag textarea (elem-global) :textarea autocomplete disabled dirname name
 form placeholder required minlength maxlength wrap rows cols readonly)
(deftag output (elem-global) :output autocomplete disabled name form for)
(deftag progress (elem-global) :progress max value)
(deftag meter (elem-global) :meter optimum high low value max min)
(deftag fieldset (elem-global) :fieldset autocomplete name form disabled)
(deftag legend (elem-global) :legend align)
(deftag details (elem-global) :details open name)
(deftag summary (elem-global) :summary)
(deftag dialog (elem-global) :dialog closedby open)
(deftag script (elem-global) :script for event language charset fetchpriority
 blocking referrerpolicy integrity crossorigin defer async nomodule src type)
(deftag noscript (elem-global) :noscript)
(deftag template (elem-global) :template shadowrootcustomelementregistry
 shadowrootserializable shadowrootclonable shadowrootdelegatesfocus
 shadowrootmode)
(deftag slot (elem-global) :slot name)
(deftag canvas (elem-global) :canvas height width)
(deftag applet (elem-global non-conforming-features) :applet)
(deftag acronym (elem-global non-conforming-features) :acronym)
(deftag bgsound (elem-global non-conforming-features) :bgsound)
(deftag dir (elem-global non-conforming-features) :dir)
(deftag noframes (elem-global non-conforming-features) :noframes)
(deftag isindex (elem-global non-conforming-features) :isindex)
(deftag keygen (elem-global non-conforming-features) :keygen)
(deftag listing (elem-global non-conforming-features) :listing)
(deftag menuitem (elem-global non-conforming-features) :menuitem)
(deftag nextid (elem-global non-conforming-features) :nextid)
(deftag noembed (elem-global non-conforming-features) :noembed)
(deftag param (elem-global non-conforming-features) :param)
(deftag plaintext (elem-global non-conforming-features) :plaintext)
(deftag rb (elem-global non-conforming-features) :rb)
(deftag rtc (elem-global non-conforming-features) :rtc)
(deftag strike (elem-global non-conforming-features) :strike)
(deftag xmp (elem-global non-conforming-features) :xmp)
(deftag basefont (elem-global non-conforming-features) :basefont)
(deftag big (elem-global non-conforming-features) :big)
(deftag blink (elem-global non-conforming-features) :blink)
(deftag center (elem-global non-conforming-features) :center)
(deftag font (elem-global non-conforming-features) :font)
(deftag multicol (elem-global non-conforming-features) :multicol)
(deftag nobr (elem-global non-conforming-features) :nobr)
(deftag spacer (elem-global non-conforming-features) :spacer)
(deftag tt (elem-global non-conforming-features) :tt)
(deftag marquee (elem-global) :marquee loop truespeed direction behavior)
(deftag frameset (elem-global) :frameset)
(deftag frame (elem-global) :frame)
