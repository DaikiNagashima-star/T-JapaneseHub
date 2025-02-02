import { z } from 'zod';

const configSchema = z.object({
  pageId: z.string().min(1, 'Facebook Page ID is required'),
  appId: z.string().min(1, 'Facebook App ID is required')
});

const config = {
  pageId: import.meta.env.PUBLIC_FACEBOOK_PAGE_ID,
  appId: import.meta.env.PUBLIC_FACEBOOK_APP_ID
};

export const facebookConfig = configSchema.parse(config);