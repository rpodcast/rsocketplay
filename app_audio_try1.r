library(brochure)
library(shiny)
library(wavesurfer)

brochureApp(
  # First page
  page(
    href = "/",
    ui = fluidPage(
      h1("This is my first page"),
      actionButton("play", "Play Audio"),
      tags$audio(
        autoplay = NA,
        controls = NA,
        src = "mk2_fatal1_export.mp3",
        type = "audio/mp3"
      )
      #wavesurferOutput("my_ws")
    ),
    server = function(input, output, session) {
      trigger <- reactiveVal(rnorm(1))

      # observeEvent(trigger(), {
      #   message("hi")
      #   browser()
      #   insertUI(selector = "#play",
      #        where = "afterEnd",
      #        ui = tags$audio(src = "mk2_fatal1_export.mp3", type = "audio/mp3", autoplay = NA , controls = NA, style="display:none;")  
      #   )
      # })
      # output$my_ws <- renderWavesurfer({
      #   wavesurfer(
      #     audio = "mk2_fatal1_export.mp3") %>%
      #     #audio = "story_time_rpodcast.mp3") %>%
      #     #audio = "http://ia902606.us.archive.org/35/items/shortpoetry_047_librivox/song_cjrg_teasdale_64kb.mp3") %>%
      #     ws_set_wave_color('#5511aa') %>%
      #     ws_spectrogram() %>%
      #     ws_cursor()
      # })
    }
  ), 
  # Second page, without any server-side function
  page(
    href = "/page2", 
    ui =  fluidPage(
      h1("This is my second page"), 
      tags$p("There is no server function in this one")
    )
  )
)