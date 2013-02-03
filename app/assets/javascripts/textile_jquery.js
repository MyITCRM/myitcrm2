// An unobtrusive Textile editor in jQuery
// Inspired by: http://slateinfo.blogs.wvu.edu/plugins/textile_editor_helper
// 
// Usage:
//  $(function() {
//    $('textarea.textile').textilize();
//  )(jQuery);
//
(function($) {
  $.textileEditor = function(textarea, options) {
    $.textileEditor.init(textarea, options)
    $.textileEditor.setup()
    $.textileEditor.draw()
    $.textileEditor.activate()
  }
  
  $.textileEditor.settings = {
    toolbarClass: 'textile-toolbar',
    buttonSeparator: ''
  }
  
  $.extend($.textileEditor, {
    init: function(textarea, options) {
      $.textileEditor.self = $(textarea)
      $.textileEditor.textarea = $.textileEditor.self[0]
      $.extend($.textileEditor.settings, options || {})
    },
    
    setup: function() {
      var $b = $.textileEditor.buttons
      
      // only the buttons you want (note: you'll need icons to match)
      $b.push(new $.textileEditor.Button('te_strong', 'bold.png', '**','**', 'Bold'))
      $b.push(new $.textileEditor.Button('te_emphasis', 'italic.png', '_', '_', 'Italicize'))
      $b.push(new $.textileEditor.Button('te_block', 'text_indent.png', '> ', '\n', 'Blockquote'))
//      $b.push(new $.textileEditor.Button('te_strike', 'strikethrough.png', '`', '`', 'Strikethrough'))
      $b.push(new $.textileEditor.Button('te_ol', 'list-numeric.png', '1. ', ' ', 'Numbered List'))
      $b.push(new $.textileEditor.Button('te_ul', 'list-bullet.png', '* ', ' ', 'Bulleted List'))
      $b.push(new $.textileEditor.Button('te_h1', 'h1.png', '# ', ' ', 'Header 1'))
      $b.push(new $.textileEditor.Button('te_h2', 'h2.png', '## ', ' ', 'Header 2'))
      $b.push(new $.textileEditor.Button('te_h3', 'h3.png', '### ', ' ', 'Header 3'))
      $b.push(new $.textileEditor.Button('te_h4', 'h4.png', '#### ', ' ', 'Header 4'))
      $b.push(new $.textileEditor.Button('te_h5', 'h5.png', '##### ', ' ', 'Header 5'))
      $b.push(new $.textileEditor.Button('te_h6', 'h6.png', '###### ', ' ', 'Header 6'))
      $b.push(new $.textileEditor.Button('te_p', 'link.png', '[', '](http://example.com/) ', 'Link'))
      $b.push(new $.textileEditor.Button('te_underline', 'code.png', '`', '`', 'Code'))

    },
    
    draw: function() {
      var buttons = $.map($.textileEditor.buttons, function(button) {
        var img  = '<img src="/assets/' + button.img + '" />',
//        var img  = '<i class="' + button.img + '"></i>',
            link = '<a href="#" title="' + button.title + '" start="' + button.start + '" end="' + button.end + '">' + img + '</a>',
            span = '<span id="' + button.id + '" class="btn btn-mini">' + link + '</span>'
            
        return [span]
      }).join($.textileEditor.settings.buttonSeparator)
      
      var toolbar = $('<div class=" btn-group btn-toolbar" />').append(buttons)
      
      return $.textileEditor.self.before(toolbar)
    },
    
    activate: function() {
      function buttonHandler() {
        var textilized = $.textileEditor.process(this, $.textileEditor.selectedText())
        $.textileEditor.reconstruct(textilized)
        return false
      }
      
      $('div.btn-toolbar a').click(buttonHandler)
    }
  })
  
  $.textileEditor.process = function(button, text) {
    var addSpaceToEnd = false
    
    if (text.match(/\s$/)) addSpaceToEnd = true
    
//    if (text === undefined || text == '') return ''
//    if (text === undefined || text == '' || text.length == 0) return ''

    var startTag = $(button).attr('start'), endTag = $(button).attr('end'), escape = '',
      list = startTag.match(/^(#|\*)/g) && (endTag.match(/\n$/) || endTag.length == 0)
    
      if (startTag.match(/\*|\+|\[|\__/)) escape = '\\'

    var re_start = new RegExp('^' + escape + startTag), re_end = new RegExp(escape + endTag + '$')
    
    // remove tags if they exist
//    if (list && text.match(re_start)) {
//      return $.map(text.split('\n'), function(line) {
//        return [line.replace(startTag, '')]
//      }).join('\n')
//    } else if (text.match(re_start)) {
//      return text.replace(re_start, '').replace(re_end, '')
//    }
//
    if (list) {
      // multi-line elements: ul, ol
      return $.map(text.split('\n'), function(line) {
        return [startTag + line]
      }).join('\n')
    }

    if (addSpaceToEnd) {
          text = text.replace(/\s$/, '')
          endTag = endTag + ' '
        }

    return (startTag + text + endTag)
  }
//
  $.textileEditor.reconstruct = function(processed) {
    var $ta = $.textileEditor.textarea
        
    if (document.selection) {
      var placeholder = '#$%-PLACEHOLDER-%$#',
          tr = document.selection.createRange()
      
      // replace selected text with placeholder
      tr.text = placeholder
      // split to get beginning/end text
      surrounding_text = $ta.value.split(placeholder);
      // reposition cursor
      tr.moveStart('character', -placeholder.length);
      
      $ta.value = surrounding_text[0] + processed + surrounding_text[1]
      $ta.focus()
    } else {
      var startPosition = $.textileEditor.Selection.start(), 
          endPosition = $.textileEditor.Selection.end()

      $ta.value = ($ta.value.substring(0, startPosition) + processed
        + $ta.value.substring(endPosition, $ta.value.length))

      $ta.focus()
      $ta.setSelectionRange(startPosition + processed.length, startPosition + processed.length)
    }
  }
  
  $.textileEditor.Selection = {
    start: function() {
      return $.textileEditor.textarea.selectionStart
    },
    end: function() {
      return $.textileEditor.textarea.selectionEnd
    }
  }
  
  $.textileEditor.selectedText = function() {
    if (document.selection) {
      return document.selection.createRange().text
    } else {
      return $.textileEditor.textarea.value.substring($.textileEditor.Selection.start(), $.textileEditor.Selection.end())
    }
  }
  
  $.textileEditor.buttons = new Array()
  
  // button attributes
  $.textileEditor.Button = function(id, img, start, end, title) {
    this.id = id
    this.img = img
    this.start = start
    this.end = end
    this.title = title
  }
  
  // the plugin
  $.fn.textilize = function(options) {
    return this.each(function() {
      $.textileEditor(this, options)
    })
  }
})(jQuery);