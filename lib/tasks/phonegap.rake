ENV_MAP = {
    test: 'http://localhost:3010',
    development: 'http://localhost:3000',
    production: 'http://shrouded-sierra-7695.herokuapp.com'
}
ENV['API_PREFIX'] ||= ENV_MAP[ENV['PENV'].to_sym]

ROOT = "#{Rails.root}/phonegap/#{ENV['PENV']}/www"
ASSETS = "#{ROOT}/assets"
REGEX = /(-{1}[a-z0-9]{32}*\.{1}){1}/

def nondigested(source)
  source.gsub(REGEX, '.')
end

def nondigesting
  puts 'nondigesting..'
  assets = Dir.glob(File.join(Rails.root, 'public/assets/**/*'))
  assets.each do |file|
    source = file.split('/')
    next if File.directory?(file) || file !~ REGEX || file =~ /gz$/
    target = "#{ROOT}/#{source[source.index('assets')..-1].join('/')}".split('/')
    target.push(nondigested(target.pop))
    non_digested = File.join(target)
    FileUtils.mkdir_p(File.dirname(non_digested))
    puts "writing asset to #{non_digested}"
    FileUtils.cp(file, non_digested)
    if non_digested =~ /(js|css|html)$/
      text = nondigested IO.read(non_digested)
      File.write non_digested, text
    end
  end
end

def prepare_layout
  puts 'prepare_layout..'
  File.open "#{ROOT}/index.html", 'w' do |index|
    text = nondigested Typhoeus::Request.new(ENV['API_PREFIX']).run.body
    raise "Given empty layout. Perhaps there is no answer from #{ENV['API_PREFIX']}" if text.empty?
    text.gsub! /\/(stylesheets|images|javascripts)/, 'assets'
    text.gsub! /\/(?=(#\/|assets))/, ''
    index.write text.to_s.force_encoding('UTF-8')
  end
end

def prepare_templates
  puts 'prepare_angular_templates..'
  %x[rm -rf #{ASSETS}/angular]
  %w(new.css angular_templates.js application.js).each do |file_name|
    path = "#{ASSETS}/#{file_name}"
    text = IO.read(path)
    text.gsub! /(?<=[^"])\$(?=([^"]+\.html(&quot;)?"))/, '/'
    text.gsub!(/(?<=templateUrl:|ng-include=)\s?"(&#39;)?.+\$(?=.+")/) {|match| match.sub('$', '/') } if file_name =~ /\.js/
    text.gsub!(/\/(assets|fonts|images|#\/)/) {|match| match.sub('/', '')}
    text.gsub!(/(?<=background-image|background):url\(assets\//) {|match| match.sub('assets/', '')} if file_name == 'new.css'
    File.write path, text
  end
end

def addition
  puts 'addition..'
  %w(fonts images).each {|dir| %x[cp -R public/#{dir} #{ASSETS}]}
  %w(locale).each {|dir| %x[cp -R public/#{dir} #{ROOT}]}
  Dir.glob("#{ROOT}/locale/**").each do |locale|
    text = IO.read(locale)
    text.gsub! /\/images/, 'assets/images'
    File.write locale, text
  end
end

def build_android
  #  type our normal password when you are answered "Enter Passphrase for keystore:"
  Dir.chdir("phonegap/#{ENV['PENV']}") do
    puts %x[phonegap build --release android]
    puts %x[cp platforms/android/build/outputs/apk/android-release-unsigned.apk builds/WalletOnpay_unaligned.apk]
  end
  Dir.chdir("phonegap/#{ENV['PENV']}/builds") do
    puts %x[rm WalletOnpay.apk]
    puts %x[jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore release-key.keystore WalletOnpay_unaligned.apk wallet_onpay]
    puts %x[zipalign -v 4 WalletOnpay_unaligned.apk WalletOnpay.apk]
  end
end

def build_ios
  Dir.chdir("phonegap/#{ENV['PENV']}") do
    puts %x[phonegap build ios]
  end
end

namespace :phonegap do
  task(nondigesting: :environment) { nondigesting }
  task(prepare_layout: :environment) { prepare_layout }
  task(prepare_templates: :environment) { prepare_templates }
  task(addition: :environment) { addition }
  task(build: :environment) do
    build_android
    build_ios
  end
  namespace :build do
    task(android: :environment) { build_android }
    task(ios: :environment) { build_ios }
  end
end


task phonegap: :environment do
  if Rails.env.development?
    %x[rm -rf tmp/cache]
    %x[RAILS_ENV=development bundle exec rake assets:precompile]
    nondigesting
    %x[rm -rf public/assets]
  else
    nondigesting
  end
  prepare_layout
  #prepare_templates
  #addition
end