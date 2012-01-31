module MainHelper
  def error_messages_for(object)
    if object.errors.any?
      content_tag(:ul, object.errors.full_messages.map {|msg| content_tag(:li, msg)}.join.html_safe, :class => :error_messages)
    end
  end

	def conditional_html( lang = "en", &block )
		haml_concat Haml::Util::html_safe <<-"HTML".gsub( /^\s+/, '' )
			<!--[if lt IE 7 ]>              <html lang="#{lang}" class="no-js ie ie6"> <![endif]-->
			<!--[if IE 7 ]>                 <html lang="#{lang}" class="no-js ie ie7"> <![endif]-->
			<!--[if IE 8 ]>                 <html lang="#{lang}" class="no-js ie ie8"> <![endif]-->
			<!--[if IE 9 ]>                 <html lang="#{lang}" class="no-js ie ie9"> <![endif]-->
			<!--[if (gte IE 9)|!(IE)]><!--> <html lang="#{lang}" class="no-js"> <!--<![endif]-->      
		HTML
		haml_concat capture( &block ) << Haml::Util::html_safe( "\n</html>" ) if block_given?
	end
end
