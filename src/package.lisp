(defpackage #:cobweb
  (:use :cl)
  (:export  :*el-tags* :with-html :with-html-write
            :html-tag :tag-parent :parent :tag-body :body
            :depth :html-writer
            ;; begin autoexport
            ;; at 2024-06-27T00:01:14.382126-07:00
:el-html :attr-version :attr-manifest :el-head :attr-profile :el-title
 :el-base :attr-target :attr-href :el-link :attr-target :attr-urn :attr-rev
 :attr-methods :attr-charset :attr-fetchpriority :attr-disabled :attr-color
 :attr-blocking :attr-as :attr-sizes :attr-imagesizes :attr-imagesrcset
 :attr-title :attr-referrerpolicy :attr-type :attr-hreflang :attr-integrity
 :attr-media :attr-crossorigin :attr-rel :attr-href :el-meta :attr-scheme
 :attr-http-equiv :attr-media :attr-name :attr-content :attr-charset :el-style
 :attr-type :attr-title :attr-blocking :attr-media :el-body :attr-vlink
 :attr-topmargin :attr-text :attr-rightmargin :attr-marginwidth
 :attr-marginheight :attr-link :attr-leftmargin :attr-bottommargin
 :attr-bgcolor :attr-alink :el-article :el-section :el-nav :el-aside :el-h1
 :attr-align :el-h2 :attr-align :el-h3 :attr-align :el-h4 :attr-align :el-h5
 :attr-align :el-h6 :attr-align :el-hgroup :el-header :el-footer :el-address
 :el-p :attr-align :el-hr :attr-width :attr-size :attr-noshade :attr-color
 :attr-align :el-pre :attr-width :el-blockquote :attr-cite :el-ol :attr-compact
 :attr-type :attr-start :attr-reversed :el-ul :attr-type :attr-compact :el-menu
 :attr-compact :attr-label :attr-type :el-li :attr-type :attr-value :el-dl
 :attr-compact :el-dt :el-dd :el-figure :el-figcaption :el-main :el-search
 :el-div :attr-align :el-a :attr-urn :attr-rev :attr-name :attr-methods
 :attr-shape :attr-coords :attr-charset :attr-referrerpolicy :attr-type
 :attr-hreflang :attr-rel :attr-ping :attr-download :attr-target :attr-href
 :el-em :el-strong :el-small :el-s :el-cite :el-q :attr-cite :el-dfn
 :attr-title :el-abbr :attr-title :el-ruby :el-rt :el-rp :el-data :attr-value
 :el-time :attr-datetime :el-code :el-var :el-samp :el-kbd :el-sub :el-sup
 :el-i :el-b :el-u :el-mark :el-bdi :el-bdo :el-span :el-br :attr-clear :el-wbr
 :el-ins :attr-datetime :attr-cite :el-del :attr-datetime :attr-cite
 :el-picture :el-source :attr-height :attr-width :attr-src :attr-sizes
 :attr-srcset :attr-media :attr-type :el-img :attr-vspace :attr-hspace
 :attr-border :attr-align :attr-lowsrc :attr-longdesc :attr-name :attr-height
 :attr-width :attr-usemap :attr-ismap :attr-loading :attr-fetchpriority
 :attr-decoding :attr-referrerpolicy :attr-crossorigin :attr-sizes :attr-alt
 :attr-srcset :attr-src :el-iframe :attr-vspace :attr-scrolling
 :attr-marginwidth :attr-marginheight :attr-hspace :attr-framespacing
 :attr-frameborder :attr-allowtransparency :attr-align :attr-longdesc
 :attr-height :attr-width :attr-loading :attr-referrerpolicy
 :attr-allowfullscreen :attr-allow :attr-sandbox :attr-name :attr-srcdoc
 :attr-src :el-embed :attr-vspace :attr-hspace :attr-align :attr-name
 :attr-height :attr-width :attr-type :attr-src :el-object :attr-vspace
 :attr-hspace :attr-border :attr-align :attr-typemustmatch :attr-standby
 :attr-declare :attr-codetype :attr-codebase :attr-code :attr-classid
 :attr-archive :attr-usemap :attr-autocomplete :attr-disabled :attr-form
 :attr-height :attr-width :attr-name :attr-type :attr-data :el-video
 :attr-height :attr-width :attr-muted :attr-controls :attr-autoplay :attr-loop
 :attr-preload :attr-crossorigin :attr-src :attr-playsinline :attr-poster
 :el-audio :attr-muted :attr-controls :attr-autoplay :attr-loop :attr-preload
 :attr-crossorigin :attr-src :el-track :attr-default :attr-label :attr-srclang
 :attr-src :attr-kind :el-map :attr-name :el-area :attr-nohref :attr-type
 :attr-hreflang :attr-coords :attr-shape :attr-alt :attr-referrerpolicy
 :attr-type :attr-hreflang :attr-rel :attr-ping :attr-download :attr-target
 :attr-href :el-table :attr-width :attr-rules :attr-height :attr-frame
 :attr-cellspacing :attr-cellpadding :attr-bordercolor :attr-border
 :attr-bgcolor :attr-align :attr-summary :attr-datapagesize :el-caption
 :attr-align :el-colgroup :attr-span :el-col :attr-width :attr-valign
 :attr-charoff :attr-char :attr-align :attr-span :el-tbody :attr-valign
 :attr-height :attr-charoff :attr-char :attr-align :el-thead :el-tfoot :el-tr
 :attr-valign :attr-height :attr-charoff :attr-char :attr-bgcolor :attr-align
 :el-td :attr-width :attr-valign :attr-nowrap :attr-height :attr-charoff
 :attr-char :attr-bgcolor :attr-align :attr-scope :attr-axis :attr-abbr
 :attr-headers :attr-rowspan :attr-colspan :el-th :attr-width :attr-valign
 :attr-nowrap :attr-height :attr-charoff :attr-char :attr-bgcolor :attr-align
 :attr-axis :attr-headers :attr-rowspan :attr-colspan :attr-abbr :attr-scope
 :el-form :attr-accept :attr-formnovalidate :attr-novalidate :attr-formtarget
 :attr-target :attr-formenctype :attr-enctype :attr-formmethod :attr-method
 :attr-formaction :attr-action :attr-rel :attr-autocomplete :attr-name
 :attr-accept-charset :el-label :attr-for :el-input :attr-vspace :attr-hspace
 :attr-border :attr-align :attr-usemap :attr-ismap :attr-autocomplete
 :attr-disabled :attr-minlength :attr-maxlength :attr-dirname :attr-name
 :attr-form :attr-placeholder :attr-list :attr-step :attr-max :attr-min
 :attr-title :attr-pattern :attr-multiple :attr-required :attr-readonly
 :attr-size :attr-minlength :attr-maxlength :attr-alt :attr-src :attr-accept
 :attr-checked :attr-value :attr-type :el-button :attr-autocomplete
 :attr-formnovalidate :attr-novalidate :attr-formtarget :attr-target
 :attr-formenctype :attr-enctype :attr-formmethod :attr-method :attr-formaction
 :attr-action :attr-disabled :attr-name :attr-form :attr-value :attr-type
 :el-select :attr-autocomplete :attr-disabled :attr-name :attr-form
 :attr-required :attr-size :attr-multiple :el-datalist :el-optgroup :attr-label
 :attr-disabled :el-option :attr-name :attr-selected :attr-value :attr-label
 :attr-disabled :el-textarea :attr-autocomplete :attr-disabled :attr-minlength
 :attr-maxlength :attr-dirname :attr-name :attr-form :attr-placeholder
 :attr-required :attr-minlength :attr-maxlength :attr-wrap :attr-rows
 :attr-cols :attr-readonly :el-output :attr-autocomplete :attr-disabled
 :attr-name :attr-form :attr-for :el-progress :attr-max :attr-value :el-meter
 :attr-optimum :attr-high :attr-low :attr-value :attr-max :attr-min
 :el-fieldset :attr-autocomplete :attr-disabled :attr-name :attr-form
 :attr-disabled :el-legend :attr-align :el-details :attr-open :attr-name
 :el-summary :el-dialog :attr-open :el-script :attr-for :attr-event
 :attr-language :attr-charset :attr-fetchpriority :attr-blocking
 :attr-referrerpolicy :attr-integrity :attr-crossorigin :attr-defer :attr-async
 :attr-nomodule :attr-src :attr-type :el-noscript :el-template
 :attr-shadowrootserializable :attr-shadowrootclonable
 :attr-shadowrootdelegatesfocus :attr-shadowrootmode :el-slot :attr-name
 :el-canvas :attr-height :attr-width :el-applet :el-acronym :el-bgsound :el-dir
 :el-noframes :el-isindex :el-keygen :el-listing :el-menuitem :el-nextid
 :el-noembed :el-param :el-plaintext :el-rb :el-rtc :el-strike :el-xmp
 :el-basefont :el-big :el-blink :el-center :el-font :el-multicol :el-nobr
 :el-spacer :el-tt :el-marquee :attr-loop :attr-truespeed :attr-direction
 :attr-behavior :el-frameset :el-frame :el-global :attr-slot :attr-id
 :attr-class :attr-popovertargetaction :attr-popovertarget :attr-popover
 :attr-draggable :attr-enterkeyhint :attr-inputmode :attr-autocapitalize
 :attr-writingsuggestions :attr-spellcheck :attr-contenteditable
 :attr-accesskey :attr-autofocus :attr-hidden :attr-itemprop :attr-itemref
 :attr-itemid :attr-itemtype :attr-itemscope :attr-is :attr-style :attr-dir
 :attr-translate :attr-lang :attr-title :el-html :attr-version :attr-manifest
 :el-head :attr-profile :el-title :el-base :attr-target :attr-href :el-link
 :attr-target :attr-urn :attr-rev :attr-methods :attr-charset
 :attr-fetchpriority :attr-disabled :attr-color :attr-blocking :attr-as
 :attr-sizes :attr-imagesizes :attr-imagesrcset :attr-title
 :attr-referrerpolicy :attr-type :attr-hreflang :attr-integrity :attr-media
 :attr-crossorigin :attr-rel :attr-href :el-meta :attr-scheme :attr-http-equiv
 :attr-media :attr-name :attr-content :attr-charset :el-style :attr-type
 :attr-title :attr-blocking :attr-media :el-body :attr-vlink :attr-topmargin
 :attr-text :attr-rightmargin :attr-marginwidth :attr-marginheight :attr-link
 :attr-leftmargin :attr-bottommargin :attr-bgcolor :attr-alink :el-article
 :el-section :el-nav :el-aside :el-h1 :attr-align :el-h2 :attr-align :el-h3
 :attr-align :el-h4 :attr-align :el-h5 :attr-align :el-h6 :attr-align
 :el-hgroup :el-header :el-footer :el-address :el-p :attr-align :el-hr
 :attr-width :attr-size :attr-noshade :attr-color :attr-align :el-pre
 :attr-width :el-blockquote :attr-cite :el-ol :attr-compact :attr-type
 :attr-start :attr-reversed :el-ul :attr-type :attr-compact :el-menu
 :attr-compact :attr-label :attr-type :el-li :attr-type :attr-value :el-dl
 :attr-compact :el-dt :el-dd :el-figure :el-figcaption :el-main :el-search
 :el-div :attr-align :el-a :attr-urn :attr-rev :attr-name :attr-methods
 :attr-shape :attr-coords :attr-charset :attr-referrerpolicy :attr-type
 :attr-hreflang :attr-rel :attr-ping :attr-download :attr-target :attr-href
 :el-em :el-strong :el-small :el-s :el-cite :el-q :attr-cite :el-dfn
 :attr-title :el-abbr :attr-title :el-ruby :el-rt :el-rp :el-data :attr-value
 :el-time :attr-datetime :el-code :el-var :el-samp :el-kbd :el-sub :el-sup
 :el-i :el-b :el-u :el-mark :el-bdi :el-bdo :el-span :el-br :attr-clear :el-wbr
 :el-ins :attr-datetime :attr-cite :el-del :attr-datetime :attr-cite
 :el-picture :el-source :attr-height :attr-width :attr-src :attr-sizes
 :attr-srcset :attr-media :attr-type :el-img :attr-vspace :attr-hspace
 :attr-border :attr-align :attr-lowsrc :attr-longdesc :attr-name :attr-height
 :attr-width :attr-usemap :attr-ismap :attr-loading :attr-fetchpriority
 :attr-decoding :attr-referrerpolicy :attr-crossorigin :attr-sizes :attr-alt
 :attr-srcset :attr-src :el-iframe :attr-vspace :attr-scrolling
 :attr-marginwidth :attr-marginheight :attr-hspace :attr-framespacing
 :attr-frameborder :attr-allowtransparency :attr-align :attr-longdesc
 :attr-height :attr-width :attr-loading :attr-referrerpolicy
 :attr-allowfullscreen :attr-allow :attr-sandbox :attr-name :attr-srcdoc
 :attr-src :el-embed :attr-vspace :attr-hspace :attr-align :attr-name
 :attr-height :attr-width :attr-type :attr-src :el-object :attr-vspace
 :attr-hspace :attr-border :attr-align :attr-typemustmatch :attr-standby
 :attr-declare :attr-codetype :attr-codebase :attr-code :attr-classid
 :attr-archive :attr-usemap :attr-autocomplete :attr-disabled :attr-form
 :attr-height :attr-width :attr-name :attr-type :attr-data :el-video
 :attr-height :attr-width :attr-muted :attr-controls :attr-autoplay :attr-loop
 :attr-preload :attr-crossorigin :attr-src :attr-playsinline :attr-poster
 :el-audio :attr-muted :attr-controls :attr-autoplay :attr-loop :attr-preload
 :attr-crossorigin :attr-src :el-track :attr-default :attr-label :attr-srclang
 :attr-src :attr-kind :el-map :attr-name :el-area :attr-nohref :attr-type
 :attr-hreflang :attr-coords :attr-shape :attr-alt :attr-referrerpolicy
 :attr-type :attr-hreflang :attr-rel :attr-ping :attr-download :attr-target
 :attr-href :el-table :attr-width :attr-rules :attr-height :attr-frame
 :attr-cellspacing :attr-cellpadding :attr-bordercolor :attr-border
 :attr-bgcolor :attr-align :attr-summary :attr-datapagesize :el-caption
 :attr-align :el-colgroup :attr-span :el-col :attr-width :attr-valign
 :attr-charoff :attr-char :attr-align :attr-span :el-tbody :attr-valign
 :attr-height :attr-charoff :attr-char :attr-align :el-thead :el-tfoot :el-tr
 :attr-valign :attr-height :attr-charoff :attr-char :attr-bgcolor :attr-align
 :el-td :attr-width :attr-valign :attr-nowrap :attr-height :attr-charoff
 :attr-char :attr-bgcolor :attr-align :attr-scope :attr-axis :attr-abbr
 :attr-headers :attr-rowspan :attr-colspan :el-th :attr-width :attr-valign
 :attr-nowrap :attr-height :attr-charoff :attr-char :attr-bgcolor :attr-align
 :attr-axis :attr-headers :attr-rowspan :attr-colspan :attr-abbr :attr-scope
 :el-form :attr-accept :attr-formnovalidate :attr-novalidate :attr-formtarget
 :attr-target :attr-formenctype :attr-enctype :attr-formmethod :attr-method
 :attr-formaction :attr-action :attr-rel :attr-autocomplete :attr-name
 :attr-accept-charset :el-label :attr-for :el-input :attr-vspace :attr-hspace
 :attr-border :attr-align :attr-usemap :attr-ismap :attr-autocomplete
 :attr-disabled :attr-minlength :attr-maxlength :attr-dirname :attr-name
 :attr-form :attr-placeholder :attr-list :attr-step :attr-max :attr-min
 :attr-title :attr-pattern :attr-multiple :attr-required :attr-readonly
 :attr-size :attr-minlength :attr-maxlength :attr-alt :attr-src :attr-accept
 :attr-checked :attr-value :attr-type :el-button :attr-autocomplete
 :attr-formnovalidate :attr-novalidate :attr-formtarget :attr-target
 :attr-formenctype :attr-enctype :attr-formmethod :attr-method :attr-formaction
 :attr-action :attr-disabled :attr-name :attr-form :attr-value :attr-type
 :el-select :attr-autocomplete :attr-disabled :attr-name :attr-form
 :attr-required :attr-size :attr-multiple :el-datalist :el-optgroup :attr-label
 :attr-disabled :el-option :attr-name :attr-selected :attr-value :attr-label
 :attr-disabled :el-textarea :attr-autocomplete :attr-disabled :attr-minlength
 :attr-maxlength :attr-dirname :attr-name :attr-form :attr-placeholder
 :attr-required :attr-minlength :attr-maxlength :attr-wrap :attr-rows
 :attr-cols :attr-readonly :el-output :attr-autocomplete :attr-disabled
 :attr-name :attr-form :attr-for :el-progress :attr-max :attr-value :el-meter
 :attr-optimum :attr-high :attr-low :attr-value :attr-max :attr-min
 :el-fieldset :attr-autocomplete :attr-disabled :attr-name :attr-form
 :attr-disabled :el-legend :attr-align :el-details :attr-open :attr-name
 :el-summary :el-dialog :attr-open :el-script :attr-for :attr-event
 :attr-language :attr-charset :attr-fetchpriority :attr-blocking
 :attr-referrerpolicy :attr-integrity :attr-crossorigin :attr-defer :attr-async
 :attr-nomodule :attr-src :attr-type :el-noscript :el-template
 :attr-shadowrootserializable :attr-shadowrootclonable
 :attr-shadowrootdelegatesfocus :attr-shadowrootmode :el-slot :attr-name
 :el-canvas :attr-height :attr-width :el-applet :el-acronym :el-bgsound :el-dir
 :el-noframes :el-isindex :el-keygen :el-listing :el-menuitem :el-nextid
 :el-noembed :el-param :el-plaintext :el-rb :el-rtc :el-strike :el-xmp
 :el-basefont :el-big :el-blink :el-center :el-font :el-multicol :el-nobr
 :el-spacer :el-tt :el-marquee :attr-loop :attr-truespeed :attr-direction
 :attr-behavior :el-frameset :el-frame :el-global :attr-slot :attr-id
 :attr-class :attr-popovertargetaction :attr-popovertarget :attr-popover
 :attr-draggable :attr-enterkeyhint :attr-inputmode :attr-autocapitalize
 :attr-writingsuggestions :attr-spellcheck :attr-contenteditable
 :attr-accesskey :attr-autofocus :attr-hidden :attr-itemprop :attr-itemref
 :attr-itemid :attr-itemtype :attr-itemscope :attr-is :attr-style :attr-dir
 :attr-translate :attr-lang :attr-title))
