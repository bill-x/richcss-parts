require 'json'
require 'rest-client'
require 'uri'
require 'zipruby'

module Richcss
  class Part
    attr_accessor :name

    # placeholder for latest version is blank
    def self.resolve_dependencies(part_name, version='', installed={})
      dep_list = Richcss::Resolver.start(part_name, version, installed)
    end

    def self.get_or_create_partfile()
      part_file = "Partfile"
      parts = Hash.new

      begin
        File.open(part_file, "r") do |f|
          f.each_line do |line|
          part, version = line.split(" ")
            parts[part] = version
          end
        end
      rescue
        File.new(part_file, "w")
      end

      return parts
    end

    # Fetch url and download the part
    def self.fetch(part_name, version='')
      puts "Fetching part #{part_name}"

      begin
        resp = RestClient.get "http://localhost:3000/api/part/#{part_name}"
        if resp.code == 200
          body = JSON.parse(resp.to_str)
          homepage = body["homepage"]
          homepage.slice! "https:\/\/github.com\/"
          homepage = homepage.split("\/")
          repo_owner = homepage[0]
          repo_name = homepage[1]
          jsonResponse = JSON.parse(Net::HTTP.get(URI("https://api.github.com/repos/#{repo_owner}/#{repo_name}/releases/tags/v#{body["version"]}")))
          downloadLink = jsonResponse["zipball_url"]
          install(downloadLink)
        end
      rescue RestClient::ExceptionWithResponse => e
        puts e.response
      end 
    end

    # Install this part
    def self.install(resource)
      uri = URI.parse(resource)

      http_object = Net::HTTP.new(uri.host, uri.port)
      http_object.use_ssl = true if uri.scheme == 'https'
      begin
        http_object.start do |http|
          request = Net::HTTP::Get.new uri.request_uri
          http.read_timeout = 500
          http.request request do |response|
            case response
            when Net::HTTPRedirection then
              location = response['location']
              install(location)
            else
              puts "Installing part..."

              # TODO make verifier class do this
              if !Dir.exists?('parts')
                FileUtils.mkdir_p('parts')
              end

              Dir.chdir('parts') do
                Zip::Archive.open_buffer(response.body) do |ar|

                   #save the directory name for rename later
                   oldDirName = ar.get_name(0)

                   ar.each do |zf|
                      if zf.directory?
                         FileUtils.mkdir_p(zf.name)
                      else
                         dirname = File.dirname(zf.name)
                         FileUtils.mkdir_p(dirname) unless File.exist?(dirname)
                         open(zf.name, 'wb') do |f|
                            f << zf.read
                         end
                      end
                   end

                   FileUtils.mv oldDirName, name

                end
              end
            end
          end
        end
      rescue Exception => e
        puts e
      end
    end

  end
end
