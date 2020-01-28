#!/usr/bin/perl

use CGI qw/:standard/;


print 
        header,
	start_html('Un exemple de formulaire'),
	h1('Un exemple de formulaire'),
	start_form( -method => "GET", -action => "index.pl" ),
	"Quel est votre nom ? ",textfield('name'),p,
	"Quel est votre combinaison favorite ? ", p,
	checkbox_group(
		-name=>'words',
      		-values=>['am','stram','gram','pic', 'colegram'],
      		-defaults=>['gram','pic']), p,
	"Quelle est votre couleur pr&eacute;f&eacute;r&eacute;e ? ", 
	popup_menu(
		-name=>'color',
  		-values=>['rouge','vert','bleu','jaune', 'magenta', 'cyan']),p,
	submit,
	end_form,
	hr;

if (param()) {
	my $name      = param('name');
	my $keywords  = join ', ',param('words');
	my $color     = param('color');
	print 
		"Votre nom est ", em($name), p,
		"Votre combinaison est : ",em(escapeHTML($keywords)),p,
		"Votre couleur favorite est le ",em(escapeHTML($color)),
		hr;
}
