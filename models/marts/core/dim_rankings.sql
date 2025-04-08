{{
    config(
        materialized='incremental',
        unique_key='ranking_key',
        incremental_statregy='merge',
        merge_update_columns=['vt', 'ic']
    )
}}

with boardgames_filtered as (
    select * from {{ ref('int_boardgames__boardgames_filtered') }}
),

rankings as (
    select * from {{ ref('stg_boardgames__rankings') }}
),

dim_rankings as (
    select
        {{ dbt_utils.generate_surrogate_key(['boardgame_rank', 'rankings.boardgame_id', 'updated_at']) }}as ranking_key,
        {{ dbt_utils.generate_surrogate_key(['rankings.boardgame_id']) }} as boardgame_key,
        boardgame_rank as br,
        boardgame_total_reviews as btr,
        boardgame_url as u,
        boardgame_thumbnail as b_th,
        updated_at as upd_at,
        valid_from,
        valid_to as vt,
        is_current as ic

    from rankings
    where boardgame_id in (select boardgame_id from boardgames_filtered)
)

select * from dim_rankings

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  -- (uses >= to include records arriving later than the previous 3 days)
  where upd_at > dateadd(day, -3, current_date)

{% endif %}