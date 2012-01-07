use strict;
use warnings;
package POE::Queue::Hash;

# ABSTRACT: a priority queue based on a hash of arrays.

use parent qw/List::Priority POE::Queue/;
use List::Util 'min';

sub new {
	my ($class, @args) = @_;
	my $self = $class->SUPER::new(@args);
	$self->{options}{next_id} = 0;
	return $self;
}

sub enqueue {
	my ($self, $priority, $payload) = @_;
	my $next_id = $self->{options}{next_id}++;
	$self->insert($priority, [$next_id, $payload]);
	return $next_id;
}

sub dequeue_next {
	my ($self) = @_;
	my ($priority, my $stuff) = $self->shift2();
	return ($priority, $stuff->[0], $stuff->[1]);
}

sub get_next_priority {
	my ($self) = @_;
	return undef unless $self->size > 0;
	my $next_priority = min(keys %{$self->{queues}});
	return $next_priority;
}

sub get_item_count {
	my ($self) = @_;
	return $self->size;
}

sub remove_item {
# XXX implement me!
	return undef;
}

sub remove_items {
# XXX implement me!
	return qw/Fred Barney Betty Wilma/;
}

sub peek_items {
# XXX implement me!
	return qw/Fred Barney Betty Wilma/;
}

sub adjust_priority {
# XXX implement me!
	$! = "adjust_priority has not yet been implemented";
	return undef;
}

sub set_priority {
# XXX implement me!
	$! = "adjust_priority has not yet been implemented";
	return undef;
}

1;
