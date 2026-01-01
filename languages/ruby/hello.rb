# frozen_string_literal: true

# Hello world, Ruby edition: a tour of the syntax.
require 'json'
require 'set'

module Greeter
  VERSION = '1.1.0'

  def greet(name = 'world')
    "hello, #{name}!!"
  end
end

class Speaker
  include Greeter
  include Comparable

  attr_reader :name, :times
  attr_accessor :level

  @@count = 0

  def initialize(name, level: :quiet)
    @name = name
    @level = level
    @times = 0
    @@count += 1
  end

  def <=>(other)
    name <=> other.name
  end

  def speak
    @times += 1
    msg = greet(@name)
    @level == :loud ? msg.upcase : msg
  end

  def self.count
    @@count
  end

  private

  def secret
    :hidden
  end
end

speakers = %w[world welt monde].map.with_index do |n, i|
  Speaker.new(n, level: i.even? ? :loud : :quiet)
end

pattern = /^h(?<rest>ello)\s+(\w+)$/i
squares = (1..5).select(&:odd?).map { |x| x**2 }
data = { 'en' => 'hello', de: 'hallo', 'numbers' => [1, 2.5, 0x1F, nil, true] }

begin
  speakers.sort.each { |s| puts s.speak }
  puts JSON.pretty_generate(data), squares.inspect, pattern.match?('hello world')
rescue StandardError => e
  warn "failed: #{e.message}"
ensure
  puts <<~TEXT
    done with #{Speaker.count} speakers
  TEXT
end
