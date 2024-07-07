(defpackage #:cobweb
  (:use :cl)
  (:export  :*elem-tags* :with-html :with-html-write
            :xhtml :parent :html-body :body
            :depth :html-writer :fragment

;; begin autoexport at 2024-07-06T18:58:53.104459-07:00
            :elem-global :attr-slot :attr-id :attr-class :attr-popovertargetaction
 :attr-popovertarget :attr-popover :attr-draggable :attr-enterkeyhint
 :attr-inputmode :attr-autocapitalize :attr-writingsuggestions :attr-spellcheck
 :attr-contenteditable :attr-accesskey :attr-autofocus :attr-hidden
 :attr-itemprop :attr-itemref :attr-itemid :attr-itemtype :attr-itemscope
 :attr-is :attr-style :attr-dir :attr-translate :attr-lang :attr-title
            :elem-frame
            :elem-frameset
            :elem-marquee :attr-loop :attr-truespeed :attr-direction :attr-behavior
            :elem-tt
            :elem-spacer
            :elem-nobr
            :elem-multicol
            :elem-font
            :elem-center
            :elem-blink
            :elem-big
            :elem-basefont
            :elem-xmp
            :elem-strike
            :elem-rtc
            :elem-rb
            :elem-plaintext
            :elem-param
            :elem-noembed
            :elem-nextid
            :elem-menuitem
            :elem-listing
            :elem-keygen
            :elem-isindex
            :elem-noframes
            :elem-dir
            :elem-bgsound
            :elem-acronym
            :elem-applet
            :elem-canvas :attr-height :attr-width
            :elem-slot :attr-name
            :elem-template :attr-shadowrootserializable :attr-shadowrootclonable
 :attr-shadowrootdelegatesfocus :attr-shadowrootmode
            :elem-noscript
            :elem-script :attr-for :attr-event :attr-language :attr-charset
 :attr-fetchpriority :attr-blocking :attr-referrerpolicy :attr-integrity
 :attr-crossorigin :attr-defer :attr-async :attr-nomodule :attr-src :attr-type
            :elem-dialog :attr-open
            :elem-summary
            :elem-details :attr-open :attr-name
            :elem-legend :attr-align
            :elem-fieldset :attr-autocomplete :attr-disabled :attr-name :attr-form
 :attr-disabled
            :elem-meter :attr-optimum :attr-high :attr-low :attr-value :attr-max :attr-min
            :elem-progress :attr-max :attr-value
            :elem-output :attr-autocomplete :attr-disabled :attr-name :attr-form :attr-for
            :elem-textarea :attr-autocomplete :attr-disabled :attr-minlength
 :attr-maxlength :attr-dirname :attr-name :attr-form :attr-placeholder
 :attr-required :attr-minlength :attr-maxlength :attr-wrap :attr-rows
 :attr-cols :attr-readonly
            :elem-option :attr-name :attr-selected :attr-value :attr-label :attr-disabled
            :elem-optgroup :attr-label :attr-disabled
            :elem-datalist
            :elem-select :attr-autocomplete :attr-disabled :attr-name :attr-form
 :attr-required :attr-size :attr-multiple
            :elem-button :attr-autocomplete :attr-formnovalidate :attr-novalidate
 :attr-formtarget :attr-target :attr-formenctype :attr-enctype :attr-formmethod
 :attr-method :attr-formaction :attr-action :attr-disabled :attr-name
 :attr-form :attr-value :attr-type
            :elem-input :attr-vspace :attr-hspace :attr-border :attr-align :attr-usemap
 :attr-ismap :attr-autocomplete :attr-disabled :attr-minlength :attr-maxlength
 :attr-dirname :attr-name :attr-form :attr-placeholder :attr-list :attr-step
 :attr-max :attr-min :attr-title :attr-pattern :attr-multiple :attr-required
 :attr-readonly :attr-size :attr-minlength :attr-maxlength :attr-alt :attr-src
 :attr-accept :attr-checked :attr-value :attr-type
            :elem-label :attr-for
            :elem-form :attr-accept :attr-formnovalidate :attr-novalidate :attr-formtarget
 :attr-target :attr-formenctype :attr-enctype :attr-formmethod :attr-method
 :attr-formaction :attr-action :attr-rel :attr-autocomplete :attr-name
 :attr-accept-charset
            :elem-th :attr-width :attr-valign :attr-nowrap :attr-height :attr-charoff
 :attr-char :attr-bgcolor :attr-align :attr-axis :attr-headers :attr-rowspan
 :attr-colspan :attr-abbr :attr-scope
            :elem-td :attr-width :attr-valign :attr-nowrap :attr-height :attr-charoff
 :attr-char :attr-bgcolor :attr-align :attr-scope :attr-axis :attr-abbr
 :attr-headers :attr-rowspan :attr-colspan
            :elem-tr :attr-valign :attr-height :attr-charoff :attr-char :attr-bgcolor
 :attr-align
            :elem-tfoot
            :elem-thead
            :elem-tbody :attr-valign :attr-height :attr-charoff :attr-char :attr-align
            :elem-col :attr-width :attr-valign :attr-charoff :attr-char :attr-align
 :attr-span
            :elem-colgroup :attr-span
            :elem-caption :attr-align
            :elem-table :attr-width :attr-rules :attr-height :attr-frame :attr-cellspacing
 :attr-cellpadding :attr-bordercolor :attr-border :attr-bgcolor :attr-align
 :attr-summary :attr-datapagesize
            :elem-area :attr-nohref :attr-type :attr-hreflang :attr-coords :attr-shape
 :attr-alt :attr-referrerpolicy :attr-type :attr-hreflang :attr-rel :attr-ping
 :attr-download :attr-target :attr-href
            :elem-map :attr-name
            :elem-track :attr-default :attr-label :attr-srclang :attr-src :attr-kind
            :elem-audio :attr-muted :attr-controls :attr-autoplay :attr-loop :attr-preload
 :attr-crossorigin :attr-src
            :elem-video :attr-height :attr-width :attr-muted :attr-controls :attr-autoplay
 :attr-loop :attr-preload :attr-crossorigin :attr-src :attr-playsinline
 :attr-poster
            :elem-object :attr-vspace :attr-hspace :attr-border :attr-align
 :attr-typemustmatch :attr-standby :attr-declare :attr-codetype :attr-codebase
 :attr-code :attr-classid :attr-archive :attr-usemap :attr-autocomplete
 :attr-disabled :attr-form :attr-height :attr-width :attr-name :attr-type
 :attr-data
            :elem-embed :attr-vspace :attr-hspace :attr-align :attr-name :attr-height
 :attr-width :attr-type :attr-src
            :elem-iframe :attr-vspace :attr-scrolling :attr-marginwidth :attr-marginheight
 :attr-hspace :attr-framespacing :attr-frameborder :attr-allowtransparency
 :attr-align :attr-longdesc :attr-height :attr-width :attr-loading
 :attr-referrerpolicy :attr-allowfullscreen :attr-allow :attr-sandbox
 :attr-name :attr-srcdoc :attr-src
            :elem-img :attr-vspace :attr-hspace :attr-border :attr-align :attr-lowsrc
 :attr-longdesc :attr-name :attr-height :attr-width :attr-usemap :attr-ismap
 :attr-loading :attr-fetchpriority :attr-decoding :attr-referrerpolicy
 :attr-crossorigin :attr-sizes :attr-alt :attr-srcset :attr-src
            :elem-source :attr-height :attr-width :attr-src :attr-sizes :attr-srcset
 :attr-media :attr-type
            :elem-picture
            :elem-del :attr-datetime :attr-cite
            :elem-ins :attr-datetime :attr-cite
            :elem-wbr
            :elem-br :attr-clear
            :elem-span
            :elem-bdo
            :elem-bdi
            :elem-mark
            :elem-u
            :elem-b
            :elem-i
            :elem-sup
            :elem-sub
            :elem-kbd
            :elem-samp
            :elem-var
            :elem-code
            :elem-time :attr-datetime
            :elem-data :attr-value
            :elem-rp
            :elem-rt
            :elem-ruby
            :elem-abbr :attr-title
            :elem-dfn :attr-title
            :elem-q :attr-cite
            :elem-cite
            :elem-s
            :elem-small
            :elem-strong
            :elem-em
            :elem-a :attr-urn :attr-rev :attr-name :attr-methods :attr-shape :attr-coords
 :attr-charset :attr-referrerpolicy :attr-type :attr-hreflang :attr-rel
 :attr-ping :attr-download :attr-target :attr-href
            :elem-div :attr-align
            :elem-search
            :elem-main
            :elem-figcaption
            :elem-figure
            :elem-dd
            :elem-dt
            :elem-dl :attr-compact
            :elem-li :attr-type :attr-value
            :elem-menu :attr-compact :attr-label :attr-type
            :elem-ul :attr-type :attr-compact
            :elem-ol :attr-compact :attr-type :attr-start :attr-reversed
            :elem-blockquote :attr-cite
            :elem-pre :attr-width
            :elem-hr :attr-width :attr-size :attr-noshade :attr-color :attr-align
            :elem-p :attr-align
            :elem-address
            :elem-footer
            :elem-header
            :elem-hgroup
            :elem-h6 :attr-align
            :elem-h5 :attr-align
            :elem-h4 :attr-align
            :elem-h3 :attr-align
            :elem-h2 :attr-align
            :elem-h1 :attr-align
            :elem-aside
            :elem-nav
            :elem-section
            :elem-article
            :elem-body :attr-vlink :attr-topmargin :attr-text :attr-rightmargin
 :attr-marginwidth :attr-marginheight :attr-link :attr-leftmargin
 :attr-bottommargin :attr-bgcolor :attr-alink
            :elem-style :attr-type :attr-title :attr-blocking :attr-media
            :elem-meta :attr-scheme :attr-http-equiv :attr-media :attr-name :attr-content
 :attr-charset
            :elem-link :attr-target :attr-urn :attr-rev :attr-methods :attr-charset
 :attr-fetchpriority :attr-disabled :attr-color :attr-blocking :attr-as
 :attr-sizes :attr-imagesizes :attr-imagesrcset :attr-title
 :attr-referrerpolicy :attr-type :attr-hreflang :attr-integrity :attr-media
 :attr-crossorigin :attr-rel :attr-href
            :elem-base :attr-target :attr-href
            :elem-title
            :elem-head :attr-profile
            :elem-html :attr-version :attr-manifest
))