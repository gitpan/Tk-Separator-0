
package Tk::Separator;

use strict;
use vars qw($VERSION);
use Carp;
use Tk;
use base qw(Tk::Derived Tk::Frame);

$VERSION = '0.40';

Construct Tk::Widget 'Separator';

sub Populate
{
	my ($widget, $args) = @_;

	$widget->{'-orient'} = delete $args->{-orient} || 'horizontal';

	$widget->SUPER::Populate($args);



	# frame used to pad the two colored lines that make the separator:
	my $frame = $widget->Frame();

	if ($widget->{'-orient'} =~ /^horizontal$/i)
	{
		# add the horizontal bar:
		$frame->Frame(
			-background => 'SystemDisabledText'
		)->pack(-side => 'top', -fill => 'x');

		$frame->Frame(
			-background => 'SystemButtonHighlight'
		)->pack(-side => 'top', -fill => 'x');

		# pad the top and bottom parts of the bar:
		$frame->pack(-fill => 'both', -expand => 1, -pady => 3);
	}
	elsif ($widget->{'-orient'} =~ /^vertical$/i)
	{
		# add the vertical bar:
		$frame->Frame(
			-background => 'SystemDisabledText'
		)->pack(-side => 'left', -fill => 'y');

		$frame->Frame(
			-background => 'SystemButtonHighlight'
		)->pack(-side => 'left', -fill => 'y');

		# pad the left and right parts of the bar:
		$frame->pack(-fill => 'both', -expand => 1, -padx => 3);
	}
}

1;
