# frozen_string_literal: true

module Api
  class ChatGpt
    GPT_PROMPT = "
    Stwórz post na fb, że chcesz oddać za darmo ten przedmiot. Przedmiot jest opisany w keywordach. Proszę przeanalizuj je i na podstawie keywordów zgadnij jaki to przedmiot.
    Idealny opis powinien zawierać opis słowny tej rzeczy, np. \"mam do oddania kubek z napisem 'I love Ruby'\".
    - Napisz wymyślone rzeczy/atrybuty w nawiasach kwadratowych, żeby użytkownik mógł je łatwo zmienić.
    - Nie podawaj tagów/hashtagów
    - Nie pisz informacji gdzie się odezwać.
    - Nie wymyślaj za dużo
    - Jeżeli wykryjesz, że ten przedmiot ma rozmiar, to dodaj go do opisu.
    "

    def initialize(message:)
      @message = message
    end

    def call
      client = OpenAI::Client.new

      client.chat(
        parameters: {
          model: 'gpt-4',
          messages: [
            { role: 'system', content: GPT_PROMPT },
            { role: 'user', content: @message }
          ],
          temperature: 0.7
        }
      )
    end
  end
end
