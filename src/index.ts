import { registerPlugin } from '@capacitor/core';

import type { WalkMeSDKPlugin } from './definitions';

const WalkMeSDK = registerPlugin<WalkMeSDKPlugin>('WalkMeSDKPlugin', {});

export * from './definitions';
export { WalkMeSDK };
