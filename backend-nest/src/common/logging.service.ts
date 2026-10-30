import { Injectable, LoggerService } from '@nestjs/common';

@Injectable()
export class SafeLogger implements LoggerService {
  log(message: string, context?: string): void { console.log(JSON.stringify({ level: 'info', context, message })); }
  error(message: unknown, trace?: string, context?: string): void {
    const error = message instanceof Error ? message : undefined;
    console.error(JSON.stringify({ level: 'error', context, message: error?.message ?? String(message), trace: trace ? '[omitted]' : undefined }));
  }
  warn(message: string, context?: string): void { console.warn(JSON.stringify({ level: 'warn', context, message })); }
  debug(message: string, context?: string): void { if (process.env.NODE_ENV !== 'production') console.debug(JSON.stringify({ level: 'debug', context, message })); }
  verbose(message: string, context?: string): void { if (process.env.NODE_ENV !== 'production') console.debug(JSON.stringify({ level: 'verbose', context, message })); }
}
