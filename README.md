# S3Streamer

Send your files to the end user by streaming them from S3

## Usage

### Installation

Add the gem to your Gemfile and Bundle :

```ruby
gem "s3streamer"
```

Install initializer file :

```bash
rails generate s3streamer:install
```

Edit the initializer file with your AWS S3 credentials and your bucket name,
and restart your server.
**Note**: You can avoid setting your bucket if you pass it directly to the
`#stream_file` method options.

### Controller

Now, you can use the `#stream_file` method in your controllers.

```ruby
def download
  stream_file("file/key.ext")
end
```

It can also accept a Paperclip::Attachment object. This method will
automatically add "content_type=xxx/xxx" to the Content-Disposition HTTP
response header.

```ruby
def download
  model = Model.find(params[:id])
  stream_file(model.file)
end
```

There also are options that you can pass :

```ruby
def download
  stream_file("file/key.ext", {
    name: "File name to be used.pdf",
    content_type: "application/pdf",
    bucket: "your_bucket"
  })
end
```
