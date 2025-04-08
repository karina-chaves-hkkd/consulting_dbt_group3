with

artists as (

    select * from BOARDGAME.RAW.artists

),

final as (

    select
        game_id as boardgame_id,
        case
            when artists = '0' then '{{ var("unknown") }}'
            else artists
        end as artist_name

    from artists

)

select * from final