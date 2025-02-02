/*
  # Fix listings table setup

  This migration ensures the listings table is properly created and seeded.
  It uses DO blocks to handle table creation idempotently.
*/

DO $$ 
BEGIN
  -- Create the listings table if it doesn't exist
  IF NOT EXISTS (SELECT FROM pg_tables WHERE schemaname = 'public' AND tablename = 'listings') THEN
    CREATE TABLE public.listings (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      category text NOT NULL CHECK (category IN ('house', 'market', 'job', 'others')),
      title text NOT NULL,
      description text NOT NULL,
      price numeric,
      image text NOT NULL,
      location jsonb NOT NULL,
      contact jsonb NOT NULL,
      amenities text[],
      created_at timestamptz DEFAULT now(),
      user_id uuid REFERENCES auth.users(id)
    );

    -- Enable RLS
    ALTER TABLE listings ENABLE ROW LEVEL SECURITY;

    -- Create policies
    CREATE POLICY "Anyone can view listings"
      ON listings FOR SELECT
      TO public
      USING (true);

    CREATE POLICY "Authenticated users can create listings"
      ON listings FOR INSERT
      TO authenticated
      WITH CHECK (auth.uid() = user_id);

    CREATE POLICY "Users can update own listings"
      ON listings FOR UPDATE
      TO authenticated
      USING (auth.uid() = user_id)
      WITH CHECK (auth.uid() = user_id);

    CREATE POLICY "Users can delete own listings"
      ON listings FOR DELETE
      TO authenticated
      USING (auth.uid() = user_id);
  END IF;
END $$;