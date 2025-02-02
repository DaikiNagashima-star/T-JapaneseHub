-- Add new columns for house listings
ALTER TABLE listings
ADD COLUMN IF NOT EXISTS available_date date,
ADD COLUMN IF NOT EXISTS bedrooms text,
ADD COLUMN IF NOT EXISTS bathrooms text,
ADD COLUMN IF NOT EXISTS pet_policy text,
ADD COLUMN IF NOT EXISTS utilities text[],
ADD COLUMN IF NOT EXISTS features text[];

-- Add new columns for market listings
ALTER TABLE listings
ADD COLUMN IF NOT EXISTS condition text,
ADD COLUMN IF NOT EXISTS brand text,
ADD COLUMN IF NOT EXISTS model text,
ADD COLUMN IF NOT EXISTS original_price numeric;

-- Add new columns for job listings
ALTER TABLE listings
ADD COLUMN IF NOT EXISTS employment_type text,
ADD COLUMN IF NOT EXISTS experience_level text,
ADD COLUMN IF NOT EXISTS benefits text[],
ADD COLUMN IF NOT EXISTS deadline date;