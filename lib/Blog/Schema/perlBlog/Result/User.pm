use utf8;
package Blog::Schema::perlBlog::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Blog::Schema::perlBlog::Result::User

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

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 firstname

  data_type: 'varchar'
  is_nullable: 0
  size: 75

=head2 lastname

  data_type: 'varchar'
  is_nullable: 0
  size: 75

=head2 email

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 password

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 gender

  data_type: 'enum'
  default_value: 'male'
  extra: {list => ["male","female","",""]}
  is_nullable: 0

=head2 created_at

  data_type: 'timestamp'
  datetime_undef_if_invalid: 1
  default_value: current_timestamp
  is_nullable: 0

=head2 updated_at

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 role

  data_type: 'enum'
  default_value: 'guest'
  extra: {list => ["guest","admin","",""]}
  is_nullable: 0

=cut
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "firstname",
  { data_type => "varchar", is_nullable => 0, size => 75 },
  "lastname",
  { data_type => "varchar", is_nullable => 0, size => 75 },
  "email",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "password",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "gender",
  {
    data_type => "enum",
    default_value => "male",
    extra => { list => ["male", "female", "", ""] },
    is_nullable => 0,
  },
  "created_at",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "updated_at",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
  },
  "role",
  {
    data_type => "enum",
    default_value => "guest",
    extra => { list => ["guest", "admin", "", ""] },
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 comments

Type: has_many

Related object: L<Blog::Schema::perlBlog::Result::Comment>

=cut

__PACKAGE__->has_many(
  "comments",
  "Blog::Schema::perlBlog::Result::Comment",
  { "foreign.u_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 posts

Type: has_many

Related object: L<Blog::Schema::perlBlog::Result::Post>

=cut

__PACKAGE__->has_many(
  "posts",
  "Blog::Schema::perlBlog::Result::Post",
  { "foreign.u_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-03-24 15:44:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:l6p2oEA1E+D9ZAiM/6l9LA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
