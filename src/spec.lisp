(in-package :cobweb)

(defparameter *elem-tags* (make-hash-table))

(defclass xhtml () 
  ((parent    :initarg :parent :accessor parent)
   (depth     :initarg :depth  :accessor depth)
   (html-body :initarg :body   :accessor html-body)
   (tag       :initarg :tag    :accessor tag))
  (:default-initargs
   :body (vector)))

(defclass fragment (xhtml) ()
  (:documentation "An abstract middleware class between XHTML and every
HTML element."))

(defclass non-conforming-features () ())


;; begin autogenerate at 2024-07-05T00:34:08.687802-07:00
(defclass elem-global ()
  ((attr-slot :initarg :slot :accessor attr-slot)
   (attr-id :initarg :id :accessor attr-id)
   (attr-class :initarg :class :accessor attr-class)
   (attr-popovertargetaction :initarg :popovertargetaction :accessor attr-popovertargetaction)
   (attr-popovertarget :initarg :popovertarget :accessor attr-popovertarget)
   (attr-popover :initarg :popover :accessor attr-popover)
   (attr-draggable :initarg :draggable :accessor attr-draggable)
   (attr-enterkeyhint :initarg :enterkeyhint :accessor attr-enterkeyhint)
   (attr-inputmode :initarg :inputmode :accessor attr-inputmode)
   (attr-autocapitalize :initarg :autocapitalize :accessor attr-autocapitalize)
   (attr-writingsuggestions :initarg :writingsuggestions :accessor attr-writingsuggestions)
   (attr-spellcheck :initarg :spellcheck :accessor attr-spellcheck)
   (attr-contenteditable :initarg :contenteditable :accessor attr-contenteditable)
   (attr-accesskey :initarg :accesskey :accessor attr-accesskey)
   (attr-autofocus :initarg :autofocus :accessor attr-autofocus)
   (attr-hidden :initarg :hidden :accessor attr-hidden)
   (attr-itemprop :initarg :itemprop :accessor attr-itemprop)
   (attr-itemref :initarg :itemref :accessor attr-itemref)
   (attr-itemid :initarg :itemid :accessor attr-itemid)
   (attr-itemtype :initarg :itemtype :accessor attr-itemtype)
   (attr-itemscope :initarg :itemscope :accessor attr-itemscope)
   (attr-is :initarg :is :accessor attr-is)
   (attr-style :initarg :style :accessor attr-style)
   (attr-dir :initarg :dir :accessor attr-dir)
   (attr-translate :initarg :translate :accessor attr-translate)
   (attr-lang :initarg :lang :accessor attr-lang)
   (attr-title :initarg :title :accessor attr-title)))

(defclass elem-frame (elem-global fragment) ()
  (:default-initargs
   :tag 'frame))

(defclass elem-frameset (elem-global fragment) ()
  (:default-initargs
   :tag 'frameset))

(defclass elem-marquee (elem-global fragment)
  ((attr-loop :initarg :loop :accessor attr-loop)
   (attr-truespeed :initarg :truespeed :accessor attr-truespeed)
   (attr-direction :initarg :direction :accessor attr-direction)
   (attr-behavior :initarg :behavior :accessor attr-behavior))
  (:default-initargs
   :tag 'marquee))

(defclass elem-tt (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'tt))

(defclass elem-spacer (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'spacer))

(defclass elem-nobr (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'nobr))

(defclass elem-multicol (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'multicol))

(defclass elem-font (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'font))

(defclass elem-center (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'center))

(defclass elem-blink (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'blink))

(defclass elem-big (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'big))

(defclass elem-basefont (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'basefont))

(defclass elem-xmp (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'xmp))

(defclass elem-strike (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'strike))

(defclass elem-rtc (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'rtc))

(defclass elem-rb (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'rb))

(defclass elem-plaintext (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'plaintext))

(defclass elem-param (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'param))

(defclass elem-noembed (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'noembed))

(defclass elem-nextid (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'nextid))

(defclass elem-menuitem (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'menuitem))

(defclass elem-listing (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'listing))

(defclass elem-keygen (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'keygen))

(defclass elem-isindex (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'isindex))

(defclass elem-noframes (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'noframes))

(defclass elem-dir (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'dir))

(defclass elem-bgsound (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'bgsound))

(defclass elem-acronym (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'acronym))

(defclass elem-applet (elem-global fragment non-conforming-features) ()
  (:default-initargs
   :tag 'applet))

(defclass elem-canvas (elem-global fragment)
  ((attr-height :initarg :height :accessor attr-height)
   (attr-width :initarg :width :accessor attr-width))
  (:default-initargs
   :tag 'canvas))

(defclass elem-slot (elem-global fragment)
  ((attr-name :initarg :name :accessor attr-name))
  (:default-initargs
   :tag 'slot))

(defclass elem-template (elem-global fragment)
  ((attr-shadowrootserializable :initarg :shadowrootserializable :accessor attr-shadowrootserializable)
   (attr-shadowrootclonable :initarg :shadowrootclonable :accessor attr-shadowrootclonable)
   (attr-shadowrootdelegatesfocus :initarg :shadowrootdelegatesfocus :accessor attr-shadowrootdelegatesfocus)
   (attr-shadowrootmode :initarg :shadowrootmode :accessor attr-shadowrootmode))
  (:default-initargs
   :tag 'template))

(defclass elem-noscript (elem-global fragment) ()
  (:default-initargs
   :tag 'noscript))

(defclass elem-script (elem-global fragment)
  ((attr-for :initarg :for :accessor attr-for)
   (attr-event :initarg :event :accessor attr-event)
   (attr-language :initarg :language :accessor attr-language)
   (attr-charset :initarg :charset :accessor attr-charset)
   (attr-fetchpriority :initarg :fetchpriority :accessor attr-fetchpriority)
   (attr-blocking :initarg :blocking :accessor attr-blocking)
   (attr-referrerpolicy :initarg :referrerpolicy :accessor attr-referrerpolicy)
   (attr-integrity :initarg :integrity :accessor attr-integrity)
   (attr-crossorigin :initarg :crossorigin :accessor attr-crossorigin)
   (attr-defer :initarg :defer :accessor attr-defer)
   (attr-async :initarg :async :accessor attr-async)
   (attr-nomodule :initarg :nomodule :accessor attr-nomodule)
   (attr-src :initarg :src :accessor attr-src)
   (attr-type :initarg :type :accessor attr-type))
  (:default-initargs
   :tag 'script))

(defclass elem-dialog (elem-global fragment)
  ((attr-open :initarg :open :accessor attr-open))
  (:default-initargs
   :tag 'dialog))

(defclass elem-summary (elem-global fragment) ()
  (:default-initargs
   :tag 'summary))

(defclass elem-details (elem-global fragment)
  ((attr-open :initarg :open :accessor attr-open)
   (attr-name :initarg :name :accessor attr-name))
  (:default-initargs
   :tag 'details))

(defclass elem-legend (elem-global fragment)
  ((attr-align :initarg :align :accessor attr-align))
  (:default-initargs
   :tag 'legend))

(defclass elem-fieldset (elem-global fragment)
  ((attr-autocomplete :initarg :autocomplete :accessor attr-autocomplete)
   (attr-name :initarg :name :accessor attr-name)
   (attr-form :initarg :form :accessor attr-form)
   (attr-disabled :initarg :disabled :accessor attr-disabled))
  (:default-initargs
   :tag 'fieldset))

(defclass elem-meter (elem-global fragment)
  ((attr-optimum :initarg :optimum :accessor attr-optimum)
   (attr-high :initarg :high :accessor attr-high)
   (attr-low :initarg :low :accessor attr-low)
   (attr-value :initarg :value :accessor attr-value)
   (attr-max :initarg :max :accessor attr-max)
   (attr-min :initarg :min :accessor attr-min))
  (:default-initargs
   :tag 'meter))

(defclass elem-progress (elem-global fragment)
  ((attr-max :initarg :max :accessor attr-max)
   (attr-value :initarg :value :accessor attr-value))
  (:default-initargs
   :tag 'progress))

(defclass elem-output (elem-global fragment)
  ((attr-autocomplete :initarg :autocomplete :accessor attr-autocomplete)
   (attr-disabled :initarg :disabled :accessor attr-disabled)
   (attr-name :initarg :name :accessor attr-name)
   (attr-form :initarg :form :accessor attr-form)
   (attr-for :initarg :for :accessor attr-for))
  (:default-initargs
   :tag 'output))

(defclass elem-textarea (elem-global fragment)
  ((attr-autocomplete :initarg :autocomplete :accessor attr-autocomplete)
   (attr-disabled :initarg :disabled :accessor attr-disabled)
   (attr-dirname :initarg :dirname :accessor attr-dirname)
   (attr-name :initarg :name :accessor attr-name)
   (attr-form :initarg :form :accessor attr-form)
   (attr-placeholder :initarg :placeholder :accessor attr-placeholder)
   (attr-required :initarg :required :accessor attr-required)
   (attr-minlength :initarg :minlength :accessor attr-minlength)
   (attr-maxlength :initarg :maxlength :accessor attr-maxlength)
   (attr-wrap :initarg :wrap :accessor attr-wrap)
   (attr-rows :initarg :rows :accessor attr-rows)
   (attr-cols :initarg :cols :accessor attr-cols)
   (attr-readonly :initarg :readonly :accessor attr-readonly))
  (:default-initargs
   :tag 'textarea))

(defclass elem-option (elem-global fragment)
  ((attr-name :initarg :name :accessor attr-name)
   (attr-selected :initarg :selected :accessor attr-selected)
   (attr-value :initarg :value :accessor attr-value)
   (attr-label :initarg :label :accessor attr-label)
   (attr-disabled :initarg :disabled :accessor attr-disabled))
  (:default-initargs
   :tag 'option))

(defclass elem-optgroup (elem-global fragment)
  ((attr-label :initarg :label :accessor attr-label)
   (attr-disabled :initarg :disabled :accessor attr-disabled))
  (:default-initargs
   :tag 'optgroup))

(defclass elem-datalist (elem-global fragment) ()
  (:default-initargs
   :tag 'datalist))

(defclass elem-select (elem-global fragment)
  ((attr-autocomplete :initarg :autocomplete :accessor attr-autocomplete)
   (attr-disabled :initarg :disabled :accessor attr-disabled)
   (attr-name :initarg :name :accessor attr-name)
   (attr-form :initarg :form :accessor attr-form)
   (attr-required :initarg :required :accessor attr-required)
   (attr-size :initarg :size :accessor attr-size)
   (attr-multiple :initarg :multiple :accessor attr-multiple))
  (:default-initargs
   :tag 'select))

(defclass elem-button (elem-global fragment)
  ((attr-autocomplete :initarg :autocomplete :accessor attr-autocomplete)
   (attr-formnovalidate :initarg :formnovalidate :accessor attr-formnovalidate)
   (attr-novalidate :initarg :novalidate :accessor attr-novalidate)
   (attr-formtarget :initarg :formtarget :accessor attr-formtarget)
   (attr-target :initarg :target :accessor attr-target)
   (attr-formenctype :initarg :formenctype :accessor attr-formenctype)
   (attr-enctype :initarg :enctype :accessor attr-enctype)
   (attr-formmethod :initarg :formmethod :accessor attr-formmethod)
   (attr-method :initarg :method :accessor attr-method)
   (attr-formaction :initarg :formaction :accessor attr-formaction)
   (attr-action :initarg :action :accessor attr-action)
   (attr-disabled :initarg :disabled :accessor attr-disabled)
   (attr-name :initarg :name :accessor attr-name)
   (attr-form :initarg :form :accessor attr-form)
   (attr-value :initarg :value :accessor attr-value)
   (attr-type :initarg :type :accessor attr-type))
  (:default-initargs
   :tag 'button))

(defclass elem-input (elem-global fragment)
  ((attr-vspace :initarg :vspace :accessor attr-vspace)
   (attr-hspace :initarg :hspace :accessor attr-hspace)
   (attr-border :initarg :border :accessor attr-border)
   (attr-align :initarg :align :accessor attr-align)
   (attr-usemap :initarg :usemap :accessor attr-usemap)
   (attr-ismap :initarg :ismap :accessor attr-ismap)
   (attr-autocomplete :initarg :autocomplete :accessor attr-autocomplete)
   (attr-disabled :initarg :disabled :accessor attr-disabled)
   (attr-dirname :initarg :dirname :accessor attr-dirname)
   (attr-name :initarg :name :accessor attr-name)
   (attr-form :initarg :form :accessor attr-form)
   (attr-placeholder :initarg :placeholder :accessor attr-placeholder)
   (attr-list :initarg :list :accessor attr-list)
   (attr-step :initarg :step :accessor attr-step)
   (attr-max :initarg :max :accessor attr-max)
   (attr-min :initarg :min :accessor attr-min)
   (attr-title :initarg :title :accessor attr-title)
   (attr-pattern :initarg :pattern :accessor attr-pattern)
   (attr-multiple :initarg :multiple :accessor attr-multiple)
   (attr-required :initarg :required :accessor attr-required)
   (attr-readonly :initarg :readonly :accessor attr-readonly)
   (attr-size :initarg :size :accessor attr-size)
   (attr-minlength :initarg :minlength :accessor attr-minlength)
   (attr-maxlength :initarg :maxlength :accessor attr-maxlength)
   (attr-alt :initarg :alt :accessor attr-alt)
   (attr-src :initarg :src :accessor attr-src)
   (attr-accept :initarg :accept :accessor attr-accept)
   (attr-checked :initarg :checked :accessor attr-checked)
   (attr-value :initarg :value :accessor attr-value)
   (attr-type :initarg :type :accessor attr-type))
  (:default-initargs
   :tag 'input))

(defclass elem-label (elem-global fragment)
  ((attr-for :initarg :for :accessor attr-for))
  (:default-initargs
   :tag 'label))

(defclass elem-form (elem-global fragment)
  ((attr-accept :initarg :accept :accessor attr-accept)
   (attr-formnovalidate :initarg :formnovalidate :accessor attr-formnovalidate)
   (attr-novalidate :initarg :novalidate :accessor attr-novalidate)
   (attr-formtarget :initarg :formtarget :accessor attr-formtarget)
   (attr-target :initarg :target :accessor attr-target)
   (attr-formenctype :initarg :formenctype :accessor attr-formenctype)
   (attr-enctype :initarg :enctype :accessor attr-enctype)
   (attr-formmethod :initarg :formmethod :accessor attr-formmethod)
   (attr-method :initarg :method :accessor attr-method)
   (attr-formaction :initarg :formaction :accessor attr-formaction)
   (attr-action :initarg :action :accessor attr-action)
   (attr-rel :initarg :rel :accessor attr-rel)
   (attr-autocomplete :initarg :autocomplete :accessor attr-autocomplete)
   (attr-name :initarg :name :accessor attr-name)
   (attr-accept-charset :initarg :accept-charset :accessor attr-accept-charset))
  (:default-initargs
   :tag 'form))

(defclass elem-th (elem-global fragment)
  ((attr-width :initarg :width :accessor attr-width)
   (attr-valign :initarg :valign :accessor attr-valign)
   (attr-nowrap :initarg :nowrap :accessor attr-nowrap)
   (attr-height :initarg :height :accessor attr-height)
   (attr-charoff :initarg :charoff :accessor attr-charoff)
   (attr-char :initarg :char :accessor attr-char)
   (attr-bgcolor :initarg :bgcolor :accessor attr-bgcolor)
   (attr-align :initarg :align :accessor attr-align)
   (attr-axis :initarg :axis :accessor attr-axis)
   (attr-headers :initarg :headers :accessor attr-headers)
   (attr-rowspan :initarg :rowspan :accessor attr-rowspan)
   (attr-colspan :initarg :colspan :accessor attr-colspan)
   (attr-abbr :initarg :abbr :accessor attr-abbr)
   (attr-scope :initarg :scope :accessor attr-scope))
  (:default-initargs
   :tag 'th))

(defclass elem-td (elem-global fragment)
  ((attr-width :initarg :width :accessor attr-width)
   (attr-valign :initarg :valign :accessor attr-valign)
   (attr-nowrap :initarg :nowrap :accessor attr-nowrap)
   (attr-height :initarg :height :accessor attr-height)
   (attr-charoff :initarg :charoff :accessor attr-charoff)
   (attr-char :initarg :char :accessor attr-char)
   (attr-bgcolor :initarg :bgcolor :accessor attr-bgcolor)
   (attr-align :initarg :align :accessor attr-align)
   (attr-scope :initarg :scope :accessor attr-scope)
   (attr-axis :initarg :axis :accessor attr-axis)
   (attr-abbr :initarg :abbr :accessor attr-abbr)
   (attr-headers :initarg :headers :accessor attr-headers)
   (attr-rowspan :initarg :rowspan :accessor attr-rowspan)
   (attr-colspan :initarg :colspan :accessor attr-colspan))
  (:default-initargs
   :tag 'td))

(defclass elem-tr (elem-global fragment)
  ((attr-valign :initarg :valign :accessor attr-valign)
   (attr-height :initarg :height :accessor attr-height)
   (attr-charoff :initarg :charoff :accessor attr-charoff)
   (attr-char :initarg :char :accessor attr-char)
   (attr-bgcolor :initarg :bgcolor :accessor attr-bgcolor)
   (attr-align :initarg :align :accessor attr-align))
  (:default-initargs
   :tag 'tr))

(defclass elem-tfoot (elem-global fragment) ()
  (:default-initargs
   :tag 'tfoot))

(defclass elem-thead (elem-global fragment) ()
  (:default-initargs
   :tag 'thead))

(defclass elem-tbody (elem-global fragment)
  ((attr-valign :initarg :valign :accessor attr-valign)
   (attr-height :initarg :height :accessor attr-height)
   (attr-charoff :initarg :charoff :accessor attr-charoff)
   (attr-char :initarg :char :accessor attr-char)
   (attr-align :initarg :align :accessor attr-align))
  (:default-initargs
   :tag 'tbody))

(defclass elem-col (elem-global fragment)
  ((attr-width :initarg :width :accessor attr-width)
   (attr-valign :initarg :valign :accessor attr-valign)
   (attr-charoff :initarg :charoff :accessor attr-charoff)
   (attr-char :initarg :char :accessor attr-char)
   (attr-align :initarg :align :accessor attr-align)
   (attr-span :initarg :span :accessor attr-span))
  (:default-initargs
   :tag 'col))

(defclass elem-colgroup (elem-global fragment)
  ((attr-span :initarg :span :accessor attr-span))
  (:default-initargs
   :tag 'colgroup))

(defclass elem-caption (elem-global fragment)
  ((attr-align :initarg :align :accessor attr-align))
  (:default-initargs
   :tag 'caption))

(defclass elem-table (elem-global fragment)
  ((attr-width :initarg :width :accessor attr-width)
   (attr-rules :initarg :rules :accessor attr-rules)
   (attr-height :initarg :height :accessor attr-height)
   (attr-frame :initarg :frame :accessor attr-frame)
   (attr-cellspacing :initarg :cellspacing :accessor attr-cellspacing)
   (attr-cellpadding :initarg :cellpadding :accessor attr-cellpadding)
   (attr-bordercolor :initarg :bordercolor :accessor attr-bordercolor)
   (attr-border :initarg :border :accessor attr-border)
   (attr-bgcolor :initarg :bgcolor :accessor attr-bgcolor)
   (attr-align :initarg :align :accessor attr-align)
   (attr-summary :initarg :summary :accessor attr-summary)
   (attr-datapagesize :initarg :datapagesize :accessor attr-datapagesize))
  (:default-initargs
   :tag 'table))

(defclass elem-area (elem-global fragment)
  ((attr-nohref :initarg :nohref :accessor attr-nohref)
   (attr-coords :initarg :coords :accessor attr-coords)
   (attr-shape :initarg :shape :accessor attr-shape)
   (attr-alt :initarg :alt :accessor attr-alt)
   (attr-referrerpolicy :initarg :referrerpolicy :accessor attr-referrerpolicy)
   (attr-type :initarg :type :accessor attr-type)
   (attr-hreflang :initarg :hreflang :accessor attr-hreflang)
   (attr-rel :initarg :rel :accessor attr-rel)
   (attr-ping :initarg :ping :accessor attr-ping)
   (attr-download :initarg :download :accessor attr-download)
   (attr-target :initarg :target :accessor attr-target)
   (attr-href :initarg :href :accessor attr-href))
  (:default-initargs
   :tag 'area))

(defclass elem-map (elem-global fragment)
  ((attr-name :initarg :name :accessor attr-name))
  (:default-initargs
   :tag 'map))

(defclass elem-track (elem-global fragment)
  ((attr-default :initarg :default :accessor attr-default)
   (attr-label :initarg :label :accessor attr-label)
   (attr-srclang :initarg :srclang :accessor attr-srclang)
   (attr-src :initarg :src :accessor attr-src)
   (attr-kind :initarg :kind :accessor attr-kind))
  (:default-initargs
   :tag 'track))

(defclass elem-audio (elem-global fragment)
  ((attr-muted :initarg :muted :accessor attr-muted)
   (attr-controls :initarg :controls :accessor attr-controls)
   (attr-autoplay :initarg :autoplay :accessor attr-autoplay)
   (attr-loop :initarg :loop :accessor attr-loop)
   (attr-preload :initarg :preload :accessor attr-preload)
   (attr-crossorigin :initarg :crossorigin :accessor attr-crossorigin)
   (attr-src :initarg :src :accessor attr-src))
  (:default-initargs
   :tag 'audio))

(defclass elem-video (elem-global fragment)
  ((attr-height :initarg :height :accessor attr-height)
   (attr-width :initarg :width :accessor attr-width)
   (attr-muted :initarg :muted :accessor attr-muted)
   (attr-controls :initarg :controls :accessor attr-controls)
   (attr-autoplay :initarg :autoplay :accessor attr-autoplay)
   (attr-loop :initarg :loop :accessor attr-loop)
   (attr-preload :initarg :preload :accessor attr-preload)
   (attr-crossorigin :initarg :crossorigin :accessor attr-crossorigin)
   (attr-src :initarg :src :accessor attr-src)
   (attr-playsinline :initarg :playsinline :accessor attr-playsinline)
   (attr-poster :initarg :poster :accessor attr-poster))
  (:default-initargs
   :tag 'video))

(defclass elem-object (elem-global fragment)
  ((attr-vspace :initarg :vspace :accessor attr-vspace)
   (attr-hspace :initarg :hspace :accessor attr-hspace)
   (attr-border :initarg :border :accessor attr-border)
   (attr-align :initarg :align :accessor attr-align)
   (attr-typemustmatch :initarg :typemustmatch :accessor attr-typemustmatch)
   (attr-standby :initarg :standby :accessor attr-standby)
   (attr-declare :initarg :declare :accessor attr-declare)
   (attr-codetype :initarg :codetype :accessor attr-codetype)
   (attr-codebase :initarg :codebase :accessor attr-codebase)
   (attr-code :initarg :code :accessor attr-code)
   (attr-classid :initarg :classid :accessor attr-classid)
   (attr-archive :initarg :archive :accessor attr-archive)
   (attr-usemap :initarg :usemap :accessor attr-usemap)
   (attr-autocomplete :initarg :autocomplete :accessor attr-autocomplete)
   (attr-disabled :initarg :disabled :accessor attr-disabled)
   (attr-form :initarg :form :accessor attr-form)
   (attr-height :initarg :height :accessor attr-height)
   (attr-width :initarg :width :accessor attr-width)
   (attr-name :initarg :name :accessor attr-name)
   (attr-type :initarg :type :accessor attr-type)
   (attr-data :initarg :data :accessor attr-data))
  (:default-initargs
   :tag 'object))

(defclass elem-embed (elem-global fragment)
  ((attr-vspace :initarg :vspace :accessor attr-vspace)
   (attr-hspace :initarg :hspace :accessor attr-hspace)
   (attr-align :initarg :align :accessor attr-align)
   (attr-name :initarg :name :accessor attr-name)
   (attr-height :initarg :height :accessor attr-height)
   (attr-width :initarg :width :accessor attr-width)
   (attr-type :initarg :type :accessor attr-type)
   (attr-src :initarg :src :accessor attr-src))
  (:default-initargs
   :tag 'embed))

(defclass elem-iframe (elem-global fragment)
  ((attr-vspace :initarg :vspace :accessor attr-vspace)
   (attr-scrolling :initarg :scrolling :accessor attr-scrolling)
   (attr-marginwidth :initarg :marginwidth :accessor attr-marginwidth)
   (attr-marginheight :initarg :marginheight :accessor attr-marginheight)
   (attr-hspace :initarg :hspace :accessor attr-hspace)
   (attr-framespacing :initarg :framespacing :accessor attr-framespacing)
   (attr-frameborder :initarg :frameborder :accessor attr-frameborder)
   (attr-allowtransparency :initarg :allowtransparency :accessor attr-allowtransparency)
   (attr-align :initarg :align :accessor attr-align)
   (attr-longdesc :initarg :longdesc :accessor attr-longdesc)
   (attr-height :initarg :height :accessor attr-height)
   (attr-width :initarg :width :accessor attr-width)
   (attr-loading :initarg :loading :accessor attr-loading)
   (attr-referrerpolicy :initarg :referrerpolicy :accessor attr-referrerpolicy)
   (attr-allowfullscreen :initarg :allowfullscreen :accessor attr-allowfullscreen)
   (attr-allow :initarg :allow :accessor attr-allow)
   (attr-sandbox :initarg :sandbox :accessor attr-sandbox)
   (attr-name :initarg :name :accessor attr-name)
   (attr-srcdoc :initarg :srcdoc :accessor attr-srcdoc)
   (attr-src :initarg :src :accessor attr-src))
  (:default-initargs
   :tag 'iframe))

(defclass elem-img (elem-global fragment)
  ((attr-vspace :initarg :vspace :accessor attr-vspace)
   (attr-hspace :initarg :hspace :accessor attr-hspace)
   (attr-border :initarg :border :accessor attr-border)
   (attr-align :initarg :align :accessor attr-align)
   (attr-lowsrc :initarg :lowsrc :accessor attr-lowsrc)
   (attr-longdesc :initarg :longdesc :accessor attr-longdesc)
   (attr-name :initarg :name :accessor attr-name)
   (attr-height :initarg :height :accessor attr-height)
   (attr-width :initarg :width :accessor attr-width)
   (attr-usemap :initarg :usemap :accessor attr-usemap)
   (attr-ismap :initarg :ismap :accessor attr-ismap)
   (attr-loading :initarg :loading :accessor attr-loading)
   (attr-fetchpriority :initarg :fetchpriority :accessor attr-fetchpriority)
   (attr-decoding :initarg :decoding :accessor attr-decoding)
   (attr-referrerpolicy :initarg :referrerpolicy :accessor attr-referrerpolicy)
   (attr-crossorigin :initarg :crossorigin :accessor attr-crossorigin)
   (attr-sizes :initarg :sizes :accessor attr-sizes)
   (attr-alt :initarg :alt :accessor attr-alt)
   (attr-srcset :initarg :srcset :accessor attr-srcset)
   (attr-src :initarg :src :accessor attr-src))
  (:default-initargs
   :tag 'img))

(defclass elem-source (elem-global fragment)
  ((attr-height :initarg :height :accessor attr-height)
   (attr-width :initarg :width :accessor attr-width)
   (attr-src :initarg :src :accessor attr-src)
   (attr-sizes :initarg :sizes :accessor attr-sizes)
   (attr-srcset :initarg :srcset :accessor attr-srcset)
   (attr-media :initarg :media :accessor attr-media)
   (attr-type :initarg :type :accessor attr-type))
  (:default-initargs
   :tag 'source))

(defclass elem-picture (elem-global fragment) ()
  (:default-initargs
   :tag 'picture))

(defclass elem-del (elem-global fragment)
  ((attr-datetime :initarg :datetime :accessor attr-datetime)
   (attr-cite :initarg :cite :accessor attr-cite))
  (:default-initargs
   :tag 'del))

(defclass elem-ins (elem-global fragment)
  ((attr-datetime :initarg :datetime :accessor attr-datetime)
   (attr-cite :initarg :cite :accessor attr-cite))
  (:default-initargs
   :tag 'ins))

(defclass elem-wbr (elem-global fragment) ()
  (:default-initargs
   :tag 'wbr))

(defclass elem-br (elem-global fragment)
  ((attr-clear :initarg :clear :accessor attr-clear))
  (:default-initargs
   :tag 'br))

(defclass elem-span (elem-global fragment) ()
  (:default-initargs
   :tag 'span))

(defclass elem-bdo (elem-global fragment) ()
  (:default-initargs
   :tag 'bdo))

(defclass elem-bdi (elem-global fragment) ()
  (:default-initargs
   :tag 'bdi))

(defclass elem-mark (elem-global fragment) ()
  (:default-initargs
   :tag 'mark))

(defclass elem-u (elem-global fragment) ()
  (:default-initargs
   :tag 'u))

(defclass elem-b (elem-global fragment) ()
  (:default-initargs
   :tag 'b))

(defclass elem-i (elem-global fragment) ()
  (:default-initargs
   :tag 'i))

(defclass elem-sup (elem-global fragment) ()
  (:default-initargs
   :tag 'sup))

(defclass elem-sub (elem-global fragment) ()
  (:default-initargs
   :tag 'sub))

(defclass elem-kbd (elem-global fragment) ()
  (:default-initargs
   :tag 'kbd))

(defclass elem-samp (elem-global fragment) ()
  (:default-initargs
   :tag 'samp))

(defclass elem-var (elem-global fragment) ()
  (:default-initargs
   :tag 'var))

(defclass elem-code (elem-global fragment) ()
  (:default-initargs
   :tag 'code))

(defclass elem-time (elem-global fragment)
  ((attr-datetime :initarg :datetime :accessor attr-datetime))
  (:default-initargs
   :tag 'time))

(defclass elem-data (elem-global fragment)
  ((attr-value :initarg :value :accessor attr-value))
  (:default-initargs
   :tag 'data))

(defclass elem-rp (elem-global fragment) ()
  (:default-initargs
   :tag 'rp))

(defclass elem-rt (elem-global fragment) ()
  (:default-initargs
   :tag 'rt))

(defclass elem-ruby (elem-global fragment) ()
  (:default-initargs
   :tag 'ruby))

(defclass elem-abbr (elem-global fragment)
  ((attr-title :initarg :title :accessor attr-title))
  (:default-initargs
   :tag 'abbr))

(defclass elem-dfn (elem-global fragment)
  ((attr-title :initarg :title :accessor attr-title))
  (:default-initargs
   :tag 'dfn))

(defclass elem-q (elem-global fragment)
  ((attr-cite :initarg :cite :accessor attr-cite))
  (:default-initargs
   :tag 'q))

(defclass elem-cite (elem-global fragment) ()
  (:default-initargs
   :tag 'cite))

(defclass elem-s (elem-global fragment) ()
  (:default-initargs
   :tag 's))

(defclass elem-small (elem-global fragment) ()
  (:default-initargs
   :tag 'small))

(defclass elem-strong (elem-global fragment) ()
  (:default-initargs
   :tag 'strong))

(defclass elem-em (elem-global fragment) ()
  (:default-initargs
   :tag 'em))

(defclass elem-a (elem-global fragment)
  ((attr-urn :initarg :urn :accessor attr-urn)
   (attr-rev :initarg :rev :accessor attr-rev)
   (attr-name :initarg :name :accessor attr-name)
   (attr-methods :initarg :methods :accessor attr-methods)
   (attr-shape :initarg :shape :accessor attr-shape)
   (attr-coords :initarg :coords :accessor attr-coords)
   (attr-charset :initarg :charset :accessor attr-charset)
   (attr-referrerpolicy :initarg :referrerpolicy :accessor attr-referrerpolicy)
   (attr-type :initarg :type :accessor attr-type)
   (attr-hreflang :initarg :hreflang :accessor attr-hreflang)
   (attr-rel :initarg :rel :accessor attr-rel)
   (attr-ping :initarg :ping :accessor attr-ping)
   (attr-download :initarg :download :accessor attr-download)
   (attr-target :initarg :target :accessor attr-target)
   (attr-href :initarg :href :accessor attr-href))
  (:default-initargs
   :tag 'a))

(defclass elem-div (elem-global fragment)
  ((attr-align :initarg :align :accessor attr-align))
  (:default-initargs
   :tag 'div))

(defclass elem-search (elem-global fragment) ()
  (:default-initargs
   :tag 'search))

(defclass elem-main (elem-global fragment) ()
  (:default-initargs
   :tag 'main))

(defclass elem-figcaption (elem-global fragment) ()
  (:default-initargs
   :tag 'figcaption))

(defclass elem-figure (elem-global fragment) ()
  (:default-initargs
   :tag 'figure))

(defclass elem-dd (elem-global fragment) ()
  (:default-initargs
   :tag 'dd))

(defclass elem-dt (elem-global fragment) ()
  (:default-initargs
   :tag 'dt))

(defclass elem-dl (elem-global fragment)
  ((attr-compact :initarg :compact :accessor attr-compact))
  (:default-initargs
   :tag 'dl))

(defclass elem-li (elem-global fragment)
  ((attr-type :initarg :type :accessor attr-type)
   (attr-value :initarg :value :accessor attr-value))
  (:default-initargs
   :tag 'li))

(defclass elem-menu (elem-global fragment)
  ((attr-compact :initarg :compact :accessor attr-compact)
   (attr-label :initarg :label :accessor attr-label)
   (attr-type :initarg :type :accessor attr-type))
  (:default-initargs
   :tag 'menu))

(defclass elem-ul (elem-global fragment)
  ((attr-type :initarg :type :accessor attr-type)
   (attr-compact :initarg :compact :accessor attr-compact))
  (:default-initargs
   :tag 'ul))

(defclass elem-ol (elem-global fragment)
  ((attr-compact :initarg :compact :accessor attr-compact)
   (attr-type :initarg :type :accessor attr-type)
   (attr-start :initarg :start :accessor attr-start)
   (attr-reversed :initarg :reversed :accessor attr-reversed))
  (:default-initargs
   :tag 'ol))

(defclass elem-blockquote (elem-global fragment)
  ((attr-cite :initarg :cite :accessor attr-cite))
  (:default-initargs
   :tag 'blockquote))

(defclass elem-pre (elem-global fragment)
  ((attr-width :initarg :width :accessor attr-width))
  (:default-initargs
   :tag 'pre))

(defclass elem-hr (elem-global fragment)
  ((attr-width :initarg :width :accessor attr-width)
   (attr-size :initarg :size :accessor attr-size)
   (attr-noshade :initarg :noshade :accessor attr-noshade)
   (attr-color :initarg :color :accessor attr-color)
   (attr-align :initarg :align :accessor attr-align))
  (:default-initargs
   :tag 'hr))

(defclass elem-p (elem-global fragment)
  ((attr-align :initarg :align :accessor attr-align))
  (:default-initargs
   :tag 'p))

(defclass elem-address (elem-global fragment) ()
  (:default-initargs
   :tag 'address))

(defclass elem-footer (elem-global fragment) ()
  (:default-initargs
   :tag 'footer))

(defclass elem-header (elem-global fragment) ()
  (:default-initargs
   :tag 'header))

(defclass elem-hgroup (elem-global fragment) ()
  (:default-initargs
   :tag 'hgroup))

(defclass elem-h6 (elem-global fragment)
  ((attr-align :initarg :align :accessor attr-align))
  (:default-initargs
   :tag 'h6))

(defclass elem-h5 (elem-global fragment)
  ((attr-align :initarg :align :accessor attr-align))
  (:default-initargs
   :tag 'h5))

(defclass elem-h4 (elem-global fragment)
  ((attr-align :initarg :align :accessor attr-align))
  (:default-initargs
   :tag 'h4))

(defclass elem-h3 (elem-global fragment)
  ((attr-align :initarg :align :accessor attr-align))
  (:default-initargs
   :tag 'h3))

(defclass elem-h2 (elem-global fragment)
  ((attr-align :initarg :align :accessor attr-align))
  (:default-initargs
   :tag 'h2))

(defclass elem-h1 (elem-global fragment)
  ((attr-align :initarg :align :accessor attr-align))
  (:default-initargs
   :tag 'h1))

(defclass elem-aside (elem-global fragment) ()
  (:default-initargs
   :tag 'aside))

(defclass elem-nav (elem-global fragment) ()
  (:default-initargs
   :tag 'nav))

(defclass elem-section (elem-global fragment) ()
  (:default-initargs
   :tag 'section))

(defclass elem-article (elem-global fragment) ()
  (:default-initargs
   :tag 'article))

(defclass elem-body (elem-global fragment)
  ((attr-vlink :initarg :vlink :accessor attr-vlink)
   (attr-topmargin :initarg :topmargin :accessor attr-topmargin)
   (attr-text :initarg :text :accessor attr-text)
   (attr-rightmargin :initarg :rightmargin :accessor attr-rightmargin)
   (attr-marginwidth :initarg :marginwidth :accessor attr-marginwidth)
   (attr-marginheight :initarg :marginheight :accessor attr-marginheight)
   (attr-link :initarg :link :accessor attr-link)
   (attr-leftmargin :initarg :leftmargin :accessor attr-leftmargin)
   (attr-bottommargin :initarg :bottommargin :accessor attr-bottommargin)
   (attr-bgcolor :initarg :bgcolor :accessor attr-bgcolor)
   (attr-alink :initarg :alink :accessor attr-alink))
  (:default-initargs
   :tag 'body))

(defclass elem-style (elem-global fragment)
  ((attr-type :initarg :type :accessor attr-type)
   (attr-title :initarg :title :accessor attr-title)
   (attr-blocking :initarg :blocking :accessor attr-blocking)
   (attr-media :initarg :media :accessor attr-media))
  (:default-initargs
   :tag 'style))

(defclass elem-meta (elem-global fragment)
  ((attr-scheme :initarg :scheme :accessor attr-scheme)
   (attr-http-equiv :initarg :http-equiv :accessor attr-http-equiv)
   (attr-media :initarg :media :accessor attr-media)
   (attr-name :initarg :name :accessor attr-name)
   (attr-content :initarg :content :accessor attr-content)
   (attr-charset :initarg :charset :accessor attr-charset))
  (:default-initargs
   :tag 'meta))

(defclass elem-link (elem-global fragment)
  ((attr-target :initarg :target :accessor attr-target)
   (attr-urn :initarg :urn :accessor attr-urn)
   (attr-rev :initarg :rev :accessor attr-rev)
   (attr-methods :initarg :methods :accessor attr-methods)
   (attr-charset :initarg :charset :accessor attr-charset)
   (attr-fetchpriority :initarg :fetchpriority :accessor attr-fetchpriority)
   (attr-disabled :initarg :disabled :accessor attr-disabled)
   (attr-color :initarg :color :accessor attr-color)
   (attr-blocking :initarg :blocking :accessor attr-blocking)
   (attr-as :initarg :as :accessor attr-as)
   (attr-sizes :initarg :sizes :accessor attr-sizes)
   (attr-imagesizes :initarg :imagesizes :accessor attr-imagesizes)
   (attr-imagesrcset :initarg :imagesrcset :accessor attr-imagesrcset)
   (attr-title :initarg :title :accessor attr-title)
   (attr-referrerpolicy :initarg :referrerpolicy :accessor attr-referrerpolicy)
   (attr-type :initarg :type :accessor attr-type)
   (attr-hreflang :initarg :hreflang :accessor attr-hreflang)
   (attr-integrity :initarg :integrity :accessor attr-integrity)
   (attr-media :initarg :media :accessor attr-media)
   (attr-crossorigin :initarg :crossorigin :accessor attr-crossorigin)
   (attr-rel :initarg :rel :accessor attr-rel)
   (attr-href :initarg :href :accessor attr-href))
  (:default-initargs
   :tag 'link))

(defclass elem-base (elem-global fragment)
  ((attr-target :initarg :target :accessor attr-target)
   (attr-href :initarg :href :accessor attr-href))
  (:default-initargs
   :tag 'base))

(defclass elem-title (elem-global fragment) ()
  (:default-initargs
   :tag 'title))

(defclass elem-head (elem-global fragment)
  ((attr-profile :initarg :profile :accessor attr-profile))
  (:default-initargs
   :tag 'head))

(defclass elem-html (elem-global fragment)
  ((attr-version :initarg :version :accessor attr-version)
   (attr-manifest :initarg :manifest :accessor attr-manifest))
  (:default-initargs
   :tag 'html))

