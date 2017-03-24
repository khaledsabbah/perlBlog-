use utf8;
package Blog::Schema::perlBlog::Result::Comment;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Blog::Schema::perlBlog::Result::Comment

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<comments>

=cut

__PACKAGE__->table("comments");

=head1 ACCESSORS

=head2 c_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 p_id

  data_type: 'integer'
  is_nullable: 0

=head2 u_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 c_content

  data_type: 'text'
  is_nullable: 0

=head2 created_at

  data_type: 'integer'
  is_nullable: 0

=head2 updated_at

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "c_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "p_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "u_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "c_content",
  { data_type => "text", is_nullable => 0 },
  "created_at",
  { data_type => "integer", is_nullable => 0 },
  "updated_at",
  { data_type => "integer", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</c_id>

=back

=cut

__PACKAGE__->set_primary_key("c_id");

=head1 RELATIONS

=head2 u

Type: belongs_to

Related object: L<Blog::Schema::perlBlog::Result::User>

=cut

__PACKAGE__->belongs_to(
  "users",
  "Blog::Schema::perlBlog::Result::User",
  { id => "u_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

__PACKAGE__->belongs_to(
  "posts",
  "Blog::Schema::perlBlog::Result::Post",
  { id => "p_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-03-24 15:44:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4qKqSTxVJfhZCvFGFRa2DQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
